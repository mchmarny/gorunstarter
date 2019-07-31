PROJECT=$(gcloud config get-value project)
PROJECT_NUM=$(gcloud projects describe ${PROJECT} --format="value(projectNumber)")
SERVICE_URL=$(gcloud beta run services describe twitter-query --region us-central1 --format="value(status.domain)")

.PHONY: app client service

all: test

# DEV
run:
	go run main.go  -v

test:
	go test ./... -v

query:
	curl -H "Content-Type: application/json" \
		 -X POST -d '{"query":"serverless"}' http://localhost:8080/

# BUILD
mod:
	go mod tidy
	go mod vendor

image: mod
	gcloud builds submit \
      --project cloudylabs-public \
	  --tag gcr.io/cloudylabs-public/twitter-to-pubsub-event-pump:0.4.2

# DEPLOY
auth:
	gcloud projects add-iam-policy-binding twitter-query \
    	--member="serviceAccount:service-${PROJECT_NUM}@gcp-sa-pubsub.iam.gserviceaccount.com" \
    	--role="roles/iam.serviceAccountTokenCreator"

	gcloud iam service-accounts create twitter-query-sa \
		--display-name "Twitter Query Demo Service Account"

	gcloud beta run services add-iam-policy-binding twitter-query \
		--member=serviceAccount:twitter-query-sa@${PROJECT}.iam.gserviceaccount.com \
		--role=roles/run.invoker

service:
	gcloud beta run deploy twitter-query \
		--image=gcr.io/cloudylabs-public/twitter-to-pubsub-event-pump:0.4.2 \
		--region=us-central1 \
		--platform=managed \
		--timeout=15m \
		--set-env-vars="T_CONSUMER_KEY=$(T_CONSUMER_KEY),T_CONSUMER_SECRET=$(T_CONSUMER_SECRET),T_ACCESS_TOKEN=$(T_ACCESS_TOKEN),T_ACCESS_SECRET=$(T_ACCESS_SECRET)"

serviceless:
	gcloud beta run services delete twitter-query

schedule:
	gcloud alpha pubsub topics create twitter-query-topic

	gcloud scheduler jobs create pubsub twitter-query-schedule \
		--description="Twitter Query Demo Schedule" \
		--topic="twitter-query-topic" \
	 	--schedule="every 10 mins" \
		--message-body-from-file="query.json"

	gcloud beta pubsub subscriptions create twitter-query-sub \
		--topic twitter-query-topic \
		--push-endpoint="${SERVICE_URL}/" \
		--push-auth-service-account="twitter-query-sa@${PROJECT}.iam.gserviceaccount.com"
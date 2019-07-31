# gorunstarter

Simple [Cloud Run](https://cloud.google.com/run/) golang starter project

## Audience

This repository is meant to be for developers starting with [Cloud Run](https://cloud.google.com/run/).

## Usage

The `gorunstarter` demonstrates the initial developer workflow of creating new project and deploying it to Cloud Run.

[Building image](bin/build-container-image)

```shell
bin/build-container-image
```

[Creating service account](bin/create-service-account)

```shell
bin/create-service-account
```

[Deploying Cloud Run service](bin/deploy-cloud-run-service)

```shell
deploy-cloud-run-service
```

## Cleanup

To cleanup all resources created by this sample execute

```shell
bin/cleanup
```




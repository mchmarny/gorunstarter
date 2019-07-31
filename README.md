# gorunstarter

Simple [Cloud Run](https://cloud.google.com/run/) `go` starter project meant to be used as a GitHub repository template.

## Audience

For [Cloud Run](https://cloud.google.com/run/) developers wanting to quickly start their `go` service development from a well-structured template with minimal amount of external dependencies.

> This is not an official or standard Cloud Run project layout, just a set of common initial bits that are helpful to me

## Setup

1. Fork this repo into your account

![](https://github-images.s3.amazonaws.com/help/bootcamp/Bootcamp-Fork.png)

2. In your newly forked repo settings, check the Template repository box

![](https://help.github.com/assets/images/help/repository/template-repository-checkbox.png)

3. Whenever creating a new Cloud Run service, just "use this template"

![](https://help.github.com/assets/images/help/repository/use-this-template-button.png)


## Usage

The `gorunstarter` includes the three basic steps of Cloud Run developer workflow. You can click on the below links to see the content of these commands:

[Building a container image](bin/build-container-image)

```shell
bin/build-container-image
```

[Creating a service account for Cloud Run service](bin/create-service-account)

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

## Disclaimer

This is my personal project and it does not represent my employer. I take no responsibility for issues caused by this code. I do my best to ensure that everything works, but if something goes wrong, my apologies is all you will get.
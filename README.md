# gorunstarter

Simple [Cloud Run](https://cloud.google.com/run/) golang project meant to be used as a GitHub repository template.

## Audience

This repository is meant [Cloud Run](https://cloud.google.com/run/) developers wanting to quickly start with their go service development from well-structured template. It's by no means an official standard project layout but rather it focuses on balance between ease of use and maximum pre-configured code and tools.

## Setup

1. Fork this repo into your account

![](https://github-images.s3.amazonaws.com/help/bootcamp/Bootcamp-Fork.png)

2. In your newly forked repo settings, check the Template repository box

![](https://help.github.com/assets/images/help/repository/template-repository-checkbox.png)

3. Whenever creating a new Cloud Run service, just "use this template"

![](https://help.github.com/assets/images/help/repository/use-this-template-button.png)


## Usage

The `gorunstarter` includes the three basic steps of Cloud Run developer workflow:

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




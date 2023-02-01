# Docker Based Azure DevOps Build Agent using KEDA Scaling

This repository contains an [agent Dockerfile](./src/azdo_build_agent/) and a [Helm chart](./helm/azdo-build-agent/) to deploy a Docker based Azure DevOps Build Agent using [KEDA Scaling](https://keda.sh/docs/2.8/scalers/azure-pipelines/).

A set of [bicep scripts](./infrastructure/core/) are also included to deploy an Azure Kubernetes Cluster (AKS) and an Azure Container Registry (ACR).
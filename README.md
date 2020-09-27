## Exposing a Private Application Load Balancer with AWS HTTP API

Using AWS's new HTTP API Gateway along with a VPC Private Link to expose a private
ALB. The ALB is used to expose two ecs services. Medium article can be found here:

https://medium.com/@kpiroddi/securing-your-containerised-entry-point-with-aws-http-apis-cognito-vpc-link-alb-e6c5e2116e26

## Technical Architecture Diagram
![Alt text](./arch.png?raw=true "Technical Architecture Diagram")

# Infrastructure

Infrastructure folder contains Terraform and Terragrunt file used to deploy the 
aws resources seen in above diagram

## Repo structure

### **modules**

Folder contains reusable modules that contains a collection of aws

resources that are deployed together. Eg:

### **cicd**

Create all the aws resources need for a fully functional cicd pipeline

- codebuild
- codepipeline
- s3
- kms
- pull secret from secret manger


## **live**

This folder contains terragrunt code that is used to deploy the modules 
into different environment 

Eg:

The cicd module can be used multiple times to create 
pipelines for each microservices, by just changing variable parameters

# Microservices

Microservice folder contains two simple spring-boot applications used as dummy applications 
for deming the described architecture


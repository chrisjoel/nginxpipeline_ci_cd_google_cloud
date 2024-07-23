This project sets up and deploys infrastructure using Terraform, and configures a CI/CD pipeline with GitHub Actions. The deployed application is a PHP-FPM application running on Docker and Nginx.


#Prerequisites
- Terraform installed on vscode
- Google Cloud SDK installed and configured on vscode
- A Google Cloud project with billing enabled
- Docker installed
- GitHub account

#Local deployment
we will start our deployment by checking on docker hub https://hub.docker.com/ for the php-fpm docker repo

problem encountered : there is no official image of the desired docker image
solution : we will build and test Container image built from a Dockerfile for your PHP-FPM application (provide a simple PHPscript as a starting point) with Nginxconfiguration for serving static files and proxying requests to the PHP-FPM container
 
let us ensure our image runs locally before pushing it


#IMAGE DEPLOYMENT TO CLOUD
Push the local docker image to artifact registory
docker tag php-nginx-app gcr.io/positive-nuance-430214-r6/php-nginx-app:latest
docker push gcr.io/positive-nuance-430214-r6/php-nginx-app:latest

#TERRAFORM CONFIGURATION
let automate the deployment using terraform files necessary to build the infrastructure
https://registry.terraform.io/?product_intent=terraform

Navigate to the Billing section.
Verify the status of your billing account. If it is disabled, you will need to re-enable it or set up a new billing account.

Link Billing Account to Project:
Ensure that your project is linked to an active billing account.
In the Billing section, select Manage billing accounts and link your project to the appropriate billing account.

Enable Required APIs:Make sure that the necessary APIs for your project are enabled. You can do this by navigating to the APIs & Services section in the Google Cloud Console and enabling any required API.

1 cloud build API
2 cloud run API
3 compute API
4 run.googleapis.com
5 artifactregistry.googleapis.com
6 containerregistry.googleapis.com

created terraform seperate files in order to be ecfficient when deploying and quickly resolve up configuration issues
we also set variables to be flexible and permit reuse of our terraform configurations
tfvars allows us to have different configurations for each environment without modifying the main Terraform files





#Github action
- Automation: Automate repetitive tasks such as testing, building, and deploying code.
- Integration: Seamlessly integrates with GitHub, making it easy to trigger workflows based on repository events.
- Customization: Highly customizable workflows to fit your specific needs.










# Bash script that retrieves the public IP address of a deployed Cloud Run service


#!/bin/bash
SERVICE_NAME="your-cloud-run-service"
REGION= "your region"

#get the service url 
SERVICE_URL=$(gcloud run services describe $SERVICE_NAME --region $REGION --format 'value(status.url)')
#extract the public IP and print the result
PUBLIC_IP=$(dig +short $(echo $SERVICE_URL | sed 's|https://||'))
echo "The public IP address of the Cloud Run service is: $PUBLIC_IP"


This README provides a comprehensive guide to setting up and deploying your infrastructure using Terraform, and configuring a CI/CD pipeline with GitHub Actions








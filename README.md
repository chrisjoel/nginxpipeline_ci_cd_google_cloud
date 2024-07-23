#LOCAL DEPLOYMENT
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





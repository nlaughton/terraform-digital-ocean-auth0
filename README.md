# Terraform DigitalOcean Auth0 Configuration
This repository contains a set of Terraform files that configure Auth0 for a DigitalOcean environment [set up with the instructions here](https://github.com/apexdesigner/terraform-digital-ocean-cluster).
## Set up an Auth0 Tenant
Set up an Auth0 tenant.
Subscribe to the B2C Essentials plan ($23 per month at the time of this writing) so that you can use a custom domain (don't create the custom domain in Auth0, Terraform will do it for you).
Create a machine to machine application named Terraform and give it access to the Auth0 Management API (all permissions).

## Set up a SendGrid Account
Set up a SendGrid account. 
Go to Settings + API Keys and create an API key named Terraform (or something like Terraform - xxx App if you have multiple apps) with Full Access. 

## Create a Terraform Workspace
Create a new workspace as follows:

* Select Version control workflow
* Select GitHub (click Connect to a different VCS if you don't see GitHub)
* Select the apexdesigner organization (add it if it is not there)
* Select the terraform-digital-ocean-auth0 repository
* Set the workspace name to your domain name + auth0 (myapp-com-auth0 for example)
* Select the project you just created
* Click the Create workspace button

## Configure the Terraform Variables
Follow the instructions to fill in the variables for the workspace and click Save variables.

## Start a Run
Click the Start a new plan button to start the first run. 
The run will be done in two phases: plan and apply. 
After plan completes successfully, it will show the list of resources that apply will create. 
Click Confirm and Apply to start the apply phase.

## Auth0 Email Connection Id
The workspace has an output named "auth0_email_connection_id".
You can see it on the Outputs tab of the workspace.
You may need this value to configure specific app deployments.

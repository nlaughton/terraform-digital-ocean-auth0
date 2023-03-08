variable "digital_ocean_token" {
  description = "The DigitalOcean token which determines which team the cluster is created in."
  sensitive = true
}

variable domain {
  description = "Top level domain that will be related to this cluster (my-app.com for example)."
  type = string
}

variable auth0_domain {
  description = "Your Auth0 tenant's domain name (my-app.us.auth0.com for example)."
  type = string
}

variable auth0_client_id {
  description = "The Terraform machine to machine app client id."
  type = string
}
variable auth0_client_secret {
  description = "The Terraform machine to machine app client secret."
  type = string
  sensitive = true
}

variable auth0_default_email {
  description = "The default from email address that will be used with Auth0 (enter your email)."
  type = string
}

variable sendgrid_api_key {
  description = "The SendGrid api key that will be used by Auth0."
  type = string
  sensitive = true
}

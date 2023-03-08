provider "digitalocean" {
  token = var.digital_ocean_token
}

provider "auth0" {
  domain = var.auth0_domain
  client_id = var.auth0_client_id
  client_secret = var.auth0_client_secret
}

provider "sendgrid" {
  api_key = var.sendgrid_api_key
}

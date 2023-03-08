resource "auth0_custom_domain" "auth0_custom_domain" {
  domain = "login.${var.domain}"
  type   = "auth0_managed_certs"
}

resource "auth0_custom_domain_verification" "auth0_custom_domain_verification" {

  custom_domain_id = auth0_custom_domain.auth0_custom_domain.id

  timeouts { create = "15m" }

  depends_on = [digitalocean_record.auth0_custom_domain_record]
}

resource "auth0_connection" "passwordless_email" {
  strategy = "email"
  name     = "email"

  options {
    name                     = "email"
    from                     = var.auth0_default_email
    subject                  = "Welcome to {{application.name}}"
    syntax                   = "liquid"
    template                 = file("./auth0-email-template.html")
    disable_signup           = false
    brute_force_protection   = true
    non_persistent_attrs     = []
    auth_params = {
      scope         = "openid email profile offline_access"
      response_type = "code"
    }

    totp {
      time_step = 300
      length    = 6
    }
  }
}

resource "auth0_email" "auth0_email_provider" {
  name                 = "sendgrid"
  enabled              = true
  default_from_address = var.auth0_default_email

  credentials {
    api_key = var.sendgrid_api_key
  }
}


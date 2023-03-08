resource "digitalocean_record" "auth0_custom_domain_record" {
  domain = var.domain
  type   = upper(auth0_custom_domain.auth0_custom_domain.verification[0].methods[0].name)
  name   = "${auth0_custom_domain.auth0_custom_domain.domain}."
  value  = "${auth0_custom_domain.auth0_custom_domain.verification[0].methods[0].record}."
  depends_on = [auth0_custom_domain.auth0_custom_domain]
}

resource "digitalocean_record" "send_grid_record" {
  count  = 3
  domain = var.domain
  type   = upper(sendgrid_domain_authentication.default.dns[count.index].type)
  name   = split(".${var.domain}",sendgrid_domain_authentication.default.dns[count.index].host)[0]
  value  = sendgrid_domain_authentication.default.dns[count.index].data
  priority = sendgrid_domain_authentication.default.dns[count.index].type == "mx" ? 10 : null
  depends_on = [sendgrid_domain_authentication.default]
}

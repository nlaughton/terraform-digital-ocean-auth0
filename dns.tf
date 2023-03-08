resource "digitalocean_record" "auth0_custom_domain_record" {
  domain = var.domain
  type   = upper(auth0_custom_domain.auth0_custom_domain.verification[0].methods[0].name)
  name   = "${auth0_custom_domain.auth0_custom_domain.domain}."
  value  = "${auth0_custom_domain.auth0_custom_domain.verification[0].methods[0].record}."
  depends_on = [auth0_custom_domain.auth0_custom_domain]
}

resource "digitalocean_record" "send_grid_record" {
  for_each = { for index, record in sendgrid_domain_authentication.default.dns : index => record }
  domain = var.domain
  type   = upper(each.value.type)
  name   = split(".${var.domain}",each.value.host)[0]
  value  = each.value.data
  priority = each.value.type == "mx" ? 10 : null
  depends_on = [sendgrid_domain_authentication.default]
}

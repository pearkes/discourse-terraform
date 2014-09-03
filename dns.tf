/*
DNS configuration. This includes

    - DNS record pointing at your DigitalOcean Instance
    - DNS MX records for your mail sending, pointing to your mailgun
    account.

You'll need to set the nameservers of your domain to the following:

ns1.digitalocean.com
ns2.digitalocean.com
ns3.digitalocean.com
*/

# Creating a DigitalOcean doamin creates an A record by default
resource "digitalocean_domain" "discourse" {
    name = "${var.domain}"
    ip_address = "${digitalocean_droplet.discourse.ipv4_address}"
}


resource "digitalocean_record" "mail_receiving_0" {
    domain = "${digitalocean_domain.discourse.name}."
    # root
    name = "@"
    type = "${mailgun_domain.mail.receiving_records.0.record_type}"
    value = "${mailgun_domain.mail.receiving_records.0.value}"
    priority = 10
}

resource "digitalocean_record" "mail_receiving_1" {
    domain = "${digitalocean_domain.discourse.name}"
    # root
    name = "@"
    type = "${mailgun_domain.mail.receiving_records.1.record_type}"
    value = "${mailgun_domain.mail.receiving_records.1.value}"
    priority = 10
}

resource "digitalocean_record" "mail_sending_0" {
    domain = "${digitalocean_domain.discourse.name}"
    name = "${mailgun_domain.mail.sending_records.0.name}."
    type = "${mailgun_domain.mail.sending_records.0.record_type}"
    value = "${mailgun_domain.mail.sending_records.0.value}"
    priority = 10
}

resource "digitalocean_record" "mail_sending_1" {
    domain = "${digitalocean_domain.discourse.name}"
    name = "${mailgun_domain.mail.sending_records.1.name}."
    type = "${mailgun_domain.mail.sending_records.1.record_type}"
    value = "${mailgun_domain.mail.sending_records.1.value}"
    priority = 10
}

resource "digitalocean_record" "mail_sending_2" {
    domain = "${digitalocean_domain.discourse.name}"
    name = "${mailgun_domain.mail.sending_records.2.name}."
    type = "${mailgun_domain.mail.sending_records.2.record_type}"
    value = "${mailgun_domain.mail.sending_records.2.value}"
    priority = 10
}


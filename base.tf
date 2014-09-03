/*
Variables and providers. Variables without a default are required.
*/

provider "digitalocean" {
    token = "${var.do_token}"
}

provider "mailgun" {
    api_key = "${var.mailgun_key}"
}

# The email configured as the main admin account
variable "developer_email" {}

# The SMTP password for the mailgun domain
variable "smtp_password" {}

# The domain for the discourse app
variable "domain" {}

# The ID of the SSH key on DigitalOcean
variable "ssh_key_id" {}

# DigitalOcean access token
variable "do_token" {}

# Mailgun API key
variable "mailgun_key" {}

# The path to the SSH key that matches the key on DigitalOcean
variable "ssh_key_path" {}

# The size of the droplet
variable "size" {
    default = "2gb"
}

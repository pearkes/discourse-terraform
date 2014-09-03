/*
The mail server configuration for sending and receiving emails.
*/

resource "mailgun_domain" "mail" {
    name = "${var.domain}"
    spam_action = "disabled"
    smtp_password = "${var.smtp_password}"
}

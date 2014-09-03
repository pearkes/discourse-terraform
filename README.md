## discourse-terraform

This is a guide and a set of Terraform configuration files to automatically
configure [discourse](http://www.discourse.org/).

You can run the Terraform files with the following command:

```
$ terraform apply \
    -var 'developer_email=YOUR_ACCESS_KEY' \
    -var 'smtp_password=YOUR_SECRET_KEY' \
    -var 'domain=YOUR_DOMAIN' \
    -var 'ssh_key_id=YOUR_SSH_KEY_ID' \
    -var 'do_token=YOUR_DO_TOKEN' \
    -var 'mailgun_token=YOUR_MAILGUN_TOKEN'
```

It's based on the [easy install guide]().

### Preparation Steps

1. Access or create a DigitalOcean Account
    - [Sign up](https://cloud.digitalocean.com/registrations/new)
        or [log in](https://cloud.digitalocean.com)
    - Get a write-enabled [access token](https://cloud.digitalocean.com/settings/tokens/new)
    - Add [your SSH key](https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-digitalocean-droplets) and
        retrieve the ID with `curl -X GET "https://api.digitalocean.com/v2/account/keys" -H "Authorization: Bearer $ACCESS_TOKEN"`
2. Access or create a Mailgun Account
    - [Sign up](https://mailgun.com/signup) or [log in](https://mailgun.com/sessions/new)
    - Get your [API token](https://mailgun.com/cp) (see 'API Key')
3. Select your domain (`example.com`) and [point the nameservers
    at DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-host-name-with-digitalocean#step-two—change-your-domain-server).

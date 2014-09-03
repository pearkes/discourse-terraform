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
    -var 'mailgun_token=YOUR_MAILGUN_TOKEN' \
    -var 'ssh_key_path=/path/to/private/key'
```

It's based on the [Discourse easy install guide](https://github.com/discourse/discourse/blob/master/docs/INSTALL-digital-ocean.md).

### Running

Follow the [blog post](http://www.hashicorp.com/blog/terraform-discourse.html).

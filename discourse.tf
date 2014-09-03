/*
The Discourse application, provisioning and droplet configuration.
*/

resource "digitalocean_droplet" "discourse" {
    name = "discourse"
    image = "ubuntu-14-04-x64"
    region = "nyc2"
    size = "512mb"
    ssh_keys = ["${var.ssh_key_id}"]

    connection {
        user = "root"
        key_file = "${var.ssh_key_path}"
    }

    provisioner "file" {
        source = "app.yml"
        destination = "/root/app.yml"
    }

    provisioner "remote-exec" {
        inline = [
            "apt-get -y update",

            # Swap
            "install -o root -g root -m 0600 /dev/null /swapfile",
            "dd if=/dev/zero of=/swapfile bs=1k count=2048k",
            "mkswap /swapfile",
            "swapon /swapfile",
            "echo '/swapfile       swap    swap    auto      0       0' | tee -a /etc/fstab",
            "sysctl -w vm.swappiness=10",
            "echo vm.swappiness = 10 | tee -a /etc/sysctl.conf",

            # Git
            "apt-get -y install git",

            # Docker
            "wget -qO- https://get.docker.io/ | sh",

            # Discourse
            "mkdir /var/discourse",
            "git clone https://github.com/discourse/discourse_docker.git /var/discourse",
            "cd /var/discourse",

            # App configuration
            "cp /root/app.yml /var/discourse/containers/app.yml",
            "sed -i.bak s/SMTPDEVELOPER/${var.developer_email}/g containers/app.yml",
            "sed -i.bak s/WEBHOSTNAME/${var.domain}/g containers/app.yml",
            "sed -i.bak s/SMTPADDRESS/smtp.mailgun.org/g containers/app.yml",
            "sed -i.bak s/SMTPPORT/587/g containers/app.yml",
            "sed -i.bak s/SMTPLOGIN/${mailgun_domain.mail.smtp_password}/g containers/app.yml",
            "sed -i.bak s/SMTPPASSWORD/${var.smtp_password}/g containers/app.yml",

            # SSH Key for docker container (bootstrap will fail if not existing)
            "ssh-keygen -t rsa -f /root/.ssh/id_rsa -q -N ''",

            # Bootstrap and restart
            "./launcher bootstrap app",
            "./launcher start app"
        ]
    }
}

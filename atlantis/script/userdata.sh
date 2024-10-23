#!/bin/bash
mkdir /root/.aws
cat << EOF >> ~/.aws/credentials
[isnt]
aws_access_key_id = <AWS ACCESS KEY>
aws_secret_access_key = <AWS SECRET ACCESS KEY>
EOF

yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
yum -y install terraform
yum -y install git
wget https://github.com/runatlantis/atlantis/releases/download/v0.20.1/atlantis_linux_amd64.zip -P /root
unzip /root/atlantis_linux_amd64.zip -d /root

/root/atlantis server \
--atlantis-url="<GITHUB REPOSITORY URL>" \
--gh-user="<GITHUB USER NAME>" \
--gh-token="<GITHUB TOKEN>" \
--gh-webhook-secret="<GITHUB WEBHOOK SECRET>" \
--repo-allowlist="github.com/<GITHUB USERNAME>/<GITHUB RESPOSITORY NAME>"

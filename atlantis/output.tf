output "public_ip" {
  value       = aws_instance.web_ec2.public_ip
  description = "The public IP of the Instance"
}

output "ami_id" {
  value       = data.aws_ami.amzl2.id
  description = "The AMI id of the Instance"
}

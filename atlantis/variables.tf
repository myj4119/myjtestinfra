variable "port" {
  type = number
  default = 4141
}

variable "region" {
  type = string
  default = "ap-northeast-2"
}

variable "profile" {
  type = string
  default = "isnt"
}

variable "key_pair" {
  type = string
  default = "isnt"
}

variable "vpc_cidr" {
  type = string
  default = "10.50.0.0/16"
}

variable "nickname" {
  type = string
  default = "isnt"
}

variable "environment" {
  type = string
  default = "dev"
}

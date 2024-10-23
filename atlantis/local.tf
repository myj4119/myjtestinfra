locals {
  public_subnet = {
      zone = "${var.region}a"
      cidr = "10.50.0.0/24"
    }
}

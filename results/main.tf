provider "digitalocean" {
  token = "987260f38962d4d91f7c8576b0914871942be5760a3a49d472334dd48105a68f"
}

variable "region" {
  default = "nyc3"
}

variable "instance_name" {
  default = "dg-test-gabrielrimes-droplet"
}

resource "digitalocean_ssh_key" "default" {
  name       = "dg-test-gabrielrimes-key"
  public_key = "${file("ssh_keys/id_rsa.pub")}"
}

resource "digitalocean_droplet" "main" {
  image    = "centos-7-x64"
  name     = "${var.instance_name}"
  region   = "${var.region}"
  size     = "s-2vcpu-4gb"
  ssh_keys = ["${digitalocean_ssh_key.default.fingerprint}"]
}

resource "local_file" "foo" {
  content  = "${digitalocean_droplet.main.ipv4_address}\n"
  filename = "${path.module}/hosts"
}

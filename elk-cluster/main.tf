module "elk" {
    source = "./elk"

    private_key = "${file("~/.ssh/id_rsa")}"
}
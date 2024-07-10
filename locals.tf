locals {
    sufix = "${var.tags.project}-${var.tags.env}-${var.tags.region}" #recurso-cerberus-prod-region
}

resource "random_string" "sufijo-s3"{
    length = 8
    special = false
    upper = false # Los bucket tienen que tener el nombre en minúscula


}

locals {

    s3-sufix = "${var.tags.project}-${random_string.sufijo-s3.id}"


}
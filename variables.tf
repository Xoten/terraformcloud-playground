variable "virginia_cidr"{

description = "CIDR Virginia"
type = string
sensitive = false // valor por defecto es false
 
}

# variable "public_subnet" {

#     description = "CIDR public subnet"
#     type = string
# }

# variable "private_subnet" {

#     description = "CIDR private subnet"
#     type = string
# }


variable "subnets" {
    description  = "Lista de subnets"
    type = list(string)
}

variable "tags" {

    description = "Tags del proyecto"
    type = map(string)

}

variable "sg_ingress_cidr" {

    description = "CIDR for ingress traffic"
    type = string
}

variable "ec2_specs" {
    description = "Parámetros de la instancia"
    type = map(string)
}

variable "cadena" {

      type = string
      default = "ami-123,AMI-AAV,ami-12f"

  }

  variable "palabras" {

      type = list(string)
      default = ["hola","como","estan"]

  }

  
variable "instancias" {
   description = "Nombre de las instancias"
   type = list(string)
   default = ["apache"]

}

   variable "entornos" {

      type = map(string)
      default = {
        "prod" = "10.10.0.0/16"
        "dev"  = "172.16.0.0/16"

      }

  }

 variable "enable_monitoring" {

      type = number
      description = "Habilita el despliegue de un servidor de monitoreo"
  }

   variable "ingress_ports_list" {

      description = "Lista de puertos de ingress"
      type = list(number)
  }
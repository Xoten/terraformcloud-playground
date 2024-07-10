


resource "aws_instance" "public_instance" {
  # count = length(var.instancias)
  for_each = toset(var.instancias)
  ami                     = var.ec2_specs.ami
  instance_type           = var.ec2_specs.instance_type //debe ser t2.micro para que se tome en el free tier
  subnet_id = aws_subnet.public_subnet.id
  key_name = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data = file("user_data.sh")
  tags = {
    "Name" = "${each.value}-${local.sufix}"

  }

}

  resource "aws_instance" "monitoring_instance" {
  # count = length(var.instancias)
  # for_each = toset(var.instancias)
  count = var.enable_monitoring == 1 ? 1:0
  ami                     = var.ec2_specs.ami
  instance_type           = var.ec2_specs.instance_type //debe ser t2.micro para que se tome en el free tier
  subnet_id = aws_subnet.public_subnet.id
  key_name = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data = file("user_data.sh")
  tags = {
    "Name" = "Monitoreo-${local.sufix}"

  }

}

  # provisioner "local-exec" {

  # command = "echo instance creada con IP ${aws_instance.public_instance.public_ip} >> /datos_instancia.txt"
  
  # }

  # provisioner "local-exec"{

  #   when = destroy
  #   command = "echo instance destruida con IP ${self.public_ip} >> datos_instancia.txt"


  # }

  #  provisioner "remote-exec"{

  #   inline = [
  #     "echo 'hola mundo' > ~/saludo.txt"
  #   ]

  #   connection {
  #       type = "ssh"
  #       host = self.public_ip //dirección up de la instancia ec2 a la cual nos vamos a conectar
  #       user = "ec2-user"
  #       private_key = file("mykey.pem")    //llave privada                       
  #   }
  # }


  # lifecycle {
  #  replace_triggered_by = [
  #    aws_subnet.private_subnet.id

  #  ]
  # }


# resource "aws_instance" "mywebserver"{
#     ami                                  = "ami-01b799c439fd5516a"
#     instance_type                        = "t2.micro"
#     key_name                             = data.aws_key_pair.key.key_name
#     subnet_id                            = aws_subnet.public_subnet.id
#     tags                                 = {
#         "Name" = "MyServer"
#     }
#     vpc_security_group_ids               = [
#         aws_security_group.sg_public_instance.id,
#     ]


    
# }
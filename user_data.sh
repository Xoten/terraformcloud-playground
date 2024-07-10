#!/bin/bash
echo "Este es un mensaje" > ~/mensaje.txt
yum update -y # Actualizar el servidor(el -y es para aprobar automáticamente la instalación)
yum install httpd -y # Instalar apache
systemctl enable httpd # Habilitar el servicio de apache en cada inicio
systemctl start httpd # Iniciar el servicio de apache
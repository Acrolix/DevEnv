## Entorno de desarrollo para ComaLink ##
1) Clonar Este repo.
2) Ingresar a la carpeta MySQL
3) Ejecutar ``docker composer up -d``
   - Esto correrar un servidor MySQL Vacío
   - Es necario correr el archivo comalink-db.sql con el DDL para la creación de las tablas.
   - Ingrear a la linea de ocmandos del Contenedor con el siguiente comando: ``docker exec -it cromalink-db /bin/bash``
   - En la linea de comando ejecutar ``mysql -p``, va a solicitar la ocntraseña ``acr321``
   - En esta instancia ya se puede copiar y pegar las sentencias DDL.
  
   - Otra opción es utilizar un IDE para SQL.
  
   

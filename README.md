## Entorno de desarrollo para ComaLink

1. Clonar Este repo. ( `git clone git@github.com:Acrolix/DevEnv.git` )
2. ingresar a la carpeta `cd DevEnv`
3. Ejecutar `docker composer up -d`
4. Conectarce con cualquier cliente SQL.

El archivo DDL.sql se va a inicializar junto con el contenedor, dejando las tablas para la aplicación vacias.


DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=cromalink_db
DB_USERNAME=cromalink_user
DB_PASSWORD=Cr0m4l1nK.

MAIL_MAILER=smtp
MAIL_HOST=sandbox.smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=2490fb86999518
MAIL_PASSWORD="491f0eaf130d15"
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=noreply@acrolix.tech
MAIL_FROM_NAME="${APP_NAME}"

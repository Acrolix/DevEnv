## Entorno de desarrollo para ComaLink

1. Clonar Este repo. ( `git clone git@github.com:Acrolix/DevEnv.git` )
2. ingresar a la carpeta `cd DevEnv`
3. Ejecutar `docker composer up -d`
4. Conectarce con cualquier cliente SQL.

   - Database: cromalink_db
   - Host: localhost # cromalink_db for docker container
   - Port: 3306
   - MYSQL_ROOT_PASSWORD: "Cr0m4l1nK.root"
   - MYSQL_DATABASE: "cromalink_db"
   - MYSQL_USER: "cromalink_user"
   - MYSQL_PASSWORD: "Cr0m4l1nK."


El archivo cromalink_dump_full.sql se va a inicializar junto con el contenedor, dejando las tablas para la aplicación.
`mysqldump -p -R -E -B --add-drop-database --triggers --single-transaction cromalink_db > cromalink_db_full.sql`


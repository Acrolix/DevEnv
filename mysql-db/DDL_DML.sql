DROP DATABASE IF EXISTS cromalink_db;

CREATE DATABASE cromalink_db CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs;

USE cromalink_db;

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(60) NOT NULL,
    last_login DATETIME,
    active BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    email_verified_at DATETIME DEFAULT NULL,
    CONSTRAINT chk_users_email CHECK (email REGEXP '\\b[\\w\.-]+@[\\w\.-]+\.\\w{2,4}\\b'),
    CONSTRAINT chk_users_password CHECK (password REGEXP '\\$2[a-z]*\\$\\d\\d\\$[\\s\\S]{53}'),
    CONSTRAINT chk_users_last_login CHECK (last_login <= SYSDATE() OR last_login IS NULL),
    CONSTRAINT chk_users_created_at CHECK (created_at <= SYSDATE()),
    CONSTRAINT chk_users_updated_at CHECK (updated_at <= SYSDATE() AND updated_at >= created_at)
);

CREATE TABLE country (
    code CHAR(4) PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE user_profile (
    user_id INT UNSIGNED PRIMARY KEY,
    username VARCHAR(30) NOT NULL UNIQUE,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    biography TEXT,
    birth_date DATE NOT NULL,
    country_code CHAR(4) NOT NULL,
    avatar varchar(100),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (country_code) REFERENCES country(code),
    CONSTRAINT chk_user_profile_username CHECK (username REGEXP '^[a-zA-Z0-9_.]+$')
);

CREATE TABLE user_admin (
    user_id INT UNSIGNED PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role VARCHAR(10) NOT NULL,
    avatar varchar(100),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT chk_admin_role CHECK (role IN ('Moderador', 'Admin'))
);

CREATE TABLE users_followers (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    followed_id INT UNSIGNED NOT NULL,
    follower_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES user_profile(user_id),
    FOREIGN KEY (followed_id) REFERENCES user_profile(user_id),
    CONSTRAINT unique_follower_followed UNIQUE (follower_id, followed_id),
    CONSTRAINT chk_follower_followed CHECK (follower_id <> followed_id)
);

CREATE TABLE users_messages (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    sender_id INT UNSIGNED NOT NULL,
    recipient_id INT UNSIGNED NOT NULL,
    content TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES user_profile(user_id),
    FOREIGN KEY (recipient_id) REFERENCES user_profile(user_id),
    CONSTRAINT chk_unique_users_messages UNIQUE (sender_id, recipient_id, timestamp),
    CONSTRAINT chk_sender_recipient CHECK (sender_id <> recipient_id)
);

CREATE TABLE interest (
    name VARCHAR(20) PRIMARY KEY
);

CREATE TABLE users_interests (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    interest_name VARCHAR(20) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_profile(user_id),
    FOREIGN KEY (interest_name) REFERENCES interest(name),
    CONSTRAINT chk_user_interest_unique UNIQUE (user_id, interest_name)
);

CREATE TABLE `groups` (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL UNIQUE,
    description TEXT,
    hashtag VARCHAR(20) NOT NULL UNIQUE,
    cover_photo VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    interest_name VARCHAR(20) NOT NULL,
    is_private BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (interest_name) REFERENCES interest(name),
    CONSTRAINT chk_hashtag CHECK (hashtag REGEXP '^[a-zA-Z0-9_]+$'),
    CONSTRAINT chk_groups_created_at CHECK (created_at <= SYSDATE()),
    CONSTRAINT chk_groups_updated_at CHECK (updated_at <= SYSDATE() AND updated_at >= created_at)
);

CREATE TABLE users_groups (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    group_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    role VARCHAR(8) NOT NULL DEFAULT 'miembro',
    FOREIGN KEY (group_id) REFERENCES `groups`(id),
    FOREIGN KEY (user_id) REFERENCES user_profile(user_id),
    CONSTRAINT chk_users_groups_user_unique UNIQUE (group_id, user_id),
    CONSTRAINT chk_users_groups_role CHECK (role IN ('miembro', 'moderador', 'propietario'))
);

CREATE TABLE publications (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(60) NOT NULL,
    content TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    published_by INT UNSIGNED NOT NULL,
    FOREIGN KEY (published_by) REFERENCES user_profile(user_id),
    CONSTRAINT chk_publications_created_at CHECK (created_at <= SYSDATE()),
    CONSTRAINT chk_publications_updated_at CHECK (updated_at <= SYSDATE() AND updated_at >= created_at)
);

CREATE TABLE labels (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    publication_id INT UNSIGNED NOT NULL,
    interest_name VARCHAR(20) NOT NULL,
    FOREIGN KEY (publication_id) REFERENCES publications(id),
    FOREIGN KEY (interest_name) REFERENCES interest(name),
    CONSTRAINT chk_label_unique UNIQUE (publication_id, interest_name)
);

CREATE TABLE resources (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    publication_id INT UNSIGNED NOT NULL,
    type VARCHAR(8) NOT NULL,
    url VARCHAR(255),
    FOREIGN KEY (publication_id) REFERENCES publications(id),
    CONSTRAINT chk_resource_type CHECK (type IN ('external', 'video', 'audio', 'image'))
);

CREATE TABLE group_publications (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    publication_id INT UNSIGNED NOT NULL,
    group_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (publication_id) REFERENCES publications(id),
    FOREIGN KEY (group_id) REFERENCES `groups`(id),
    CONSTRAINT chk_group_publication_unique UNIQUE (publication_id, group_id)
);

CREATE TABLE users_comment (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    publication_id INT UNSIGNED NOT NULL,
    published_by INT UNSIGNED NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (publication_id) REFERENCES publications(id),
    FOREIGN KEY (published_by) REFERENCES user_profile(user_id),
    CONSTRAINT chk_comment_created_at CHECK (created_at <= SYSDATE()),
    CONSTRAINT chk_comment_updated_at CHECK (updated_at <= SYSDATE() AND updated_at >= created_at)
);

CREATE TABLE reactions (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    publication_id INT UNSIGNED NOT NULL,
    reaction_by INT UNSIGNED NOT NULL,
    type VARCHAR(2) NOT NULL,
    FOREIGN KEY (publication_id) REFERENCES publications(id),
    FOREIGN KEY (reaction_by) REFERENCES user_profile(user_id),
    CONSTRAINT chk_reaction_type CHECK (type IN ('MG', 'ME', 'MD')),
    CONSTRAINT chk_reactionpub__unique UNIQUE (publication_id, reaction_by)
);

CREATE TABLE social_events (
    publication_id INT UNSIGNED NOT NULL,
    name VARCHAR(50) NOT NULL,
    starts_at DATETIME NOT NULL,
    ends_at DATETIME,
    description TEXT,
    country_code CHAR(4) NOT NULL,
    longitude DECIMAL(9,6),
    latitude DECIMAL(8,6),
    PRIMARY KEY (publication_id),
    FOREIGN KEY (publication_id) REFERENCES publications(id),
    FOREIGN KEY (country_code) REFERENCES country(code)
);

CREATE TABLE social_event_participants (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    social_event_id INT UNSIGNED NOT NULL,
    participant_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (social_event_id) REFERENCES social_events(publication_id),
    FOREIGN KEY (participant_id) REFERENCES user_profile(user_id),
    CONSTRAINT chk_participant_unique UNIQUE (social_event_id, participant_id)
);

CREATE TABLE notifications (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    content TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_profile(user_id)
);


-- Triggers
DELIMITER //

-- user_profile
-- Valida si es mayor de 18 años al crear un Perfil de Usuario
CREATE TRIGGER before_insert_user_profile_adult
BEFORE INSERT ON user_profile
FOR EACH ROW
BEGIN
    IF NEW.birth_date >= CURDATE() - INTERVAL 18 YEAR THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de nacimiento debe ser al menos 18 años antes de la fecha actual.';
    END IF;
END //

-- Valida si es mayor de 18 años al actualizar el Perfil de Usuario
CREATE TRIGGER before_update_user_profile
BEFORE UPDATE ON user_profile
FOR EACH ROW
BEGIN
    IF NEW.birth_date >= CURDATE() - INTERVAL 18 YEAR THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de nacimiento debe ser al menos 18 años antes de la fecha actual.';
    END IF;
END //

-- Valida si el usuario ya existe en user_admin antes de insertar en user_profile
CREATE TRIGGER before_insert_user_profile_not_admin
BEFORE INSERT ON user_profile
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM user_admin WHERE user_id = NEW.user_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario ya existe en user_admin y no puede tener un perfil en user_profile.';
    END IF;
END //

-- user_admin
-- Valida si el usuario ya existe en user_profile antes de insertar en user_admin
CREATE TRIGGER before_insert_user_admin_not_profile
BEFORE INSERT ON user_admin
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM user_profile WHERE user_id = NEW.user_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario ya existe en user_profile y no puede tener un perfil en user_admin.';
    END IF;
END //

-- Valida si el usuario ya existe en user_profile antes de actualizar en user_admin
CREATE TRIGGER before_update_user_admin
BEFORE UPDATE ON user_admin
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM user_profile WHERE user_id = NEW.user_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario ya existe en user_profile y no puede tener un perfil en user_admin.';
    END IF;
END //

-- labels
-- Valida el máximo de labels que pueden estar asociadas a una publicación.
CREATE TRIGGER before_insert_labels_max
BEFORE INSERT ON labels
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM labels WHERE publication_id = NEW.publication_id) >= 2 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Solo puede haber un máximo de dos etiquetas por publicación.';
    END IF;
END //

-- resources
-- Valida el máximo de recursos que pueden estar asociadas a una publicación.
CREATE TRIGGER before_insert_resources_max
BEFORE INSERT ON resources
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM resources WHERE publication_id = NEW.publication_id) >= 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Solo puede haber un máximo de cinco recursos referenciando a la misma publicación.';
    END IF;
END //

-- group_publications
-- Valida que la publicación no tenga labels antes de agregarla al grupo.
CREATE TRIGGER before_insert_group_publications
BEFORE INSERT ON group_publications
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM labels WHERE publication_id = NEW.publication_id) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La publicación no puede tener etiquetas asociadas antes de ser agregada al grupo.';
    END IF;
END //

DELIMITER ;


INSERT INTO `country` (`code`, `name`) VALUES
('AF', 'Afganistán'),
('AX', 'Islas Gland'),
('AL', 'Albania'),
('DE', 'Alemania'),
('AD', 'Andorra'),
('AO', 'Angola'),
('AI', 'Anguilla'),
('AQ', 'Antártida'),
('AG', 'Antigua y Barbuda'),
('AN', 'Antillas Holandesas'),
('SA', 'Arabia Saudí'),
('DZ', 'Argelia'),
('AR', 'Argentina'),
('AM', 'Armenia'),
('AW', 'Aruba'),
('AU', 'Australia'),
('AT', 'Austria'),
('AZ', 'Azerbaiyán'),
('BS', 'Bahamas'),
('BH', 'Bahréin'),
('BD', 'Bangladesh'),
('BB', 'Barbados'),
('BY', 'Bielorrusia'),
('BE', 'Bélgica'),
('BZ', 'Belice'),
('BJ', 'Benin'),
('BM', 'Bermudas'),
('BT', 'Bhután'),
('BO', 'Bolivia'),
('BA', 'Bosnia y Herzegovina'),
('BW', 'Botsuana'),
('BV', 'Isla Bouvet'),
('BR', 'Brasil'),
('BN', 'Brunéi'),
('BG', 'Bulgaria'),
('BF', 'Burkina Faso'),
('BI', 'Burundi'),
('CV', 'Cabo Verde'),
('KY', 'Islas Caimán'),
('KH', 'Camboya'),
('CM', 'Camerún'),
('CA', 'Canadá'),
('CF', 'República Centroafricana'),
('TD', 'Chad'),
('CZ', 'República Checa'),
('CL', 'Chile'),
('CN', 'China'),
('CY', 'Chipre'),
('CX', 'Isla de Navidad'),
('VA', 'Ciudad del Vaticano'),
('CC', 'Islas Cocos'),
('CO', 'Colombia'),
('KM', 'Comoras'),
('CD', 'República Democrática del Congo'),
('CG', 'Congo'),
('CK', 'Islas Cook'),
('KP', 'Corea del Norte'),
('KR', 'Corea del Sur'),
('CI', 'Costa de Marfil'),
('CR', 'Costa Rica'),
('HR', 'Croacia'),
('CU', 'Cuba'),
('DK', 'Dinamarca'),
('DM', 'Dominica'),
('DO', 'República Dominicana'),
('EC', 'Ecuador'),
('EG', 'Egipto'),
('SV', 'El Salvador'),
('AE', 'Emiratos Árabes Unidos'),
('ER', 'Eritrea'),
('SK', 'Eslovaquia'),
('SI', 'Eslovenia'),
('ES', 'España'),
('UM', 'Islas ultramarinas de Estados Unidos'),
('US', 'Estados Unidos'),
('EE', 'Estonia'),
('ET', 'Etiopía'),
('FO', 'Islas Feroe'),
('PH', 'Filipinas'),
('FI', 'Finlandia'),
('FJ', 'Fiyi'),
('FR', 'Francia'),
('GA', 'Gabón'),
('GM', 'Gambia'),
('GE', 'Georgia'),
('GS', 'Islas Georgias del Sur y Sandwich del Sur'),
('GH', 'Ghana'),
('GI', 'Gibraltar'),
('GD', 'Granada'),
('GR', 'Grecia'),
('GL', 'Groenlandia'),
('GP', 'Guadalupe'),
('GU', 'Guam'),
('GT', 'Guatemala'),
('GF', 'Guayana Francesa'),
('GN', 'Guinea'),
('GQ', 'Guinea Ecuatorial'),
('GW', 'Guinea-Bissau'),
('GY', 'Guyana'),
('HT', 'Haití'),
('HM', 'Islas Heard y McDonald'),
('HN', 'Honduras'),
('HK', 'Hong Kong'),
('HU', 'Hungría'),
('IN', 'India'),
('ID', 'Indonesia'),
('IR', 'Irán'),
('IQ', 'Iraq'),
('IE', 'Irlanda'),
('IS', 'Islandia'),
('IL', 'Israel'),
('IT', 'Italia'),
('JM', 'Jamaica'),
('JP', 'Japón'),
('JO', 'Jordania'),
('KZ', 'Kazajstán'),
('KE', 'Kenia'),
('KG', 'Kirguistán'),
('KI', 'Kiribati'),
('KW', 'Kuwait'),
('LA', 'Laos'),
('LS', 'Lesotho'),
('LV', 'Letonia'),
('LB', 'Líbano'),
('LR', 'Liberia'),
('LY', 'Libia'),
('LI', 'Liechtenstein'),
('LT', 'Lituania'),
('LU', 'Luxemburgo'),
('MO', 'Macao'),
('MK', 'ARY Macedonia'),
('MG', 'Madagascar'),
('MY', 'Malasia'),
('MW', 'Malawi'),
('MV', 'Maldivas'),
('ML', 'Malí'),
('MT', 'Malta'),
('FK', 'Islas Malvinas'),
('MP', 'Islas Marianas del Norte'),
('MA', 'Marruecos'),
('MH', 'Islas Marshall'),
('MQ', 'Martinica'),
('MU', 'Mauricio'),
('MR', 'Mauritania'),
('YT', 'Mayotte'),
('MX', 'México'),
('FM', 'Micronesia'),
('MD', 'Moldavia'),
('MC', 'Mónaco'),
('MN', 'Mongolia'),
('MS', 'Montserrat'),
('MZ', 'Mozambique'),
('MM', 'Myanmar'),
('NA', 'Namibia'),
('NR', 'Nauru'),
('NP', 'Nepal'),
('NI', 'Nicaragua'),
('NE', 'Níger'),
('NG', 'Nigeria'),
('NU', 'Niue'),
('NF', 'Isla Norfolk'),
('NO', 'Noruega'),
('NC', 'Nueva Caledonia'),
('NZ', 'Nueva Zelanda'),
('OM', 'Omán'),
('NL', 'Países Bajos'),
('PK', 'Pakistán'),
('PW', 'Palau'),
('PS', 'Palestina'),
('PA', 'Panamá'),
('PG', 'Papúa Nueva Guinea'),
('PY', 'Paraguay'),
('PE', 'Perú'),
('PN', 'Islas Pitcairn'),
('PF', 'Polinesia Francesa'),
('PL', 'Polonia'),
('PT', 'Portugal'),
('PR', 'Puerto Rico'),
('QA', 'Qatar'),
('GB', 'Reino Unido'),
('RE', 'Reunión'),
('RW', 'Ruanda'),
('RO', 'Rumania'),
('RU', 'Rusia'),
('EH', 'Sahara Occidental'),
('SB', 'Islas Salomón'),
('WS', 'Samoa'),
('AS', 'Samoa Americana'),
('KN', 'San Cristóbal y Nevis'),
('SM', 'San Marino'),
('PM', 'San Pedro y Miquelón'),
('VC', 'San Vicente y las Granadinas'),
('SH', 'Santa Helena'),
('LC', 'Santa Lucía'),
('ST', 'Santo Tomé y Príncipe'),
('SN', 'Senegal'),
('CS', 'Serbia y Montenegro'),
('SC', 'Seychelles'),
('SL', 'Sierra Leona'),
('SG', 'Singapur'),
('SY', 'Siria'),
('SO', 'Somalia'),
('LK', 'Sri Lanka'),
('SZ', 'Suazilandia'),
('ZA', 'Sudáfrica'),
('SD', 'Sudán'),
('SE', 'Suecia'),
('CH', 'Suiza'),
('SR', 'Surinam'),
('SJ', 'Svalbard y Jan Mayen'),
('TH', 'Tailandia'),
('TW', 'Taiwán'),
('TZ', 'Tanzania'),
('TJ', 'Tayikistán'),
('IO', 'Territorio Británico del Océano Índico'),
('TF', 'Territorios Australes Franceses'),
('TL', 'Timor Oriental'),
('TG', 'Togo'),
('TK', 'Tokelau'),
('TO', 'Tonga'),
('TT', 'Trinidad y Tobago'),
('TN', 'Túnez'),
('TC', 'Islas Turcas y Caicos'),
('TM', 'Turkmenistán'),
('TR', 'Turquía'),
('TV', 'Tuvalu'),
('UA', 'Ucrania'),
('UG', 'Uganda'),
('UY', 'Uruguay'),
('UZ', 'Uzbekistán'),
('VU', 'Vanuatu'),
('VE', 'Venezuela'),
('VN', 'Vietnam'),
('VG', 'Islas Vírgenes Británicas'),
('VI', 'Islas Vírgenes de los Estados Unidos'),
('WF', 'Wallis y Futuna'),
('YE', 'Yemen'),
('DJ', 'Yibuti'),
('ZM', 'Zambia'),
('ZW', 'Zimbabue');


DELIMITER //
CREATE PROCEDURE registrarUsuarioAdmin(
    IN email VARCHAR(255),
    IN password VARCHAR(60),
    IN first_name VARCHAR(30),
    IN last_name VARCHAR(30),
    IN role VARCHAR(10),
    IN active BOOLEAN,
    IN email_verified_at DATETIME
)
BEGIN
    START TRANSACTION;

    INSERT INTO users (email, password, active, email_verified_at) VALUES (email, password , active, email_verified_at);
    SET @last_user_id = LAST_INSERT_ID();
    INSERT INTO user_admin (user_id, first_name, last_name, role) VALUES (@last_user_id, first_name, last_name, role);

    COMMIT;
END //
DELIMITER ;

CALL registrarUsuarioAdmin('ma@acrolix.tech', '$2a$10$G7Gb3r7nQiM23Z5w/ugE3.lpJTQ3k8V7uUnYh391ENMfw/2BSrU.q', 'Martín', 'Acosta', 'Admin', TRUE, now());
CALL registrarUsuarioAdmin('mr@acrolix.tech', '$2a$10$G7Gb3r7nQiM23Z5w/ugE3.lpJTQ3k8V7uUnYh391ENMfw/2BSrU.q', 'Matias', 'Rancel', 'Admin', TRUE, NOW());
CALL registrarUsuarioAdmin('ml@acrolix.tech', '$2a$10$G7Gb3r7nQiM23Z5w/ugE3.lpJTQ3k8V7uUnYh391ENMfw/2BSrU.q', 'Martín', 'Lorenzo', 'Admin', TRUE, NOW());
CALL registrarUsuarioAdmin('ls@acrolix.tech', '$2a$10$G7Gb3r7nQiM23Z5w/ugE3.lpJTQ3k8V7uUnYh391ENMfw/2BSrU.q', 'Lucas', 'Sancristobal', 'Admin', TRUE, NOW());
CALL registrarUsuarioAdmin('test.admin@cromalink.acrolix.tech', '$2a$10$G7Gb3r7nQiM23Z5w/ugE3.lpJTQ3k8V7uUnYh391ENMfw/2BSrU.q', 'Admin', 'Cromalink', 'Admin', TRUE, NOW());
CALL registrarUsuarioAdmin('test.mod@cromalink.acrolix.tech', '$2a$10$G7Gb3r7nQiM23Z5w/ugE3.lpJTQ3k8V7uUnYh391ENMfw/2BSrU.q', 'Moderador', 'Cromalink', 'Moderador', TRUE, NOW());


CREATE USER 'cromalink_auth'@'172.18.0.11' IDENTIFIED BY 'password_auth';
CREATE USER 'cromalink_users'@'172.18.0.12' IDENTIFIED BY 'password_users';
CREATE USER 'cromalink_posts'@'172.18.0.13' IDENTIFIED BY 'password_posts';
CREATE USER 'cromalink_groups'@'172.18.0.14' IDENTIFIED BY 'password_groups';
-- CREATE USER 'cromalink_backoffice'@'cromalink-api-backoffice' IDENTIFIED BY 'password_backoffice';
CREATE USER 'cromalink_backoffice'@'%' IDENTIFIED BY 'password_backoffice';

-- GRANT ALL ON cromalink_db.* TO 'cromalink_backoffice'@'cromalink-api-backoffice';
GRANT ALL ON cromalink_db.* TO 'cromalink_backoffice'@'%';

GRANT SELECT, UPDATE ON users TO 'cromalink_auth'@'172.18.0.11';
DELIMITER //

CREATE PROCEDURE GrantOAuthPermissions()
BEGIN
    GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.oauth_clients TO 'cromalink_auth'@'172.18.0.11';
    GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.oauth_access_tokens TO 'cromalink_auth'@'172.18.0.11';
    GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.oauth_refresh_tokens TO 'cromalink_auth'@'172.18.0.11';
    GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.oauth_auth_codes TO 'cromalink_auth'@'172.18.0.11';
    GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.oauth_personal_access_clients TO 'cromalink_auth'@'172.18.0.11';
    FLUSH PRIVILEGES;
END //

DELIMITER ;

GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.users TO 'cromalink_users'@'172.18.0.12';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.country TO 'cromalink_users'@'172.18.0.12';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.user_profile TO 'cromalink_users'@'172.18.0.12';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.users_groups TO 'cromalink_users'@'172.18.0.12';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.users_followers TO 'cromalink_users'@'172.18.0.12';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.users_interests TO 'cromalink_users'@'172.18.0.12';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.users_messages TO 'cromalink_users'@'172.18.0.12';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.users_comment TO 'cromalink_users'@'172.18.0.12';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.notifications TO 'cromalink_users'@'172.18.0.12';

GRANT SELECT ON cromalink_db.users TO 'cromalink_posts'@'172.18.0.13';
GRANT SELECT ON cromalink_db.user_profile TO 'cromalink_posts'@'172.18.0.13';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.users_comment TO 'cromalink_posts'@'172.18.0.13';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.reactions TO 'cromalink_posts'@'172.18.0.13';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.publications TO 'cromalink_posts'@'172.18.0.13';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.labels TO 'cromalink_posts'@'172.18.0.13';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.resources TO 'cromalink_posts'@'172.18.0.13';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.social_events TO 'cromalink_posts'@'172.18.0.13';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.social_event_participants TO 'cromalink_posts'@'172.18.0.13';

GRANT SELECT ON cromalink_db.users TO 'cromalink_groups'@'172.18.0.14';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.groups TO 'cromalink_groups'@'172.18.0.14';
GRANT SELECT, INSERT, UPDATE, DELETE ON cromalink_db.group_publications TO 'cromalink_groups'@'172.18.0.14';
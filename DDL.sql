DROP DATABASE IF EXISTS cromalink_db;

CREATE DATABASE cromalink_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE cromalink_db;

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    last_login DATETIME,
    active BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    email_verified_at DATETIME DEFAULT NULL,
    remember_token varchar(100) DEFAULT NULL,
    CONSTRAINT chk_users_email CHECK (email REGEXP '\\b[\\w\.-]+@[\\w\.-]+\.\\w{2,4}\\b'),
    CONSTRAINT chk_users_password CHECK (password REGEXP '\\$2a*\\$\\d\\d\\$[\\s\\S]{53}'),
    CONSTRAINT chk_users_last_login CHECK (last_login <= SYSDATE() OR last_login IS NULL),
    CONSTRAINT chk_users_created_at CHECK (created_at <= SYSDATE()),
    CONSTRAINT chk_users_updated_at CHECK (updated_at <= SYSDATE() AND updated_at >= created_at)
);

CREATE TABLE users_followers (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    followed_id INT UNSIGNED NOT NULL,
    follower_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followed_id) REFERENCES users(id),
    CONSTRAINT unique_follower_followed UNIQUE (follower_id, followed_id),
    CONSTRAINT chk_follower_followed CHECK (follower_id <> followed_id)
);

CREATE TABLE users_messages (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    sender_id INT UNSIGNED NOT NULL,
    recipient_id INT UNSIGNED NOT NULL,
    content TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (recipient_id) REFERENCES users(id),
    CONSTRAINT chk_unique_users_messages UNIQUE (sender_id, recipient_id, timestamp),
    CONSTRAINT chk_sender_recipient CHECK (sender_id <> recipient_id)
);

CREATE TABLE country (
    code CHAR(4) PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE user_profile (
    user_id INT UNSIGNED PRIMARY KEY,
    username VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    biography TEXT,
    birth_date DATE NOT NULL,
    country_code CHAR(4) NOT NULL,
    avatar VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (country_code) REFERENCES country(code),
    CONSTRAINT chk_user_profile_username CHECK (username REGEXP '^[a-zA-Z0-9_]+$')
);

CREATE TABLE user_admin (
    user_id INT UNSIGNED PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role VARCHAR(10) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT chk_admin_role CHECK (role IN ('Moderador', 'Admin'))
);

CREATE TABLE interest (
    name VARCHAR(20) PRIMARY KEY
);

CREATE TABLE users_interests (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    interest_name VARCHAR(20) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
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
    role VARCHAR(8) NOT NULL DEFAULT 'Miembro',
    FOREIGN KEY (group_id) REFERENCES `groups`(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT chk_users_groups_user_unique UNIQUE (group_id, user_id),
    CONSTRAINT chk_users_groups_role CHECK (role IN ('Miembro', 'Moderador', 'Propietario'))
);

CREATE TABLE publications (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(20) NOT NULL,
    content TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    published_by INT UNSIGNED NOT NULL,
    FOREIGN KEY (published_by) REFERENCES users(id),
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
    url VARCHAR(50),
    FOREIGN KEY (publication_id) REFERENCES publications(id),
    CONSTRAINT chk_resource_type CHECK (type IN ('link', 'video', 'audio', 'image'))
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
    FOREIGN KEY (published_by) REFERENCES users(id),
    CONSTRAINT chk_comment_created_at CHECK (created_at <= SYSDATE()),
    CONSTRAINT chk_comment_updated_at CHECK (updated_at <= SYSDATE() AND updated_at >= created_at)
);

CREATE TABLE reactions (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    publication_id INT UNSIGNED NOT NULL,
    reaction_by INT UNSIGNED NOT NULL,
    type VARCHAR(2) NOT NULL,
    FOREIGN KEY (publication_id) REFERENCES publications(id),
    FOREIGN KEY (reaction_by) REFERENCES users(id),
    CONSTRAINT chk_reaction_type CHECK (type IN ('MG', 'ME', 'MD')),
    CONSTRAINT chk_reactionpub__unique UNIQUE (publication_id, reaction_by)
);

CREATE TABLE social_events (
    publication_id INT UNSIGNED NOT NULL,
    name VARCHAR(20) NOT NULL,
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
    FOREIGN KEY (participant_id) REFERENCES users(id),
    CONSTRAINT chk_participant_unique UNIQUE (social_event_id, participant_id)
);

CREATE TABLE notifications (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    content TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
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
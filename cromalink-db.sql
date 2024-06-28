CREATE DATABASE IF NOT EXISTS cromalink_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE cromalink_db;

-- Tabla Usuario
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    biography TEXT,
    phone VARCHAR(20),
    date_of_birth DATE,
    country VARCHAR(255),
    picture VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    last_login TIMESTAMP,
    active BOOLEAN DEFAULT TRUE,
    staff BOOLEAN DEFAULT FALSE
);
-- Tabla Publicaciones
CREATE TABLE publications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    content TEXT,
    image VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE CASCADE
);

-- Tabla Comenta
CREATE TABLE comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    publication_id INT,
    created_by INT,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (publication_id) REFERENCES publications(id) ON DELETE CASCADE,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE CASCADE
);

-- Tabla Reacciones
CREATE TABLE reactions (
    publication_id INT,
    reaction_by INT,
    PRIMARY KEY (publication_id, reaction_by),
    FOREIGN KEY (publication_id) REFERENCES publications(id) ON DELETE CASCADE,
    FOREIGN KEY (reaction_by) REFERENCES users(id) ON DELETE CASCADE
);

-- Restricción de dominio para email
ALTER TABLE users
ADD CONSTRAINT check_email CHECK (email REGEXP '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'); 

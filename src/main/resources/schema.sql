CREATE TABLE IF NOT EXISTS artistas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100),
    nombre_artistico VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    genero_musical VARCHAR(50),
    pais VARCHAR(100),
    fecha_debut DATETIME,
    fecha_registro DATETIME,
    activo BIT,
    CONSTRAINT chk_artista_activo CHECK (activo IN (0,1))
);

CREATE TABLE IF NOT EXISTS albums (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    fecha_lanzamiento DATE,
    genero VARCHAR(50),
    numero_canciones INT,
    duracion_total INT,
    precio DECIMAL(10,2),
    descripcion VARCHAR(500),
    url_portada VARCHAR(255),
    estado VARCHAR(255),
    fecha_registro DATETIME,
    artista_id BIGINT NOT NULL,
    CONSTRAINT fk_album_artista FOREIGN KEY (artista_id) REFERENCES artistas(id)
);

CREATE TABLE IF NOT EXISTS canciones (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    duracion_segundos INT NOT NULL,
    numero_pista INT,
    genero VARCHAR(50),
    precio DECIMAL(10,2),
    numero_reproducciones BIGINT,
    letra VARCHAR(1000),
    url_archivo VARCHAR(255),
    estado VARCHAR(255),
    fecha_grabacion DATETIME,
    fecha_registro DATETIME,
    artista_id BIGINT NOT NULL,
    album_id BIGINT,
    CONSTRAINT fk_cancion_artista FOREIGN KEY (artista_id) REFERENCES artistas(id),
    CONSTRAINT fk_cancion_album FOREIGN KEY (album_id) REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS user_roles (
    user_id BIGINT NOT NULL,
    role VARCHAR(255) NOT NULL,
    CONSTRAINT fk_role_user FOREIGN KEY (user_id) REFERENCES users(id)
);
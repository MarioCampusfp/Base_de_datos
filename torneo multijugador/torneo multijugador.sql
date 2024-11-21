CREATE DATABASE torneo_multijugador;
USE torneo_multijugador;

CREATE TABLE equipos (
    idequipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_de_creacion DATE NOT NULL,
    descripcion TEXT
);

CREATE TABLE jugador (
    idjugador INT AUTO_INCREMENT PRIMARY KEY,
    idequipo INT, 
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    apodo VARCHAR(50),
    edad INT,
    pais VARCHAR(50),
    FOREIGN KEY (idequipo) REFERENCES equipos(idequipo)
);

CREATE TABLE torneo (
    idtorneo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_de_inicio DATE NOT NULL,
    premio_en_dinero DECIMAL(10, 2)
);

CREATE TABLE participacion (
    idequipo INT,
    idtorneo INT, 
    numeros_de_equipos INT,
    PRIMARY KEY (idequipo, idtorneo),
    FOREIGN KEY (idequipo) REFERENCES equipos(idequipo),
    FOREIGN KEY (idtorneo) REFERENCES torneo(idtorneo)
);


INSERT INTO equipos (nombre, fecha_de_creacion, descripcion) VALUES
('Los Invencibles', '2020-05-10', 'Equipo con gran trayectoria en torneos internacionales'),
('Furia Roja', '2018-03-15', 'Conocidos por su estrategia defensiva'),
('Relámpagos', '2021-07-01', 'Un equipo de jóvenes promesas');

INSERT INTO jugador (idequipo, nombre, apellido, apodo, edad, pais) VALUES
(1, 'Carlos', 'Ramírez', 'El Destructor', 28, 'México'),
(1, 'Lucía', 'Fernández', 'Lightning', 24, 'Argentina'),
(2, 'Javier', 'Gómez', 'El Muro', 30, 'España'),
(2, 'Ana', 'Martínez', 'Shadow', 26, 'Chile'),
(3, 'Miguel', 'Torres', 'Speedy', 21, 'Colombia'),
(3, 'Laura', 'García', 'Thunder', 22, 'Perú');

INSERT INTO torneo (nombre, fecha_de_inicio, premio_en_dinero) VALUES
('Torneo Mundial 2023', '2023-03-01', 50000.00),
('Copa Regional 2023', '2023-06-15', 20000.00),
('Liga de Campeones 2024', '2024-01-10', 100000.00);

INSERT INTO participacion (idequipo, idtorneo, numeros_de_equipos) VALUES
(1, 1, 10), 
(2, 1, 10), 
(3, 2, 8),  
(1, 3, 12), 
(2, 3, 12); 

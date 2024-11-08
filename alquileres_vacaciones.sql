DROP DATABASE IF EXISTS alquileres_vacaciones;
CREATE DATABASE alquileres_vacaciones;
USE alquileres_vacaciones;

CREATE TABLE clientes (
    idcliente VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,  
    telefono VARCHAR(12),
    cuenta_bancaria VARCHAR(30),
    edad INT,
    email VARCHAR(100)  
);

CREATE TABLE alojamientos (
    idalojamiento INT PRIMARY KEY AUTO_INCREMENT,
    precio INT NOT NULL,
    habitaciones INT NOT NULL,
    capacidad INT NOT NULL
);

CREATE TABLE alquiler (
    idlojamiento INT,
    idcliente VARCHAR(20), 
    fecha_inicio DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    PRIMARY KEY (idlojamiento, idcliente),
    FOREIGN KEY (idlojamiento) REFERENCES alojamientos(idalojamiento),
    FOREIGN KEY (idcliente) REFERENCES clientes(idcliente)
);

INSERT INTO clientes (idcliente, nombre, telefono, cuenta_bancaria, edad, email) VALUES
('C001', 'Juan Pérez', '1234567890', 'ES1234567890123456789012', 30, 'juan.perez@mail.com'),
('C002', 'María Gómez', '1234567891', 'ES1234567890123456789013', 25, 'maria.gomez@mail.com'),
('C003', 'Carlos Ruiz', '1234567892', 'ES1234567890123456789014', 45, 'carlos.ruiz@mail.com'),
('C004', 'Ana Sánchez', '1234567893', 'ES1234567890123456789015', 34, 'ana.sanchez@mail.com'),
('C005', 'Luis Martínez', '1234567894', 'ES1234567890123456789016', 38, 'luis.martinez@mail.com'),
('C006', 'Laura Fernández', '1234567895', 'ES1234567890123456789017', 29, 'laura.fernandez@mail.com'),
('C007', 'Pedro López', '1234567896', 'ES1234567890123456789018', 40, 'pedro.lopez@mail.com'),
('C008', 'Patricia Torres', '1234567897', 'ES1234567890123456789019', 50, 'patricia.torres@mail.com'),
('C009', 'Miguel García', '1234567898', 'ES1234567890123456789020', 33, 'miguel.garcia@mail.com'),
('C010', 'Elena Rodríguez', '1234567899', 'ES1234567890123456789021', 27, 'elena.rodriguez@mail.com');

INSERT INTO alojamientos (precio, habitaciones, capacidad) VALUES
(150, 2, 4),
(120, 1, 2),
(250, 3, 6),
(180, 2, 4),
(300, 3, 6),
(200, 2, 5),
(350, 4, 8),
(90, 1, 2),
(250, 3, 5),
(400, 4, 10);

INSERT INTO alquiler (idlojamiento, idcliente, fecha_inicio, fecha_salida) VALUES
(1, 'C001', '2024-07-01', '2024-07-10'),
(2, 'C002', '2024-06-15', '2024-06-20'),
(3, 'C003', '2024-08-01', '2024-08-07'),
(4, 'C004', '2024-06-10', '2024-06-14'),
(5, 'C005', '2024-05-15', '2024-05-20'),
(6, 'C006', '2024-07-05', '2024-07-12'),
(7, 'C007', '2024-09-01', '2024-09-10'),
(8, 'C008', '2024-06-20', '2024-06-25'),
(9, 'C009', '2024-07-12', '2024-07-18'),
(10, 'C010', '2024-07-15', '2024-07-22'),
(1, 'C003', '2024-09-01', '2024-09-08'),
(2, 'C004', '2024-06-18', '2024-06-22'),
(3, 'C005', '2024-06-25', '2024-07-02'),
(4, 'C006', '2024-07-10', '2024-07-17'),
(5, 'C007', '2024-08-01', '2024-08-07'),
(6, 'C008', '2024-07-03', '2024-07-10'),
(7, 'C009', '2024-07-25', '2024-07-30'),
(8, 'C010', '2024-06-01', '2024-06-07'),
(9, 'C001', '2024-06-20', '2024-06-25'),
(10, 'C002', '2024-06-10', '2024-06-15');

SELECT c.idcliente, c.nombre, a.idalojamiento, a.precio, a.habitaciones, a.capacidad
FROM clientes c
INNER JOIN alquiler al ON c.idcliente = al.idcliente
INNER JOIN alojamientos a ON al.idlojamiento = a.idalojamiento;

SELECT c.idcliente, c.nombre, COUNT(*) AS num_reservas
FROM clientes c
INNER JOIN alquiler al ON c.idcliente = al.idcliente
GROUP BY c.idcliente
ORDER BY num_reservas DESC;

SELECT idalojamiento, precio, habitaciones, capacidad
FROM alojamientos
WHERE capacidad > 4 AND habitaciones > 2;

SELECT c.idcliente, c.nombre, a.idalojamiento, a.precio
FROM clientes c
INNER JOIN alquiler al ON c.idcliente = al.idcliente
INNER JOIN alojamientos a ON al.idlojamiento = a.idalojamiento
WHERE a.precio > 200;

SELECT a.idalojamiento, a.precio, a.habitaciones, a.capacidad
FROM alojamientos a
LEFT JOIN alquiler al ON a.idalojamiento = al.idlojamiento
WHERE al.idcliente IS NULL;

SELECT habitaciones, AVG(precio) AS precio_promedio
FROM alojamientos
GROUP BY habitaciones
ORDER BY habitaciones;

SELECT c.idcliente, c.nombre, al.idlojamiento, COUNT(*) AS num_reservas
FROM clientes c
INNER JOIN alquiler al ON c.idcliente = al.idcliente
GROUP BY c.idcliente, al.idlojamiento
HAVING COUNT(*) > 1;

SELECT a.idalojamiento, a.precio, a.habitaciones, a.capacidad
FROM alojamientos a
LEFT JOIN alquiler al ON a.idalojamiento = al.idlojamiento
AND al.fecha_inicio <= '2024-07-31' AND al.fecha_salida >= '2024-07-01'
WHERE al.idcliente IS NULL;

SELECT c.idcliente, c.nombre, AVG(DATEDIFF(al.fecha_salida, al.fecha_inicio)) AS duracion_promedio
FROM clientes c
INNER JOIN alquiler al ON c.idcliente = al.idcliente
GROUP BY c.idcliente;


SELECT c.idcliente, c.nombre, SUM(DATEDIFF(al.fecha_salida, al.fecha_inicio)) AS total_dias_reservados
FROM clientes c
INNER JOIN alquiler al ON c.idcliente = al.idcliente
GROUP BY c.idcliente
ORDER BY total_dias_reservados DESC
LIMIT 1;

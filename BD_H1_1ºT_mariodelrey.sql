create database criminalidad;
use criminalidad;

create table banda(
	idbanda int primary key,
    nombre varchar(100)
);
create table miembro(
	idmienbro int primary key,
    nombre varchar(100),
    edad varchar(3),
    sexo varchar(10),
    banda int,
    foreign key (banda) references banda(idbanda)
);
create table delito(
	iddelito int primary key,
    grado varchar(30),
    tipo varchar(30),
    fecha date,
    hora time,
    lugar varchar(100)
);
create table participacion(
	iddelito int,
    idmienbro int,
    foreign key (iddelito) references delito(iddelito),
    foreign key (idmienbro) references miembro(idmienbro),
    primary key (iddelito, idmienbro),
    tipo_de_participacio varchar(100),
    observaciones varchar(200)
);
create table victima(
	idvictima int primary key,
    nombre varchar(30),
    dni varchar(10)
);
create table victima_delito(
iddelito int,
idvictima int,
foreign key (iddelito) references delito(iddelito),
foreign key (idvictima) references victima(idvictima),
primary key (iddelito, idvictima),
numero_de_victimas int
);

INSERT INTO banda (idbanda, nombre) VALUES
(1, 'yakuza'),
(2, 'los bagos'),
(3, 'glou stript'),
(4, 'las triadas');
INSERT INTO miembro (idmienbro, nombre, edad, sexo, banda) VALUES
(1, 'Juan Pérez', '25', 'Masculino', 1),
(2, 'María Gómez', '30', 'Femenino', 1),
(3, 'Carlos Ruiz', '22', 'Masculino', 2),
(4, 'Ana López', '28', 'Femenino', 2),
(5, 'Luis Fernández', '32', 'Masculino', 3),
(6, 'Sofía Jiménez', '24', 'Femenino', 3),
(7, 'Diego Morales', '27', 'Masculino', 4),
(8, 'Carmen Ruiz', '29', 'Femenino', 4),
(9, 'José Torres', '31', 'Masculino', 1),
(10, 'Elena Sánchez', '26', 'Femenino', 2),
(11, 'Fernando Castro', '23', 'Masculino', 3),
(12, 'Valeria Ortega', '30', 'Femenino', 4),
(13, 'Ricardo Peña', '35', 'Masculino', 1),
(14, 'Patricia Ruiz', '27', 'Femenino', 2),
(15, 'Javier Moreno', '34', 'Masculino', 3),
(16, 'Claudia Díaz', '29', 'Femenino', 4),
(17, 'Santiago Gómez', '22', 'Masculino', 1),
(18, 'Isabel Torres', '28', 'Femenino', 2);
INSERT INTO delito (iddelito, grado, tipo, fecha, hora, lugar) VALUES
(1, 'Grave', 'Robo', '2024-10-15', '14:30:00', 'Calle Falsa 123'),
(2, 'Leve', 'Hurto', '2024-10-16', '16:00:00', 'Avenida Siempre Viva 456'),
(3, 'Grave', 'Asalto', '2024-10-17', '18:45:00', 'Plaza Mayor'),
(4, 'Moderado', 'Fraude', '2024-10-18', '10:15:00', 'Oficina Central'),
(5, 'Leve', 'Vandalismo', '2024-10-19', '12:00:00', 'Parque Central'),
(6, 'Grave', 'Homicidio', '2024-10-20', '22:30:00', 'Calle Olivo'),
(7, 'Leve', 'Desorden Público', '2024-10-21', '20:00:00', 'Calle Luna'),
(8, 'Grave', 'Tráfico de Drogas', '2024-10-22', '23:00:00', 'Calle Verde'),
(9, 'Moderado', 'Secuestro', '2024-10-23', '14:30:00', 'Avenida Libertad'),
(10, 'Leve', 'Infracción de Tráfico', '2024-10-24', '09:00:00', 'Calle Principal'),
(11, 'Grave', 'Extorsión', '2024-10-25', '16:00:00', 'Calle del Sol'),
(12, 'Moderado', 'Acoso', '2024-10-26', '11:30:00', 'Calle del Río');
INSERT INTO participacion (iddelito, idmienbro, tipo_de_participacio, observaciones) VALUES
(1, 1, 'Planificación', 'Juan fue el encargado de planear el robo.'),
(1, 2, 'Ejecución', 'María estuvo presente durante el robo.'),
(2, 3, 'Testigo', 'Carlos vio lo que ocurrió.'),
(3, 4, 'Ejecución', 'Ana fue la responsable de llevar a cabo el asalto.'),
(3, 5, 'Cómplice', 'Luis ayudó a planificar el asalto.'),
(4, 6, 'Testigo', 'Sofía presenció el fraude en la oficina.'),
(5, 7, 'Ejecución', 'Diego fue visto vandalizando en el parque.'),
(6, 8, 'Planificación', 'Carmen fue parte de la planificación del homicidio.'),
(8, 9, 'Ejecución', 'José estuvo presente durante el tráfico de drogas.'),
(9, 10, 'Planificación', 'Elena ayudó a planear el secuestro.'),
(10, 11, 'Testigo', 'Fernando presenció la infracción de tráfico.'),
(11, 12, 'Ejecución', 'Claudia participó activamente en la extorsión.'),
(12, 13, 'Cómplice', 'Ricardo apoyó en el acoso a la víctima.');
INSERT INTO victima (idvictima, nombre, dni) VALUES
(1, 'Pedro Sánchez', '12345678A'),
(2, 'Lucía Martínez', '87654321B'),
(3, 'Martín Pérez', '23456789C'),
(4, 'Gloria Salazar', '34567890D'),
(5, 'Andrés Castro', '45678901E'),
(6, 'Valentina Reyes', '56789012F'),
(7, 'Roberto Silva', '67890123G'),
(8, 'Sara López', '78901234H'),
(9, 'Hugo Martínez', '89012345I'),
(10, 'Clara Morales', '90123456J'),
(11, 'Diego Ruiz', '01234567K'),
(12, 'Marta Jiménez', '12345678L'),
(13, 'Isabel García', '23456789M'),
(14, 'Carlos López', '34567890N'),
(15, 'Ana Fernández', '45678901O'),
(16, 'Luis Herrera', '56789012P'),
(17, 'Patricia Ortega', '67890123Q'),
(18, 'Javier Torres', '78901234R'),
(19, 'Lucía Ramírez', '89012345S'),
(20, 'Nicolás Pérez', '90123456T'),
(21, 'Sofía Castro', '01234567U'),
(22, 'Raúl Mendoza', '12345678V');
INSERT INTO victima_delito (iddelito, idvictima, numero_de_victimas) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(1, 13, 1),
(2, 14, 1),
(3, 15, 1),
(4, 16, 1),
(5, 17, 1),
(6, 18, 1),
(7, 19, 1),
(8, 20, 1),
(9, 21, 1),
(10, 22, 1);

SELECT b.nombre AS Banda, m.nombre AS Miembro
FROM banda b
JOIN miembro m ON b.idbanda = m.banda;

SELECT grado, COUNT(*) AS NumeroDeDelitos
FROM delito
GROUP BY grado;

SELECT d.tipo AS Delito, v.nombre AS Victima
FROM delito d
JOIN victima_delito vd ON d.iddelito = vd.iddelito
JOIN victima v ON vd.idvictima = v.idvictima;

SELECT m.nombre AS Miembro, d.tipo AS Delito
FROM miembro m
JOIN participacion p ON m.idmienbro = p.idmienbro
JOIN delito d ON p.iddelito = d.iddelito
WHERE d.iddelito = 1;

SELECT b.nombre AS Banda, COUNT(m.idmienbro) AS NumeroDeMiembros
FROM banda b
LEFT JOIN miembro m ON b.idbanda = m.banda
GROUP BY b.nombre;

SELECT d.tipo AS Delito, COUNT(vd.idvictima) AS NumeroDeVictimas
FROM delito d
LEFT JOIN victima_delito vd ON d.iddelito = vd.iddelito
GROUP BY d.tipo;

SELECT d.tipo AS Delito, p.tipo_de_participacio
FROM delito d
JOIN participacion p ON d.iddelito = p.iddelito
WHERE p.idmienbro = 1; 

SELECT v.nombre AS Victima, d.tipo AS Delito
FROM victima v
JOIN victima_delito vd ON v.idvictima = vd.idvictima
JOIN delito d ON vd.iddelito = d.iddelito;

SELECT m.nombre AS Miembro, d.tipo AS Delito, p.observaciones
FROM miembro m
JOIN participacion p ON m.idmienbro = p.idmienbro
JOIN delito d ON p.iddelito = d.iddelito;

SELECT b.nombre AS Banda, d.tipo AS Delito, COUNT(DISTINCT m.idmienbro) AS NumeroDeMiembros
FROM banda b
JOIN miembro m ON b.idbanda = m.banda
JOIN participacion p ON m.idmienbro = p.idmienbro
JOIN delito d ON p.iddelito = d.iddelito
GROUP BY b.nombre, d.tipo;


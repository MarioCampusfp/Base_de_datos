create database parking;
use parking;

create table cliente(
idcliente int auto_increment primary key,
nombre varchar(30) not null,
tlf varchar(12)
);
INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('MIGUEL PEREZ', '919.392.292');
INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('GLORIA GONZALEZ', '912.354.929');
INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('ROSA MONTERO', '915.242.224');
INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('PEDRO TORRES', '915.424.345');
INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('ISMAEL DELGADO', '912.212.235');
create table coche(
matricula char(12) primary key,
marca varchar(12),
modelo varchar(12),
idcliente int,
foreign key (idcliente) references cliente(idcliente)
);
INSERT INTO COCHE VALUES ('M-1111-AA','FORD','FIESTA',1);
INSERT INTO COCHE VALUES ('M-2323-AA','OPEL','CORSA',2);
INSERT INTO COCHE VALUES ('S-2524-BZ','CITROEN','AX',2);
INSERT INTO COCHE VALUES ('M-2222-AA','RENAULT','12',3);
INSERT INTO COCHE VALUES ('M-5542-AB','SEAT','600',4);
INSERT INTO COCHE VALUES ('A-2211-AB','RENAULT','EXPRESS',5);
INSERT INTO COCHE VALUES ('M-2522-AA','GOLF','GTI',5);
INSERT INTO COCHE VALUES ('M-2522-AZ','CITROEN','ZX',5);

SELECT c.nombre, co.matricula
FROM cliente c
JOIN coche co ON c.idcliente = co.idcliente
ORDER BY c.nombre, co.matricula;

SELECT c.nombre, COUNT(co.matricula) AS num_coches
FROM cliente c
LEFT JOIN coche co ON c.idcliente = co.idcliente
GROUP BY c.idcliente, c.nombre;

SELECT c.nombre, co.matricula
FROM cliente c
JOIN coche co ON c.idcliente = co.idcliente
WHERE co.matricula LIKE 'M%'
ORDER BY c.nombre;

SELECT *
FROM coche
WHERE marca <> 'RENAULT';

ALTER TABLE coche
ADD COLUMN precio_compra DECIMAL(10, 2);

UPDATE coche SET precio_compra = 5000.00 WHERE matricula = 'M-1111-AA';
UPDATE coche SET precio_compra = 6000.00 WHERE matricula = 'M-2323-AA';
UPDATE coche SET precio_compra = 4500.00 WHERE matricula = 'S-2524-BZ';
UPDATE coche SET precio_compra = 4000.00 WHERE matricula = 'M-2222-AA';
UPDATE coche SET precio_compra = 3000.00 WHERE matricula = 'M-5542-AB';
UPDATE coche SET precio_compra = 7000.00 WHERE matricula = 'A-2211-AB';
UPDATE coche SET precio_compra = 8000.00 WHERE matricula = 'M-2522-AA';
UPDATE coche SET precio_compra = 6500.00 WHERE matricula = 'M-2522-AZ';

set sql_safe_updates=0;
UPDATE coche
SET precio_compra = precio_compra * 1.10
WHERE marca = 'CITROEN';

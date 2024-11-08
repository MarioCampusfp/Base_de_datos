DROP DATABASE IF EXISTS TIENDA;
CREATE DATABASE TIENDA;
USE TIENDA;

-- Creamos las cuatro tablas.
CREATE TABLE CLIENTE (
NIF CHAR(9) PRIMARY KEY,NOMBRE VARCHAR(50),DOMICILIO VARCHAR(100),
TLF VARCHAR(25),CIUDAD VARCHAR(25)
);
CREATE TABLE PRODUCTO (
CODIGO CHAR(4) PRIMARY KEY,DESCRIPCION VARCHAR(100),PRECIO FLOAT,
STOCK INT, MINIMO INT
);
CREATE TABLE FACTURA (
 NUMERO INT PRIMARY KEY, FECHA DATE, PAGADO BOOL, NIF CHAR(9),
 FOREIGN KEY (NIF) REFERENCES CLIENTE(NIF)
);
CREATE TABLE DETALLE (
 ID INT PRIMARY KEY,  NUMERO INT, CODIGO CHAR(4), UNIDADES INT, PRECIO FLOAT,
 FOREIGN KEY (NUMERO) REFERENCES FACTURA(NUMERO),
FOREIGN KEY (CODIGO) REFERENCES PRODUCTO(CODIGO)
);

-- Añadimos registros en todas las tablas.
INSERT INTO CLIENTE VALUES 
("11111111A", "ROSA PEREZ DELGADO", "C/ ASTRO, 25", "913678090", "MADRID");
INSERT INTO CLIENTE VALUES 
("22222222B", "MARIANO RODOLFO DEL VALL", "C/ SOL, 7", "616667788", "SEVILLA");
INSERT INTO CLIENTE VALUES 
("33333333C", "CARLOS MALDONADO PEREZ", "C/ LUNA, 9", "617771166", "SEVILLA");
INSERT INTO CLIENTE VALUES 
("44444444C", "PERICO DE LOS PALOTES LARGOS", "C/ OCA, 9", "67778877", "MADRID");

INSERT INTO PRODUCTO VALUES ('CHA9', 'CHANDAL DE NIÑO 9-10 AÑOS', 25.50, 7, 10);
INSERT INTO PRODUCTO VALUES ('CH11', 'CHANDAL DE NIÑO 11-12 AÑOS', 25.50, 8, 10);
INSERT INTO PRODUCTO VALUES ('CORH', 'CORTA VIENTOS HOMBRE', 15, 3, 5);
INSERT INTO PRODUCTO VALUES ('CORM', 'CORTA VIENTOS MUJER', 15, 5, 7);
INSERT INTO PRODUCTO VALUES ('PA10', 'PANTALÓN CORTO 10-11 AÑOS', 10, 8, 10);
INSERT INTO PRODUCTO VALUES ('PA12', 'PANTALÓN CORTO 12.13 AÑOS', 10, 4, 10);
INSERT INTO PRODUCTO VALUES ('BAF5', 'BALÓN DE FUTBOL Nº 5', 7, 5, 8);
INSERT INTO PRODUCTO VALUES ('BAF4', 'BALÓN DE FUTBOL Nº 4', 6, 4, 8);
INSERT INTO PRODUCTO VALUES ('BAB5', 'BALÓN DE BALONCESTO Nº 5', 7, 5, 8);
INSERT INTO PRODUCTO VALUES ('BAB4', 'BALÓN DE BALONCESTO Nº 4', 6, 3, 8);
INSERT INTO PRODUCTO VALUES ('BI20', 'BICICLETA 20 PULGADAS', 150, 2, 4);

INSERT INTO FACTURA VALUES (5000, '2021/05/15', TRUE, '11111111A');
INSERT INTO FACTURA VALUES (5001, '2021/05/16', TRUE, '11111111A');
INSERT INTO FACTURA VALUES (5002, '2021/06/18', TRUE, '22222222B');
INSERT INTO FACTURA VALUES (5003, '2021/06/18', TRUE, '22222222B');
INSERT INTO FACTURA VALUES (5004, '2021/07/19', TRUE, '33333333C');
INSERT INTO FACTURA VALUES (5005, '2021/07/20', TRUE, '33333333C');

INSERT INTO DETALLE VALUES (1, 5000, 'CHA9', 2, 25);
INSERT INTO DETALLE VALUES (2, 5000, 'CH11', 2, 25.5);
INSERT INTO DETALLE VALUES (3, 5000, 'BAF5', 2, 7);
INSERT INTO DETALLE VALUES (4, 5000, 'BAB5', 2, 6);
INSERT INTO DETALLE VALUES (5, 5001, 'BI20', 2, 140);
INSERT INTO DETALLE VALUES (6, 5001, 'BAB5', 3, 6);
INSERT INTO DETALLE VALUES (7, 5002, 'BI20', 1, 150);
INSERT INTO DETALLE VALUES (8, 5003, 'BAB4', 10, 5);
INSERT INTO DETALLE VALUES (9, 5004, 'PA10', 2, 9);
INSERT INTO DETALLE VALUES (10, 5004, 'PA12', 2, 10);
INSERT INTO DETALLE VALUES (11, 5004, 'BAB5', 2, 6);
INSERT INTO DETALLE VALUES (12, 5005, 'BI20', 2, 140);

CREATE DATABASE JERARQUIA;
USE JERARQUIA;

CREATE TABLE EMPLEADO (
IDEMPLEADO INT PRIMARY KEY,
NOMBRE VARCHAR(25),
JEFE INT,
FOREIGN KEY (JEFE) REFERENCES EMPLEADO(IDEMPLEADO)
);

INSERT INTO EMPLEADO VALUES (1, "Ruperto", null);
INSERT INTO EMPLEADO VALUES (2, "Lucas", 1);
INSERT INTO EMPLEADO VALUES (3, "Rosa", 1);
INSERT INTO EMPLEADO VALUES (4, "Perico", 2);
INSERT INTO EMPLEADO VALUES (5, "Carlos", 2);
INSERT INTO EMPLEADO VALUES (6, "Miguel", 3);
INSERT INTO EMPLEADO VALUES (7, "Alicia", 3);
INSERT INTO EMPLEADO VALUES (8, "Agapito", 7);

select j.nombre as jefe, s.nombre as subortinado,
 j.idempleado, s.jefe as idjefe
 from EMPLEADO as j inner join EMPLEADO as s
 on j.idempleado = s.jefe;
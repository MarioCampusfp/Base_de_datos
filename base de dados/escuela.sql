CREATE DATABASE Clase;
USE Clase;
CREATE TABLE Alumno(
NIF CHAR(10) PRIMARY KEY,
NOMBRE VARCHAR(100),
Trabajo boolean,
estudios VARCHAR(100),
ingresos VARCHAR(25),
fecha_de_nacimiento VARCHAR(20));

INSERT INTO Alumno values
("11111111A", "IGNACIO ARIAS TOMAS", false, "primaria,segundaria,bachiller", "6000","20/6/03");
INSERT INTO Alumno values
("22222222B","LAMYAA BOUAICHI ABDELLAOUI",true,"primaria,segundaria,bachiller","5000""16/5/05");
INSERT INTO Alumno values
("33333333C","ALEJANDRO CORTES DIAZ",true,"primaria,segundaria,bachiller","7000""12/2/01");
INSERT INTO Alumno values
("44444444C","SERGIO DEL SAZ CASTILLO",false,"primaria,segundaria,bachiller","4000""19/1/02");

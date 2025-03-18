CREATE TABLE CLIENTE (
    NIF char(9) PRIMARY KEY,
    NOMBRE varchar(50),
    DIRECCION TDIRECCION,
    TLF varchar(25)
);

-- Ejercicio 1
CREATE OR REPLACE TYPE tVendedor AS OBJECT (
    nif char(9),
    nombreCompleto tNombre,
    direccion tDireccion,
    tlf varchar(25),
    antiguedad date,
    tipoContrato varchar(30),
    MEMBER FUNCTION getMeses RETURN int
);

CREATE TYPE BODY tVendedor AS
MEMBER FUNCTION getMeses RETURN int IS
    BEGIN
        RETURN (extract(year from current_date)-
          extract(year from antiguedad))*12;
    END;
END;

-- Ejercicio 2
CREATE TABLE VENDEDOR OF tVendedor;
ALTER TABLE VENDEDOR ADD PRIMARY KEY(NIF);

-- Ejercicio 3
INSERT INTO VENDEDOR VALUES
(
    '12121213A',
    tNombre('Rodolfo','Sánchez','López'),
    tDireccion('Oca', '25', '3','1', 'A', '28017', 'Madrid', 'Madrid'),
    '617778899',
    TO_DATE('2021/05/15', 'yyyy/mm/dd'),
    'Indefinido'
);

-- Ejercicio 4
SELECT V.NOMBRECOMPLETO.GETAPELLIDONOMBRE(),
  V.getMeses() FROM VENDEDOR V;
  
  

CREATE OR REPLACE TYPE tEmpleado AS OBJECT (
    id NUMBER,
    nombre VARCHAR2(50),
    apellido VARCHAR2(50),
    salario NUMBER,
    MEMBER FUNCTION salario_anual RETURN NUMBER
);

CREATE OR REPLACE TYPE BODY tEmpleado AS
    MEMBER FUNCTION salario_anual RETURN NUMBER IS
    BEGIN
        RETURN salario * 12; 
    END salario_anual;
END;


CREATE TABLE empleado OF tEmpleado;


INSERT INTO empleado VALUES (tEmpleado(1, 'Juan', 'Pérez', 2000));
INSERT INTO empleado VALUES (tEmpleado(2, 'María', 'González', 2500));
INSERT INTO empleado VALUES (tEmpleado(3, 'Pedro', 'Martínez', 3000));
INSERT INTO empleado VALUES (tEmpleado(4, 'Ana', 'Lopez', 2200));
INSERT INTO empleado VALUES (tEmpleado(5, 'Luis', 'Fernández', 2800));

-- Consultar todos los empleados
SELECT * FROM empleado;

-- Consultar el salario anual de un empleado (por ejemplo, el empleado con ID = 1)
SELECT e.id, e.nombre, e.apellido, e.salario, e.salario_anual() AS salario_anual
FROM empleado e
WHERE e.id = 1;

-- Consultar empleados con salario mayor a 2500
SELECT e.id, e.nombre, e.apellido, e.salario
FROM empleado e
WHERE e.salario > 2500;

-- Contar el número de empleados
SELECT COUNT(*) FROM empleado;

-- Consultar el salario promedio de los empleados
SELECT AVG(e.salario) AS salario_promedio
FROM empleado e;

CREATE TYPE tColores AS VARRAY (10) OF VARCHAR(20);

create or replace TYPE tProducto AS OBJECT (
    codigo char(4),
    descripcion varchar(100),
    colores tColores,
    precio float,
    stock integer,
    minimo integer,
    MEMBER FUNCTION getReponer RETURN integer,
    MEMBER FUNCTION getRecaudacion RETURN float,
    MEMBER FUNCTION getColores RETURN varchar,
    MEMBER FUNCTION getColoresCount RETURN integer,
    MEMBER FUNCTION getColoresFirst RETURN varchar
);

CREATE OR REPLACE TYPE BODY tProducto AS
    MEMBER FUNCTION getReponer RETURN integer IS
    BEGIN
        IF stock<minimo THEN
            RETURN minimo-stock;
        ELSE 
            RETURN 0;
        END IF;
    END;
    MEMBER FUNCTION getRecaudacion RETURN float IS
    BEGIN
        RETURN precio*stock;
    END;
    MEMBER FUNCTION getColores RETURN varchar IS
        cadena varchar(100);
        i int;
    BEGIN
        cadena := 'Disponible en ';
        i := 0;
        LOOP
            i:=i+1;
            cadena:=cadena||colores(i)||' ';
            exit when i=colores.count;
        END LOOP;
        RETURN cadena;
    END;
    MEMBER FUNCTION getColoresCount RETURN integer IS
    BEGIN
        RETURN colores.count;
    END;   
    MEMBER FUNCTION getColoresFirst RETURN varchar IS
    BEGIN
        RETURN colores(1);
    END;
END;

CREATE TABLE PRODUCTO OF tProducto;

INSERT INTO PRODUCTO VALUES ('CHA9', 'CHANDAL DE NIÑO 9-10 AÑOS', 
    tColores('Rojo', 'Verde', 'Azul'), 25.50, 7, 10);
INSERT INTO PRODUCTO VALUES ('CH11', 'CHANDAL DE NIÑO 11-12 AÑOS', 
    tColores('Rojo', 'Rosa', 'Azul'), 25.50, 8, 10);
INSERT INTO PRODUCTO VALUES ('CORH', 'CORTA VIENTOS HOMBRE', 
    tColores('Negro', 'Gris'), 15, 3, 5);
INSERT INTO PRODUCTO VALUES ('CORM', 'CORTA VIENTOS MUJER', 
    tColores('Negro', 'Rojo'), 15, 5, 7);
INSERT INTO PRODUCTO VALUES ('PA10', 'PANTALÓN CORTO 10-11 AÑOS', 
    tColores('Rojo', 'Verde', 'Amarillo', 'Azul'), 10, 8, 10);
INSERT INTO PRODUCTO VALUES ('PA12', 'PANTALÓN CORTO 12-13 AÑOS', 
    tColores('Rojo', 'Verde', 'Amarillo', 'Azul'), 10, 4, 10);
INSERT INTO PRODUCTO VALUES ('BAF5', 'BALÓN DE FUTBOL Nº 5', 
    tColores('Amarillo/verde', 'Blanco/negro'), 7, 5, 8);
INSERT INTO PRODUCTO VALUES ('BAF4', 'BALÓN DE FUTBOL Nº 4', 
   tColores('Amarillo/verde', 'Blanco/negro'), 6, 4, 8);
INSERT INTO PRODUCTO VALUES ('BAB5', 'BALÓN DE BALONCESTO Nº 5', 
    tColores('Rojo/negro', 'Blanco/azul'), 7, 5, 8);
INSERT INTO PRODUCTO VALUES ('BAB4', 'BALÓN DE BALONCESTO Nº 4', 
    tColores('Rojo/negro', 'Blanco/azul'), 6, 3, 8);
INSERT INTO PRODUCTO VALUES ('BI20', 'BICICLETA 20 PULGADAS', 
    tColores('Rojo/blanco', 'Azul/blanco'), 150, 2, 4);

MEMBER FUNCTION getColoresCount RETURN integer IS
BEGIN
RETURN colores.count;
END;


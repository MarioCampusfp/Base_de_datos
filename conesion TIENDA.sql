CREATE OR REPLACE TYPE tDomicilio AS OBJECT (
    calle varchar(50),
    numero int,
    piso int,
    escalera int,
    puerta char(2),
    MEMBER FUNCTION getDomicilio RETURN varchar
) NOT FINAL;

CREATE TYPE BODY tDomicilio AS
    MEMBER FUNCTION getDomicilio RETURN varchar IS
    BEGIN
        RETURN calle||' '||numero|| 
            ' Piso: '||piso||' Escalera'||escalera||' Puerta: '||puerta;
    END;
END;

CREATE OR REPLACE TYPE tDireccion UNDER tDomicilio (
    cp char(5),
    localidad varchar(25),
    provincia varchar(25),
    MEMBER FUNCTION getDireccion RETURN varchar
);

CREATE TYPE BODY tDireccion AS
    MEMBER FUNCTION getDireccion RETURN varchar IS
    BEGIN
        RETURN SELF.getDomicilio||' '||cp||' '||localidad||' '||provincia;
    END;
END;

CREATE TABLE CLIENTE (
    NIF char(9) PRIMARY KEY,
    NOMBRE varchar(50),
    DIRECCION TDIRECCION,
    TLF varchar(25)
);

INSERT INTO CLIENTE VALUES (
    '11111111A', 
    'ROSA PEREZ DELGADO', 
    TDIRECCION('Astro',25,3,1,'A', '28003', 'Madrid', 'Madrid'),
    '913678090'
);


INSERT INTO CLIENTE VALUES (
    '22222222B', 
    'MARIANO RODOLFO DEL VALL', 
    TDIRECCION('Sol',7,3,2,'A', '41410', 'Carmona', 'Sevilla'),
    '616667788'
);


INSERT INTO CLIENTE VALUES (
    '33333333C', 
    'CARLOS MALDONADO PEREZ', 
    TDIRECCION('Luna',12,4,2,'A', '41200', 'Alcalá del Río', 'Sevilla'),
    '617771166'
);


INSERT INTO CLIENTE VALUES (
    '44444444C', 
    'PERICO DE LOS PALOTES LARGOS', 
    TDIRECCION('Oca',9,4,1,'A', '28025', 'Madrid', 'Madrid'),
    '67778877'
);

SELECT 
    cli.nombre, 
    cli.tlf, 
    cli.direccion.calle, 
    cli.direccion.numero
FROM cliente cli;

select * from cliente;

CREATE OR REPLACE TYPE tNombre AS OBJECT (
    nombre     VARCHAR2(50),
    apellido1  VARCHAR2(50),
    apellido2  VARCHAR2(50),
    
    MEMBER FUNCTION getApellidosNombre RETURN VARCHAR2,
    MEMBER FUNCTION getNombreApellidos RETURN VARCHAR2
);




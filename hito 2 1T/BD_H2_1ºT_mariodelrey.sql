SELECT * 
FROM CLIENTE 
WHERE CIUDAD = 'MADRID';

SELECT * 
FROM CLIENTE 
WHERE CIUDAD <> 'MADRID';

SELECT * 
FROM CLIENTE 
WHERE NOMBRE LIKE 'B%' 
   OR NOMBRE LIKE 'C%' 
   OR NOMBRE LIKE 'D%' 
   OR NOMBRE LIKE 'E%' 
   OR NOMBRE LIKE 'F%' 
   OR NOMBRE LIKE 'G%';

SELECT * 
FROM CLIENTE 
WHERE NOMBRE LIKE 'M%';

SELECT * 
FROM PRODUCTO 
WHERE CODIGO = 'BAB5';

SELECT 
    CODIGO,
    DESCRIPCION,
    STOCK,
    (MINIMO - STOCK) AS UNIDADES_A_REPONER,
    (MINIMO - STOCK) * PRECIO AS DINERO_A_INVERTIR
FROM PRODUCTO
WHERE STOCK < MINIMO;

SELECT 
    D.ID, 
    D.NUMERO, 
    D.CODIGO, 
    P.DESCRIPCION, 
    D.UNIDADES, 
    D.UNIDADES * D.PRECIO AS PRECIO_VENTA
FROM DETALLE D
JOIN PRODUCTO P ON D.CODIGO = P.CODIGO;

SELECT 
    D.ID, 
    D.NUMERO, 
    D.CODIGO, 
    P.DESCRIPCION, 
    D.UNIDADES, 
    D.UNIDADES * D.PRECIO AS PRECIO_VENTA
FROM DETALLE D
JOIN PRODUCTO P ON D.CODIGO = P.CODIGO
WHERE D.NUMERO = 5000;

SELECT 
    D.ID, 
    D.NUMERO, 
    D.CODIGO, 
    P.DESCRIPCION, 
    D.UNIDADES, 
    D.UNIDADES * D.PRECIO AS PRECIO_VENTA
FROM DETALLE D
JOIN PRODUCTO P ON D.CODIGO = P.CODIGO
WHERE D.CODIGO = 'BAB5';

SELECT 
    F.NUMERO, 
    F.FECHA, 
    F.PAGADO, 
    C.NOMBRE, 
    C.TLF
FROM FACTURA F
JOIN CLIENTE C ON F.NIF = C.NIF;

SELECT 
    F.NUMERO, 
    F.FECHA, 
    F.PAGADO, 
    C.NOMBRE, 
    C.TLF, 
    SUM(D.UNIDADES * D.PRECIO) AS IMPORTE_TOTAL
FROM FACTURA F
JOIN CLIENTE C ON F.NIF = C.NIF
JOIN DETALLE D ON F.NUMERO = D.NUMERO
GROUP BY F.NUMERO, F.FECHA, F.PAGADO, C.NOMBRE, C.TLF;

SELECT 
    F.NUMERO, 
    F.FECHA, 
    F.PAGADO, 
    C.NOMBRE, 
    C.TLF, 
    SUM(D.UNIDADES * D.PRECIO) AS IMPORTE_TOTAL
FROM FACTURA F
JOIN CLIENTE C ON F.NIF = C.NIF
JOIN DETALLE D ON F.NUMERO = D.NUMERO
WHERE C.NOMBRE = 'ROSA PEREZ DELGADO'
GROUP BY F.NUMERO, F.FECHA, F.PAGADO, C.NOMBRE, C.TLF;

SELECT 
    F.NUMERO, 
    F.FECHA, 
    F.PAGADO, 
    C.NOMBRE, 
    C.TLF, 
    SUM(D.UNIDADES * D.PRECIO) AS IMPORTE_TOTAL
FROM FACTURA F
JOIN CLIENTE C ON F.NIF = C.NIF
JOIN DETALLE D ON F.NUMERO = D.NUMERO
WHERE F.PAGADO = TRUE
GROUP BY F.NUMERO, F.FECHA, F.PAGADO, C.NOMBRE, C.TLF;

SELECT 
    F.NUMERO, 
    F.FECHA, 
    F.PAGADO, 
    C.NOMBRE, 
    C.TLF, 
    SUM(D.UNIDADES * D.PRECIO) AS IMPORTE_TOTAL
FROM FACTURA F
JOIN CLIENTE C ON F.NIF = C.NIF
JOIN DETALLE D ON F.NUMERO = D.NUMERO
WHERE F.PAGADO = FALSE
GROUP BY F.NUMERO, F.FECHA, F.PAGADO, C.NOMBRE, C.TLF;

SELECT 
    F.NUMERO, 
    F.FECHA, 
    F.PAGADO, 
    C.NOMBRE, 
    C.TLF, 
    SUM(D.UNIDADES * D.PRECIO) AS IMPORTE_TOTAL
FROM FACTURA F
JOIN CLIENTE C ON F.NIF = C.NIF
JOIN DETALLE D ON F.NUMERO = D.NUMERO
WHERE MONTH(F.FECHA) = 6 
GROUP BY F.NUMERO, F.FECHA, F.PAGADO, C.NOMBRE, C.TLF;

SELECT 
    F.NUMERO, 
    F.FECHA, 
    F.PAGADO, 
    C.NOMBRE, 
    C.TLF, 
    SUM(D.UNIDADES * D.PRECIO) AS IMPORTE_TOTAL
FROM FACTURA F
JOIN CLIENTE C ON F.NIF = C.NIF
JOIN DETALLE D ON F.NUMERO = D.NUMERO
GROUP BY F.NUMERO, F.FECHA, F.PAGADO, C.NOMBRE, C.TLF
HAVING SUM(D.UNIDADES * D.PRECIO) BETWEEN 40 AND 60;

SELECT SUM(D.UNIDADES * D.PRECIO) AS IMPORTE_TOTAL
FROM FACTURA F
JOIN DETALLE D ON F.NUMERO = D.NUMERO
WHERE F.PAGADO = TRUE;

SELECT SUM(D.UNIDADES * D.PRECIO) AS IMPORTE_TOTAL
FROM FACTURA F
JOIN CLIENTE C ON F.NIF = C.NIF
JOIN DETALLE D ON F.NUMERO = D.NUMERO
WHERE C.NOMBRE = 'ROSA PEREZ DELGADO';

SELECT 
    P.CODIGO, 
    P.DESCRIPCION, 
    SUM(D.UNIDADES) AS UNIDADES_VENDIDAS, 
    SUM(D.UNIDADES * D.PRECIO) AS IMPORTE_RECAUDADO
FROM DETALLE D
JOIN PRODUCTO P ON D.CODIGO = P.CODIGO
GROUP BY P.CODIGO, P.DESCRIPCION;

SELECT 
    SUM((P.MINIMO - P.STOCK) * P.PRECIO) AS IMPORTE_REPOSICION
FROM PRODUCTO P
WHERE P.STOCK < P.MINIMO;

UPDATE PRODUCTO
SET PRECIO = PRECIO * 1.03
WHERE CODIGO = 'BAF4';

INSERT INTO FACTURA (NUMERO, FECHA, PAGADO, NIF)
VALUES (5010, '2024-11-11', FALSE, '11111111A');

DELETE FROM factura
WHERE NUMERO = 5010;

SELECT 
    P.CODIGO, 
    P.DESCRIPCION, 
    SUM(D.UNIDADES) AS UNIDADES_VENDIDAS
FROM PRODUCTO P
JOIN DETALLE D ON P.CODIGO = D.CODIGO
GROUP BY P.CODIGO, P.DESCRIPCION;

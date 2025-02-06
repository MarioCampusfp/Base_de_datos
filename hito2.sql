-- 1. Crear la base de datos
CREATE DATABASE IF NOT EXISTS triangulos;
USE triangulos;

-- 2. Crear procedimiento almacenado para gestionar la tabla y llenarla con datos aleatorios
DELIMITER //
CREATE PROCEDURE inicializar_triangulos()
BEGIN
    -- Declarar variable de control
    DECLARE i INT DEFAULT 0;
    
    -- Borrar la tabla si ya existe
    DROP TABLE IF EXISTS triangulo;
    
    -- Crear la tabla de triángulos
    CREATE TABLE triangulo (
        id_triangulo INT AUTO_INCREMENT PRIMARY KEY,
        lado1 INT,
        lado2 INT,
        lado3 INT
    );
    
    -- Insertar 20 registros con valores aleatorios entre 1 y 5
    WHILE i < 20 DO
        INSERT INTO triangulo (lado1, lado2, lado3)
        VALUES (FLOOR(1 + RAND() * 5), FLOOR(1 + RAND() * 5), FLOOR(1 + RAND() * 5));
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

-- Ejecutar el procedimiento para inicializar la tabla
CALL inicializar_triangulos();

-- 3. Crear función para determinar el tipo de triángulo
DELIMITER //
CREATE FUNCTION tipo_triangulo(a INT, b INT, c INT) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(20);
    IF a = b AND b = c THEN
        SET resultado = 'Equilátero';
    ELSEIF a = b OR b = c OR a = c THEN
        SET resultado = 'Isósceles';
    ELSE
        SET resultado = 'Escaleno';
    END IF;
    RETURN resultado;
END //
DELIMITER ;

-- 4. Crear función para calcular el perímetro
DELIMITER //
CREATE FUNCTION perimetro_triangulo(a INT, b INT, c INT) RETURNS INT
DETERMINISTIC
BEGIN
    RETURN a + b + c;
END //
DELIMITER ;

-- 5. Ejecutar una consulta que muestre los triángulos con su tipo y perímetro
SELECT id_triangulo, lado1, lado2, lado3, 
       tipo_triangulo(lado1, lado2, lado3) AS tipo, 
       perimetro_triangulo(lado1, lado2, lado3) AS perimetro
FROM triangulo;


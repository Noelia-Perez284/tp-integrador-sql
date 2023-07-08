/*Ejercicio 6 Funciones:
Crea una función que calcule el promedio de precios de los productos.*/

DELIMITER //
CREATE FUNCTION calcular_promedio_precios()
RETURNS DECIMAL(10, 4)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10, 4);
    
    SELECT AVG(precio) INTO promedio
    FROM producto;
    
    RETURN promedio;
END  //
DELIMITER ;

/*Utiliza la función para obtener el promedio de precios de todos los productos.*/

SELECT  calcular_promedio_precios();
/*ejercicio 5*/

/*Crea un STORE PROCEDURE que calcule el total de ventas para un cliente dado.*/

DELIMITER $$
CREATE PROCEDURE calcular_total_ventas(IN cliente_id INT, OUT total_venta DECIMAL(10,4))
BEGIN
    DECLARE total_venta_temp DECIMAL(10,4); -- Declara la variable temporal
    
    SELECT SUM(total) INTO total_venta_temp
    FROM orden_de_compra
    WHERE id_cliente = cliente_id;
    
    SET total_venta = total_venta_temp; -- Asigna el valor a la variable de salida
END$$
DELIMITER ;

/*Utiliza el STORE PROCEDURE para obtener el total de ventas de un cliente
específico.*/

CALL calcular_total_ventas(94, @total_venta);
SELECT @total_venta;
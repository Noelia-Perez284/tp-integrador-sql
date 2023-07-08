/*7. Transacciones*/

/*Crea una transacción que inserte un nuevo cliente y una nueva orden de compra al
mismo tiempo.*/


DELIMITER //
CREATE PROCEDURE insertar_cliente_y_orden(
    IN numero_cliente VARCHAR(45),
    IN nombre VARCHAR(45),
    IN apellido VARCHAR(45),
    IN direccion VARCHAR(45),
    IN email VARCHAR(45),
    IN telefono VARCHAR(45),
    IN numero_orden INT,
    IN total DECIMAL(10, 4)
)
BEGIN
 DECLARE v_error INT DEFAULT 0;

    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
        END;
        
        START TRANSACTION;

               -- Insertar nuevo cliente
    INSERT INTO cliente (numero_cliente, nombre, apellido, direccion, email, telefono) 
        VALUES (numero_cliente, nombre, apellido, direccion, email, telefono);
    -- Obtener el ID del nuevo cliente insertado
    SET @cliente_id = LAST_INSERT_ID();
    -- Insertar nueva orden de compra relacionada al cliente
    INSERT INTO orden_de_compra (id_cliente, numero_de_orden, fecha, totalproducto) 
        VALUES (LAST_INSERT_ID(), numero_orden, NOW(), total);
        COMMIT;
    END;
END //
DELIMITER ;

CALL insertar_cliente_y_orden('322', 'lucas', 'garcia', 'colon 3456', 'maillucas@gmail.com', '221256798', 1111, 211.00);

select * from orden_de_compra order by numero_de_orden desc  limit 0,1;
select * from cliente ORDER BY id_cliente desc limit 0,1

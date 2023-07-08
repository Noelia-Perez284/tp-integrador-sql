/*Ejercicio8 Triggers:*/

/*Crea un TRIGGER que actualice el stock de un producto después de realizar una
orden de compra.*/

DELIMITER //
CREATE TRIGGER actualizar_stock_despues_insertar_detalle
AFTER INSERT ON detalle_orden_de_compra
FOR EACH ROW
BEGIN
    -- Actualizar el stock del producto
    UPDATE producto
    SET stock_actual = stock_actual - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END //
DELIMITER ;

select * from orden_de_compra order by numero_de_orden desc; 
select *from detalle_orden_de_compra;
select *from producto;


INSERT INTO detalle_orden_de_compra (id_orden_de_compra, id_producto, cantidad, id_cliente)
VALUES
(112, 40, 50, 110);


/*3. Modificación de tablas*/

/*Agrega una columna "descuento" a la tabla "Productos" utilizando ALTER TABLE.*/

ALTER TABLE producto
ADD descuento DECIMAL(10, 2);

/*Modifica el tipo de datos de la columna "precio" en la tabla "Productos" utilizando
ALTER COLUMN.*/
ALTER TABLE producto
MODIFY COLUMN precio DECIMAL(10, 4);

ALTER TABLE producto
MODIFY COLUMN descuento DECIMAL(10, 4);

UPDATE producto
SET descuento = 0.10
WHERE id_producto > 0 AND precio > 100;

/*borrar las ordenes de compra que no tienen detalle*/

delete from orden_de_compra
where id_orden_de_compra not in (
select id_orden_de_compra 
from detalle_orden_de_compra
) and id_orden_de_compra >0 ;

/*subconsultas*/
/*clientes que tienen orden de compra*/
SELECT nombre, apellido
FROM cliente
WHERE EXISTS (
SELECT *
FROM orden_de_compra
WHERE id_cliente =

cliente.id_cliente);
/*clientes que no tienen orden de compra*/

SELECT nombre, apellido
FROM cliente
WHERE NOT EXISTS (
SELECT *
FROM orden_de_compra
WHERE id_cliente =
cliente.id_cliente);

/*Seleccionar las ordenes de compra que se hayan
realizado sobre todos los productos.*/
SELECT *
FROM detalle_orden_de_compra
WHERE id_producto = ALL (
SELECT id_producto
FROM producto);


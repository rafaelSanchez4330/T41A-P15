--03 - Crear una función que devuelva los productos con stock menor a un valor dado.

-- Parámetro: cantidad mínima.
-- Retorno: tabla con productos.

CREATE OR REPLACE FUNCTION productos_stock_menor(cantidad_minima INT)
RETURNS TABLE(id INT, cantidad INT) AS $$
BEGIN
  RETURN QUERY SELECT p.id,p.cantidad FROM productos p WHERE p.cantidad<cantidad_minima;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM productos_stock_menor(100);

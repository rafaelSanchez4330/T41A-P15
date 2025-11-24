-- 01 - Crear una función que calcule el descuento aplicado a un producto.

-- Parámetros: precio original, porcentaje de descuento.
-- Retorno: precio final.

CREATE OR REPLACE FUNCTION calculo_descuento_aplicado(p_Ori NUMERIC(5,2), p_desc NUMERIC(5,2))
RETURNS NUMERIC(5,2) AS $$
BEGIN
  RETURN p_Ori - (p_Ori/100*p_desc);
END;
$$ LANGUAGE plpgsql;

SELECT * FROM calculo_descuento_aplicado(100.00,20.00);

--04 - Crear una función que reciba una fecha y devuelva el día de la semana.

-- Parámetro: fecha.
-- Retorno: texto.
CREATE OR REPLACE FUNCTION dia_semana(fecha DATE)
RETURNS TEXT AS $$
BEGIN 
  RETURN TO_CHAR(fecha::DATE, 'Day');
END;
$$ LANGUAGE plpgsql;

SELECT * FROM dia_semana('2025-11-18');

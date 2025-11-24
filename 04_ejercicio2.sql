--02 - Crear una función que valide si un correo electrónico contiene '@'.

-- Parámetro: texto.
-- Retorno: booleano.

CREATE OR REPLACE FUNCTION validar_correo(f_correo TEXT)
RETURNS BOOLEAN AS $$
BEGIN
  IF position('@' IN f_correo)>0 THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM validar_correo('juan');
SELECT * FROM validar_correo('juan@email.com');

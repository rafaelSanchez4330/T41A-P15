--05 - Crear una función que cuente cuántos empleados hay en un departamento.

-- Parámetro: ID del departamento.
-- Retorno: entero.
CREATE OR REPLACE FUNCTION empleados_departamento(id_d INT)
RETURNS INT AS $$
BEGIN
  RETURN
  COUNT(*) FROM empleados e
  JOIN departamento d ON e.id_departamento = d.id
  WHERE d.id = id_d;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM empleados_departamento(2);

CREATE TABLE productos(
  id SERIAL PRIMARY KEY,
  precio NUMERIC(5,2),
  cantidad INT
);

CREATE TABLE departamento(
  id SERIAL PRIMARY KEY,
  nombre TEXT
);

CREATE TABLE empleados(
  id SERIAL PRIMARY KEY,
  correo TEXT,
  id_departamento INT,
  FOREIGN KEY(id_departamento) REFERENCES departamento(id)
);

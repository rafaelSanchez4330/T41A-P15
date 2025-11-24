import pytest
import psycopg2
from pytest import approx

DB_CONFIG = {
    "dbname": "test_db",
    "user": "postgres",
    "password": "postgres",
    "host": "localhost",
    "port": 5432
}

@pytest.fixture(scope="function")
def db():
    conn = psycopg2.connect(**DB_CONFIG)
    conn.autocommit = False
    cur = conn.cursor()

    yield cur

    conn.rollback()
    cur.close()
    conn.close()


# ---------------------------
# TEST EJERCICIO 1
# ---------------------------

def test_calculo_descuento(db):
    db.execute("SELECT calculo_descuento_aplicado(100, 20);")
    result = db.fetchone()[0]

    assert result == approx(80.00)


# ---------------------------
# TEST EJERCICIO 2
# ---------------------------

def test_validar_correo_true(db):
    db.execute("SELECT validar_correo('hola@mail.com');")
    assert db.fetchone()[0] is True

def test_validar_correo_false(db):
    db.execute("SELECT validar_correo('nomail');")
    assert db.fetchone()[0] is False


# ---------------------------
# TEST EJERCICIO 3
# ---------------------------

def test_productos_stock_menor(db):
    db.execute("SELECT COUNT(*) FROM productos_stock_menor(10);")
    cantidad = db.fetchone()[0]

    assert cantidad > 0


# ---------------------------
# TEST EJERCICIO 4
# ---------------------------

def test_dia_semana(db):
    db.execute("SELECT dia_semana('2025-11-18');")
    dia = db.fetchone()[0].strip().lower()

    assert dia in ["tuesday", "martes"]


# ---------------------------
# TEST EJERCICIO 5
# ---------------------------

def test_empleados_departamento(db):
    db.execute("SELECT empleados_departamento(2);")
    resultado = db.fetchone()[0]

    # Ya sabemos que en tu data hay 3 empleados en departamento 2
    assert resultado == 3

import pytest

# @pytest.fixture
def database():
    return {"db": "test_database"}

@pytest.fixture
def db_connection(database):
    return f"Connection to {database['db']} established"

def test_connection(db_connection):
    assert db_connection == "Connection to test_database established"

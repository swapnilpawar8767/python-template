def test_example():
    assert 1 + 1 == 2
    
from src.main import add

def test_add():
    assert add(2, 3) == 5  # This will pass

def test_add_fail():
    assert add(2, 2) == 5  # This will fail intentionally

import pytest

def func(x):
    return x*2

def test_func():
    assert func(5) == 11

def test_func2():
    assert func(5) == 10

def test_func3():
    assert func(5) == 11



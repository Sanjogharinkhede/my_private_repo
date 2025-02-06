"""
1. be very specific while writing the testcases
2. avoid overusing assert
3. write custom messages for clarity
"""
import pytest

# Check equal cases
def test_equality():
    assert 5*2==10

# Check not equal cases
def inequality_test():
    assert 5*2!=11

# checking a value present in collection
def test_membership():
    assert 3 in [1,1,1,2,2,3,4,5,6,6,9,8]

# checking a cond is true or false
def test_boolean():
    assert not False

def test_comp():
    assert 10>1

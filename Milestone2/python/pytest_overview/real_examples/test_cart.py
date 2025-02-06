"""
Amazon-Like E-commerce Cart Functionality

Scenario:
A user adds products to their shopping cart,
 and we need to verify that the cart maintains the correct items before and after login.

Requirements:
Use a fixture to simulate the shopping cart.
Ensure that items persist even after login.
Verify that removing an item updates the cart correctly.
Question:
Implement a module-scoped fixture cart that starts with an empty list.
Write two test cases:
test_add_item → Add an item to the cart and assert it's in the list.
test_remove_item → Remove an item and assert it's no longer in the cart.
Ensure that the fixture is shared across tests (cart state should persist).
"""

import pytest

@pytest.fixture(scope='module')
def cart():
    ls=[]
    yield ls
    ls.clear()


def test_add_item(cart):
    cart.append("apple")
    assert 'apple' in cart

def test_remove_item(cart):
    cart.remove("apple")
    assert 'apple' not in cart
    

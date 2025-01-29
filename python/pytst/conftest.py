import pytest


@pytest.fixture
def fruits_bowl():
    return ["Fr","fr2","fr3"]
# def test_fruit_count(fruits_bowl):
#     return len(fruits_bowl)==3
# def test_fruit_present(fruits_bowl):
#     return "Fr" in fruits_bowl


@pytest.fixture
def gen_even():
    data=[]
    for x in range(2,20,2):
        data.append(x)
    data.append(99)
    yield data
    data.clear()



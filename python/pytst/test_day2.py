def test_fruit_count(fruits_bowl):
    # print(fruits_bowl)
    assert len(fruits_bowl)==5
def test_fruit_present(fruits_bowl):
    assert "Fr" in fruits_bowl

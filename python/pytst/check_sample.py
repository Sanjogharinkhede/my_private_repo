import pytest
grade =4
@pytest.mark.skipif(grade < 3, reason="Skipping because the student is in 4th grade")
@pytest.mark.xfail(reason="Known tricky problem")
def test_combined_example():
    # This test might fail, and that’s okay
    assert 10 / 2 == 6


def test_dynamic_skip():
    homework_done = False

    if not homework_done:
        pytest.skip("Skipping because homework is not done")

    assert 2 + 2 == 4

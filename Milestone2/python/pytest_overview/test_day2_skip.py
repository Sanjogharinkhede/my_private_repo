import  pytest


# @pytest.mark.skip(reason="This test is not ready yet")
# def test_homework_example():
#     # This test will not run
#     assert 1 + 1 == 2
#
# number=5
# @pytest.mark.skipif(number>5,reason="This test is not ready yet")
# def test_homework_example2():
#     # This test will not run
#     assert 1 + 1 == 2
#
#
# def test_dynamic_skip():
#     homework_done = False
#
#     if not homework_done:
#         pytest.skip("Skipping because homework is not done")
#
#     assert 2 + 2 == 4
#
# @pytest.mark.xfail(reason="This problem has a known mistake")
# def test_expected_failure():
#     # This test will fail, but it's okay because we expected it
#     assert 2 + 2 == 5
#
#
# grade = 4
#
#
# @pytest.mark.skipif(grade < 3, reason="Skipping because the student is in 4th grade")
# @pytest.mark.xfail(reason="Known tricky problem")
# def test_combined_example():
#     # This test might fail, and that’s okay
#     assert 10 / 2 == 6


# def test_dynamic_skip():
#     homework_done = input("ENTER SOMETHING!")
# 
#     if not homework_done:
#         pytest.skip("Skipping because homework is not done")
# 
#     assert 2 + 2 == 4
#
def test_even(gen_even):
    print(gen_even)

    for i in gen_even:
        if i==10:
            pytest.skip(f"Skip just for fun {i}")
        assert i%2==0, f"i am at{i}"


def test_approx():

    assert 0.2+0.1 == 0.3 , f"{.2+.1}"

def test_approx2():
    assert 0.2+0.1==pytest.approx(0.3)
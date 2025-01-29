import pytest


# @pytest.mark.parametrize("number", [1, 2, 3, 4])
# def test_is_positive(number):
#     assert number >3
#

# @pytest.mark.parametrize("ls", ["a","d","d","1",1.3,4,5])
# def test_is_integer_or_string(ls):
#     flag = isinstance(ls,int) or isinstance(ls,str)
#     print(flag)
#     assert  flag
#


# @pytest.fixture()
# def base_feature():
#     return 10
#
# @pytest.mark.parametrize("mult , res",
#                          [(1, 10),
#                           (3, 30),
#                           (11, 110)
#                           ],ids=["1*10=10","3*10=30","11*10==110"]
#                          )
# def test_mult(base_feature, mult, res):
#     assert base_feature * mult == res


def divide(a,b):
    if b==0:raise TypeError("Some Msg")
    return a/b

# @pytest.mark.slow
def test_divide_by_0():
    with pytest.raises(ValueError):
        divide(10,0)
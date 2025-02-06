import  pytest

@pytest.fixture(params=["admin", "guest", "moderator"])
def user_role(request):
    return request.param

def test_access_control(user_role):
    assert user_role in ["admin", "guest", "moderator"]

def is_even(num):
    return num%2==0

@pytest.mark.parametrize("ip,exp",((10,True),(9,False),(0,True),(-9,None),(-10,None)))
def test_is_even(ip,exp):
    assert is_even(ip)==exp
"""-x
unit is a family of unit testing frameworks it includes  tools like
junit(java), Nunit(.net) etc.

-It is basically used
for prearing and cleaning up the test environments x

"""

import pytest


@pytest.fixture
def sample_data():
    data = [1, 2, 3]
    yield data
    data.clear()


def test_sample_data(sample_data):
    assert len(sample_data) == 3

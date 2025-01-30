import pytest
class TestExample:
    def setup_example(self):
        print("setup")
    def teardown_example(self):
        print("setup")
    def test_method1(self):
        assert 1+2==3
    def test_method2(self):
        assert 1+2!=3
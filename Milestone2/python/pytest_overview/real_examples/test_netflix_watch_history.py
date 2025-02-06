"""
Netflix-Like Watch History Verification
Scenario:
A user watches a movie, and it should appear in their watch history.
 If they rewatch it, the timestamp should update, not duplicate the entry.

Requirements:
Create a session-scoped fixture that stores watch history.
Simulate a user watching a movie twice with a timestamp update.
Ensure no duplicate entries in watch history.
Question:
Write a fixture watch_history() that starts as an empty dictionary {}.
Write test cases:
test_first_watch → Adds a movie with a timestamp.
test_rewatch_updates_timestamp → Ensures the timestamp updates instead of duplicating the entry.
Ensure the watch history persists across multiple tests but updates correctly.
💡 Hint: Use a dictionary {movie_name: timestamp} in your fixture.

"""


import pytest,datetime

@pytest.fixture(scope='session')
def watch_history():
    hs={}
    yield hs
    hs.clear()

def test_first_watch(watch_history):
    watch_history["movie_1"]=datetime.time
    assert len(watch_history)==1

def test_rewatch_updates_timestamp(watch_history):
    time=datetime.time
    watch_history["movie_1"]=time
    assert len(watch_history)==1 and "movie_1" in watch_history and watch_history["movie_1"]==time
from datetime import datetime
from datetime import timedelta

def add_gigasecond(now):
    return now + timedelta(seconds = 10 ** 9)
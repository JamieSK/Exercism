from calendar import monthrange, weekday
from re import sub
from time import strptime
from datetime import date, timedelta

class MeetupDayException(Exception):
    pass

def meetup_day(year, month, day, which):
    weekdayCode = strptime(day, "%A").tm_wday
    firstDay, lastDate = monthrange(year, month)

    rightDays = []
    checkDate = date(year, month, 1)
    oneDay = timedelta(days=1)
    while checkDate.month == month:
        if checkDate.weekday() == weekdayCode:
            rightDays.append(checkDate.day)
        checkDate += oneDay

    if which == 'teenth':
        for checkDate in rightDays:
            if checkDate in range(13, 20):
                rightDay = checkDate
    elif which == 'last':
        rightDay = rightDays[-1]
    else:
        try:
            rightDay = rightDays[int(which[0]) - 1]
        except IndexError:
            raise MeetupDayException

    return date(year, month, rightDay)
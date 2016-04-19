# -*- coding: utf-8 -*-

from iso8601 import parse_date
from datetime import datetime, timedelta


def get_all_uatenders_dates(period_interval=31):
    now = datetime.now()
    return {
        'EndPeriod': (now + timedelta(minutes=8)).strftime("%d.%m.%Y %H:%M"),
        'StartDate': (now + timedelta(minutes=8)).strftime("%d.%m.%Y %H:%M"),
        'EndDate': (now + timedelta(minutes=(8 + period_interval))).strftime("%d.%m.%Y %H:%M"),
    }

def convert_uatenders_string_to_common_string(string):
    return {
        u"килограммы": u"кілограм",
    }.get(string, string)

def convert_datetime_for_delivery(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%Y-%m-%d %H:%M")
    return date_string

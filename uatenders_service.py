# -*- coding: utf-8 -*-

from iso8601 import parse_date
from datetime import datetime, timedelta


def get_all_uatenders_dates(tender_data):
    return {
        'EndPeriod': tender_data['data']['enquiryPeriod']['endDate'] ,
        'StartDate': tender_data['data']['tenderPeriod']['startDate'],
        'EndDate':   tender_data['data']['tenderPeriod']['endDate'],
    }

def convert_uatenders_string_to_common_string(string):
    return {
        u"килограммы": u"кілограм",
        u"ПДВ)": True,
        u"Картонки": u"Картонні коробки",
    }.get(string, string)

def convert_datetime_for_delivery(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%d-%m-%Y %H:%M")
    return date_string

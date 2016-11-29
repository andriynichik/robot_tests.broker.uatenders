# -*- coding: utf-8 -*-
import pytz
from iso8601 import parse_date
from datetime import datetime, timedelta
import os
import urllib

def get_all_uatenders_dates(tender_data):
    return {
        'StartDate': tender_data['data']['auctionPeriod']['startDate'],
        
    }

def convert_uatenders_string_to_common_string(string):
    string = string.strip()
    return {
        u"килограммы": u"кілограм",
        u"(Не враховуючи ПДВ)": False,
        u"(Враховуючи ПДВ)": True,
        u"Картонки": u"Картонні коробки",
        u"Аукціон відмінено": u"cancelled",
        u"Аукціон завершено": u"complete",
        u"Період уточнень": u"active.enquiries",
        u"Аукціон не відбувся": u"unsuccessful",
        u"Очікування пропозицій": u"active.tendering",
        u"Період аукціону": u"active.auction",
        u"Кваліфікація переможця": u"active.qualification",

    }.get(string, string)

def convert_datetime_for_delivery(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%d-%m-%Y %H:%M")
    return date_string

def adapt_procuringEntity(tender_data):
    tender_data['data']['procuringEntity']['name'] = u'ТОВ "Роги і копита"'
    tender_data['data']['procuringEntity']['address']['countryName'] = u"Україна"
    return tender_data

def adapt_item(tender_data, role_name):
    if role_name != 'viewer':
        if 'unit' in tender_data['data']['items'][0]:
            for i in tender_data['data']['items']:
                i['unit']['name'] = my_dict[i['unit']['name']]
    return tender_data



def convert_auction_date(date):

    date_obj = datetime.strptime(date, "%d.%m.%Y %H:%M")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)
    return localized_date.strftime("%Y-%m-%dT%H:%M:%S.%f%z")

def get_unit_id(string):
    return {
        u"послуга": u"9",
        u"метри квадратні": u"13",
    }.get(string, string)
 
def get_file_path():
    return os.path.join(os.getcwd(), 'src/robot_tests.broker.uatenders/fileupload.txt')

def download(url, file_name, output_dir):
    urllib.urlretrieve(url, ('{}/{}'.format(output_dir, file_name)))


def is_qualified(bid_data, username):
    if username == 'uatenders_Provider':
        if 'qualified' in bid_data['data']:
            return False
    return True

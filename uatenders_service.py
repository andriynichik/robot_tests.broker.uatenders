# -*- coding: utf-8 -*-

def convert_uatenders_string_to_common_string(string):
    return {
        u"килограммы": u"кілограм",
    }.get(string, string)

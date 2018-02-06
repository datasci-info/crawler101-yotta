import requests
from lxml import etree
import pandas as pd
import re

def getStoreData(city,town):
    postData = {"commandid" : "SearchStore",
                "city" : city,
                "town": town}

    res = requests.post("http://emap.pcsc.com.tw/EMapSDK.aspx",data=postData)
    doc = etree.fromstring(res.text.encode("utf8"))
    data = map(lambda e:dict([(c.tag,c.text) for c in e.iterchildren()]),  doc.xpath("//GeoPosition"))
    df = pd.DataFrame(list(data))
    return df

def ls_town_df(cityId):
    postData = {"commandid":"GetTown",
                "cityid":cityId}
    res = requests.post("http://emap.pcsc.com.tw/EMapSDK.aspx",data=postData)
    doc = etree.fromstring(res.text.encode("utf8"))
    data = map(lambda e:dict([(c.tag,c.text) for c in e.iterchildren()]),  doc.xpath("//GeoPosition"))
    df = pd.DataFrame(list(data))
    return df

def ls_city_id():
    url = 'http://emap.pcsc.com.tw/lib/areacode.js'
    city_data = requests.get(url)

    # Defining our regex pattern
    regex = r'AreaNode\(\'(.*)\'\, new bu\([0-9]+\,[0-9]+\)\, \'([0-9]{2})\'\)'
    matches = re.finditer(regex, city_data.text)
    cities = list()

    for matchNum, match in enumerate(matches):
        cities.append({
            'city': match.group(1),
            'id': match.group(2)
        })
    return cities
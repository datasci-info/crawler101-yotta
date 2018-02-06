import requests
import re
from datetime import datetime
import pandas as pd
import numpy as np

class NotFindDataError(Exception):
    def __init__(self, url):
        self.url

def stock_major_data(stock_id):
    hds = {
        "user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36"
    }
    
    url = "https://tw.stock.yahoo.com/d/s/major_{stock_id}.html".format(stock_id=stock_id)
    #res = requests.get(url)
    res = requests.get(url, headers=hds)
    res.raise_for_status()
    
    tables = pd.read_html(res.text)
    filtered_tables = list(filter(lambda xx:xx.shape[1] == 8, tables))
    if len(filtered_tables) == 0:
        raise NotFindDataError(url)
    else:
        df = list(filter(lambda xx:xx.shape[1] == 8, tables))[0]
    
    df = pd.DataFrame(np.r_[df.values[1:,0:3], df.values[1:,4:7]],columns=["broker","long","short"])
    
    pat = re.compile(u"([0-9]+ /[0-9]+ /[0-9]+)")
    date = list(map(int,pat.findall(res.text)[0].split("/")))
    date[0] = 1911 + date[0]
    date = datetime(*date)
    
    df["stock_id"] = stock_id
    df["date"] = date
    
    df = df[["date","stock_id", "broker","long","short"]]
    
    return df
    
    

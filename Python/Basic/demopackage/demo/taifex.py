import requests
from pyquery import PyQuery
import os

def ls_future_daily_tick_urls():
    res = requests.get("http://www.taifex.com.tw/eng/eng3/eng3_1_3.asp")
    S = PyQuery(res.text)
    files = filter(lambda xx:xx.endswith(".zip"),S("input.btn_orange").map(lambda i,e:PyQuery(e).attr("onclick").replace("window.open('../..","").replace("')","")))
    urls = ["http://www.taifex.com.tw" + f for f in files]
    return urls

def download_file(url, path="./"):
    local_filename = url.split('/')[-1]
    local_filename = os.path.join(path,local_filename)
    # NOTE the stream=True parameter
    r = requests.get(url, stream=True)
    with open(local_filename, 'wb') as f:
        for chunk in r.iter_content(chunk_size=1024): 
            if chunk: # filter out keep-alive new chunks
                f.write(chunk)
                #f.flush() commented by recommendation from J.F.Sebastian
    return local_filename



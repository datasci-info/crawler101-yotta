library(httr)
library(magrittr)

url = "http://emap.pcsc.com.tw/EMapSDK.aspx"

res = POST(url,
           body=list(commandid="SearchStore",city="台北市",town="大安區"))

res
res %>% content()



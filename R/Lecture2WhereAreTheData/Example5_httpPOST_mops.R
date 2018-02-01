library(httr)
library(magrittr)

url = "http://mops.twse.com.tw/mops/web/ajax_t51sb01"
postData = "encodeURIComponent=1&step=1&firstin=1&TYPEK=sii&code="

res = POST(url, body = postData)
res
res %>% 
  content(as = "text")


url = "http://mops.twse.com.tw/mops/web/ajax_t51sb01"
postData = list(encodeURIComponent=1,step=1,firstin=1,TYPEK="sii",code="")

res = POST(url, body = postData, encode = "form")
res
res %>% 
  content(as = "text")

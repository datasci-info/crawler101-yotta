detach("package:httr", unload=TRUE)
library(httr)
library(magrittr)


url = "http://buy.yungching.com.tw/region/台北市-_c/pricereduction_filter/"

res = url %>% GET
res
res %>% content(as = "text")

res$request


res = url %>% GET(add_headers("User-Agent"="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.76 Safari/537.36"))
res
res %>% content(as = "text")

res$request


res = url %>% GET(user_agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.76 Safari/537.36"))
res
res %>% content(as = "text")

res$request
 
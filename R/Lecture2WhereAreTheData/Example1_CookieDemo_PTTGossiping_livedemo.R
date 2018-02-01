detach("package:httr", unload=TRUE)
library(httr)
library(magrittr)

url = "https://www.ptt.cc/bbs/Gossiping/index.html"

res = url %>% GET
res
res %>% content(as = "text")

str(res)
res$all_headers
res$request


res = url %>% GET(set_cookies(over18=1))
res
res %>% content(as = "text")

res$all_headers
res$request

httr::set_cookies
?set_cookies

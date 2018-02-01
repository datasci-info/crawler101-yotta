detach("package:httr", unload=TRUE)
library(httr)
library(magrittr)


url = "http://httpbin.org/get"

res = url %>% GET
res
res %>% content(as = "text")
res %>% content


res = url %>% GET(add_headers("referrer"="http://httpbin.org/get"))
res
res %>% content(as = "text")
res %>% content


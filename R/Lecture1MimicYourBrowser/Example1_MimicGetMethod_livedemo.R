library(httr)

url = "http://ecshweb.pchome.com.tw/search/v3.3/all/results?q=sony&page=1&sort=rnk/dc"
res = GET(url)
res

str(res)
res$headers
res$request
str(res$request)
res$request$headers
res$cookies
res$content


content(res,as = "raw")
content(res,as = "text")
content(res)


library(magrittr)

res %>% 
  content %>% 
  .$prods %>% 
  do.call(rbind,.) %>% 
  as.data.frame()


df = res %>% 
  content %>% 
  .$prods %>% 
  do.call(rbind,.) %>% 
  as.data.frame()

df %>% View

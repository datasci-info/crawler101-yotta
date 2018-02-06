detach("package:httr", unload=TRUE)
library(httr)
library(magrittr)

url = "https://www.ptt.cc/bbs/Gossiping/index.html"

res = url %>% GET(set_cookies(over18=1))
res
res %>% content(as = "text")


library(rvest)

res %>% 
  content(as = "text") %>% 
  read_html() %>% 
  html_nodes(css = ".r-ent")

res %>% 
  content(as = "text") %>% 
  read_html() %>% 
  html_nodes(css = ".r-ent") %>% 
  .[1] %>% (function(node){
    #node = node %>% as.character() %>% read_html
    list(
      title=node %>% html_node(css = ".title") %>% html_text()
      ,author=node %>% html_node(css = ".author") %>% html_text()
      ,date=node %>% html_node(css = ".date") %>% html_text()
      ,nrec=node %>% html_node(css = ".nrec") %>% html_text()
    )
  })(.)


df = res %>% 
  content(as = "text") %>% 
  read_html() %>% 
  html_nodes(css = ".r-ent") %>% 
  map(function(node){
    #node = node %>% as.character() %>% read_html
    list(
      title=node %>% html_node(css = ".title") %>% html_text()
      ,author=node %>% html_node(css = ".author") %>% html_text()
      ,date=node %>% html_node(css = ".date") %>% html_text()
      ,nrec=node %>% html_node(css = ".nrec") %>% html_text()
    )
  }) %>% do.call(rbind,.) %>% as.data.frame() %>% 
  map(unlist) %>% do.call(data.frame,.)

df %>% View

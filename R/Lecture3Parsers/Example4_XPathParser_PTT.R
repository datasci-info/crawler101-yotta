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
  html_nodes(xpath = "//div[@class='r-ent']")

res %>% 
  content(as = "text") %>% 
  read_html() %>% 
  html_nodes(xpath = "//div[@class='r-ent']") %>% 
  .[2] %>% (function(node){
    #node = node %>% as.character() %>% read_html
    list(
      title=node %>% html_node(xpath = "//div[@class='title']") %>% html_text()
      ,author=node %>% html_node(xpath = "//div[@class='author']") %>% html_text()
      ,date=node %>% html_node(xpath = "//div[@class='date']") %>% html_text()
      ,nrec=node %>% html_node(xpath = "//div[@class='nrec']/span[@class='hl f2']") %>% html_text()
    )
  })(.)
    


node = res %>% 
  content(as = "text") %>% 
  read_html() %>% 
  html_nodes(xpath = "//div[@class='r-ent']") %>% 
  .[2] 

node %>% html_node(xpath = "//div[@class='title']") %>% html_text()
node %>% html_node(css = ".title") %>% html_text()


res %>% 
  content(as = "text") %>% 
  read_html() %>% 
  html_nodes(xpath = "//div[@class='r-ent']") %>% 
  map(function(node){
    node = node %>% as.character() %>% read_html
    list(
      title=node %>% html_node(xpath = "//div[@class='title']") %>% html_text()
      ,author=node %>% html_node(xpath = "//div[@class='author']") %>% html_text()
      ,date=node %>% html_node(xpath = "//div[@class='date']") %>% html_text()
      ,nrec=node %>% html_node(xpath = "//div[@class='nrec']/span[@class='hl f2']") %>% html_text()
    )
  })
  


res %>% 
  content(as = "text") %>% 
  read_html() %>% 
  html_nodes(xpath = "//div[@class='r-ent']") %>% 
  map(function(node){
    node = node %>% as.character() %>% read_html
    list(
      title=node %>% html_node(xpath = "//div[@class='title']") %>% html_text()
      ,author=node %>% html_node(xpath = "//div[@class='author']") %>% html_text()
      ,date=node %>% html_node(xpath = "//div[@class='date']") %>% html_text()
      ,nrec=node %>% html_node(xpath = "//div[@class='nrec']/span[@class='hl f2']") %>% html_text()
    )
  }) %>% do.call(rbind,.) %>% as.data.frame() %>% 
  map(unlist) %>% do.call(data.frame,.)

df = res %>% 
  content(as = "text") %>% 
  read_html() %>% 
  html_nodes(xpath = "//div[@class='r-ent']") %>% 
  map(function(node){
    node = node %>% as.character() %>% read_html
    list(
      title=node %>% html_node(xpath = "//div[@class='title']") %>% html_text()
      ,author=node %>% html_node(xpath = "//div[@class='author']") %>% html_text()
      ,date=node %>% html_node(xpath = "//div[@class='date']") %>% html_text()
      ,nrec=node %>% html_node(xpath = "//div[@class='nrec']/span[@class='hl f2']") %>% html_text()
    )
  }) %>% do.call(rbind,.) %>% as.data.frame() %>% 
  map(unlist) %>% do.call(data.frame,.)

df

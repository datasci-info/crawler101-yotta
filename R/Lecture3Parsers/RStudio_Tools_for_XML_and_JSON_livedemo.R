library(jsonview)
library(htmltidy)

library(httr)
library(magrittr)

url = "http://ecshweb.pchome.com.tw/search/v3.3/all/results?q=sony&page=1&sort=rnk/dc"
res = GET(url)

res
res %>% content()

res %>% 
  content(as = "text") %>%
  json_view()

res %>% 
  content(as = "text") %>% 
  json_tree_view()


url = "https://www.ptt.cc/bbs/Gossiping/index.html"
res = url %>% GET(set_cookies(over18=1))

res

res %>% 
  content(as = "text") %>% 
  html_view()


xmlExample ='<?xml version="1.0" encoding="UTF-8"?>
<bookstore>

<book category="cooking">
<title lang="en">Everyday Italian</title>
<author>Giada De Laurentiis</author>
<year>2005</year>
<price>30.00</price>
</book>

<book category="children">
<title lang="en">Harry Potter</title>
<author>J K. Rowling</author>
<year>2005</year>
<price>29.99</price>
</book>

<book category="web">
<title lang="en">XQuery Kick Start</title>
<author>James McGovern</author>
<author>Per Bothner</author>
<author>Kurt Cagle</author>
<author>James Linn</author>
<author>Vaidyanathan Nagarajan</author>
<year>2003</year>
<price>49.99</price>
</book>

<book category="web" cover="paperback">
<title lang="en">Learning XML</title>
<author>Erik T. Ray</author>
<year>2003</year>
<price>39.95</price>
</book>

</bookstore>'

xml_tree_view(xmlExample)
xml_view(xmlExample)

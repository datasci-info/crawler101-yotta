library(httr)
library(magrittr)

url = "http://emap.pcsc.com.tw/EMapSDK.aspx"

res = POST(url,
           body=list(commandid="SearchStore",city="台北市",town="大安區"))

res
res %>% 
  content(as = "text") %>% 
  read_xml() %>% 
  xml_nodes(xpath = "//GeoPosition") %>% 
  .[2] %>% (function(node){
    node = node %>% as.character() %>% read_xml
    keys = xml_children(node) %>% map_chr(xml_name)
    values = xml_children(node) %>% map_chr(xml_text)
    names(values) = keys
    values
  })(.)
  

res %>% 
  content(as = "text") %>% 
  read_xml() %>% 
  xml_nodes(xpath = "//GeoPosition") %>% 
  map(function(node){
    node = node %>% as.character() %>% read_xml
    keys = xml_children(node) %>% map_chr(xml_name)
    values = xml_children(node) %>% map_chr(xml_text)
    names(values) = keys
    values
  }) %>% do.call(rbind,.) %>% 
  as.data.frame()


tw711 = res %>% 
  content(as = "text") %>% 
  read_xml() %>% 
  xml_nodes(xpath = "//GeoPosition") %>% 
  map(function(node){
    node = node %>% as.character() %>% read_xml
    keys = xml_children(node) %>% map_chr(xml_name)
    values = xml_children(node) %>% map_chr(xml_text)
    names(values) = keys
    values
  }) %>% do.call(rbind,.) %>% 
  as.data.frame()

tw711 %>% View


library(tidyverse)

tw711 %>% ggplot(mapping = aes(x = isCityCafe, fill=isATM)) + geom_bar()



library(magrittr)

encodedUrl = "https://tw.news.yahoo.com/%E4%BB%8A%E5%B9%B4%E7%AC%AC9%E8%99%9F%E9%A2%B1%E9%A2%A8%E3%80%8C%E5%B0%BC%E8%8E%8E%E3%80%8D%E5%BD%A2%E6%88%90-%E5%91%A8%E6%9C%AB%E6%81%90%E5%BD%B1%E9%9F%BF%E5%8F%B0%E7%81%A3-060226531.html"
encodedUrl

encodedUrl %>% URLdecode

decodedUrl = encodedUrl %>% URLdecode
decodedUrl

encodedUrl %>% 
  URLdecode %>% 
  URLencode

" " %>% URLencode
' !"#$%&()' %>% URLencode()
' !"#$%&()' %>% URLencode(reserved = T)

"URL?v1=今天&v2=明天" %>% URLencode
"URL?v1=今天&v2=明天" %>% URLencode(reserved = T)

library(httr)

res = encodedUrl %>% GET
res
res %>% content(as = "text")

res = decodedUrl %>% GET
res
res %>% content(as = "text")


URLencode
URLdecode

' !"#$%&()' %>% charToRaw() %>% rawToChar()

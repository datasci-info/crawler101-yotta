
library(httr)
library(magrittr)

postBody = paste(c("content=",URLencode("今天天氣很好123"),Sys.time()),collapse = "")
postBody


res = POST("http://apt-bonbon-93413.appspot.com/sign",
     body=postBody)

res$all_headers

res %>% content(as = "text")

POST("http://apt-bonbon-93413.appspot.com/sign",
     body=list(content=sprintf("[TEST Posting Message] %s At %s","今天天氣很好",Sys.time())))



library(httr)

postBody = paste(c("content=",URLencode("今天天氣很好"),Sys.time()),collapse = "")

POST("http://apt-bonbon-93413.appspot.com/sign",
     body=postBody)

POST("http://apt-bonbon-93413.appspot.com/sign",
     body=list(content=sprintf("[TEST Posting Message] %s At %s","今天天氣很好",Sys.time())))


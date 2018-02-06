# install.packages("quantmod")
library(quantmod)

crawlIDs = c("2330.TW", "USD/TWD", "^TWII", "2454.TW", "2498.TW")

crawlIDs

myGetSyms <- function(sid) {
  if (sid == "USD/TWD"){
    getSymbols(sid,src="oanda")
  }else{
    getSymbols(sid)
  }
}

for (sid in crawlIDs){
  myGetSyms(sid)
}

# install.packages("quantmod")
library(quantmod)

crawlIDs = c("2330.TW", "USD/TWD", "^TWII", "2454.TW", "2498.TW")

for (sid in crawlIDs){
  if (sid == "USD/TWD"){
    getSymbols(sid,src="oanda")
  }else{
    getSymbols(sid)
  }
}

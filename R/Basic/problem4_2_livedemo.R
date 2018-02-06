# install.packages("quantmod")
library(quantmod)

crawlIDs = c("2330.TW", "USD/TWD", "^TWII", "2454.TW", "2498.TW")

getSym <- function(sid) {
  if (sid == "USD/TWD"){
    getSymbols(sid,src="oanda")
  }else{
    getSymbols(sid)
  }
}

getSym(crawlIDs[2])

# for (sid in crawlIDs){
#   getSym(sid)
# }

sapply(X = crawlIDs,FUN = getSym)
lapply(X = crawlIDs,FUN = getSym)

lapply(X = crawlIDs,FUN = function(sid) {
  if (sid == "USD/TWD"){
    getSymbols(sid,src="oanda")
  }else{
    getSymbols(sid)
  }
})

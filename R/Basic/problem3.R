######################################################################
### quantmod 101: get 2330.TW & USD/TWD and play with functions
######################################################################

# install.packages("quantmod")
library(quantmod)


# press TAB
?quantmod
?quantmod::getSymbols
?quantmod::getSymbols.yahoo
?quantmod::getSymbols.oanda

# get 2330.TW with auto.assign = F
args(getSymbols)
Xt = getSymbols("2330.TW",auto.assign = F)
chartSeries(Xt)


# looking at example and source code of quantmod::getSymbols.yahoo
example(getSymbols.yahoo)
getSymbols.yahoo('MSFT',env=globalenv())
getSymbols.yahoo
args(getSymbols.yahoo)
?getSymbols.yahoo


# looking at example and source code of quantmod::getSymbols.oanda
example(getSymbols.oanda)
getSymbols("USD/EUR",src="oanda",from="2005-01-01")
getSymbols.oanda
args(getSymbols.oanda)
?getSymbols.oanda

# quantmod::getSymbols 
getSymbols("USD/TWD",src="oanda")
chartSeries(USDTWD)
chartSeries(to.weekly(USDTWD))


# add + TAB
add 

addSAR()
addSMA()
addCCI()
addBBands()


# add TAs example 
getSymbols("2330.TW")
TW2330 <- get("2330.TW")
chartSeries(TW2330)
addBBands()
addCCI()
addADX()
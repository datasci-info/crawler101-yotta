
######################################################################
### quantmod 101
######################################################################

# install.packages("quantmod")
library(quantmod)

# quantmod::getSymbols 
getSymbols("^TWII")

# view data
head(TWII)
tail(TWII)
View(TWII)
summary(TWII)

# quantmod::chartSeries
chartSeries(TWII)


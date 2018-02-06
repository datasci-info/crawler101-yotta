
######################################################################
### quantmod 101
######################################################################

# install.packages("quantmod")
library(quantmod)

# quantmod::getSymbols 
getSymbols("^GSPC")

?getSymbols

# TWII
# 
# # view data
# head(TWII)
# tail(TWII)
# View(TWII)
# summary(TWII)

GSPC

# quantmod::chartSeries
chartSeries(GSPC)




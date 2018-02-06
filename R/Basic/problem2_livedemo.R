
######################################################################
### quantmod 101: get 3008.TW
######################################################################

# install.packages("quantmod")
library(quantmod)

# quantmod::getSymbols 
getSymbols("3008.TW")
3008.TW

`3008.TW`
get("3008.TW")

Xt <- get("3008.TW")

  
# view data
head(Xt)
tail(Xt)
summary(Xt)
View(`3008.TW`)


# quantmod::chartSeries
chartSeries(`3008.TW`)

######################################################################
### R Basic 
### - assign a variablea to a environment
### - get a variablea from a environment
######################################################################

# show variables (in a env)
ls()
?ls
example(ls)

# assign value of varibles:
3008.TW = 123
`3008.TW` = 123


assign("b",123321)
`3008.TW`
b=123
b<-123
`<-`("x",123)

# view all variables in .GlobalEnv
ls()

# get value of varibles: 
x
get("x")
`x`


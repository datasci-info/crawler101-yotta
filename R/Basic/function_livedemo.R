# Every operator in R is function
v = 1:20
v

# assignment operator of vector
v[10] = 30
v

# function behind assignment operator of vector
`[<-`(v,10,40)

# function behind assignment operator 
ls()

`<-`("abc", 321)
ls()

`<-`("312abc", 123)
ls()

312abc
`312abc`


# define function by yourself
f = function(x,y) 3*x+y
f(3,10)

"a" %in% letters
"a" %in% LETTERS


# define operator by yourself
`%^_^%` = function(x,y) 3*x+y
`%T_T%` = function(x,y) x-y

1 %^_^% 2
2 %^_^% 1
52 %^_^% 40 %T_T% 31
40 %T_T% 31


# functions with variable arguments 
c(3,2,1)
c(1,2,3,4,5)

cbind(c(1,2),c(3,4))
cbind(c(1,2),c(3,4),c(5,6))

rbind(c(1,2),c(3,4),c(5,6))

sum(1,2,3,4)
sum(1,2,3,4,5,6,7)
sum(1:10)

## Happy coding!!!
`%^_^%` = function(...) list(...)
1 %^_^% 2
`%^_^%`(1,2,3,4)


# mysum
mysum = function(...){
  x = list(...)
  a = x[[1]]
  for (y in x[-1]){
    a = a + y
  }
  a
} 

mysum(1,2,3,4)
mysum(1:4)
do.call(mysum,as.list(1:4))


# modified version
mysum_v2 = function(...){
  x = list(...)
  if (length(x) ==1 ){
    x = x[[1]]
  }  
  a = x[[1]]
  for (y in x[-1]){
    a = a + y
  }
  a
} 
mysum_v2(1,2,3,4)
mysum_v2(1:4)
do.call(mysum_v2,as.list(1:4))



# do.call + rbind
library(httr)
url <- "http://ecshweb.pchome.com.tw/search/v3.3/all/results?q=sony&page=1&sort=rnk/dc"
res = GET(url)
res_json = content(res)
do.call(rbind,res_json$prods)


############################################
########### New function style: %>%
############################################
library(magrittr)
url %>% GET %>% content() %>% .$prods %>% do.call(rbind,.) %>% View
View(do.call(rbind,`$`(content(GET(url)),"prods")))


library(readr)
titanic <- read_csv("https://raw.githubusercontent.com/haven-jeon/introduction_to_most_usable_pkgs_in_project/master/bicdata/data/titanic.csv",
                    col_types = cols(survived = col_character()))

titanic %>% View


library(dplyr)
# select sex, count(*) as N from titanic group by sex
titanic %>% group_by(sex) %>% summarise(N=n())
summarise(group_by(titanic,sex),N=n())

library(readxl)
titanic <- read_excel("Lecture4ExtraCourses/titanic.xlsx", 
                      sheet = "titanic", col_types = c("numeric", 
                                                       "text", "text", "text", "text", "text", 
                                                       "numeric", "numeric", "text", "numeric", 
                                                       "text", "text", "text", "text", "text"))
View(titanic)

library(tidyverse)
library(magrittr)

titanic %>% 
  ggplot(mapping = aes(x = sex)) + geom_bar()

titanic %>% 
  ggplot(mapping = aes(x = sex, fill=survived)) + geom_bar()
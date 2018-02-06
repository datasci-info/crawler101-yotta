library(readr)
titanic <- read_csv("https://raw.githubusercontent.com/haven-jeon/introduction_to_most_usable_pkgs_in_project/master/bicdata/data/titanic.csv",
                    col_types = cols(survived = col_character()))

View(titanic)

library(tidyverse)
library(magrittr)

titanic %>% 
  ggplot(mapping = aes(x = sex)) + geom_bar()

titanic %>% 
  ggplot(mapping = aes(x = survived)) + geom_bar()

titanic %>% 
  ggplot(mapping = aes(x = sex, fill=survived)) + geom_bar()




titanic_int <- read_csv("https://raw.githubusercontent.com/haven-jeon/introduction_to_most_usable_pkgs_in_project/master/bicdata/data/titanic.csv")

titanic

titanic_int

titanic_int %>% 
  ggplot(mapping = aes(x = sex)) + geom_bar()

titanic_int %>% 
  ggplot(mapping = aes(x = survived)) + geom_bar()


titanic_int %>% 
  ggplot(mapping = aes(x = sex, fill=survived)) + geom_bar()

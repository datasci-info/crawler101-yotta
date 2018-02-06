# install.packages("jpeg")
library(httr)

res = GET("http://cran.r-project.org/Rlogo.jpg")

res

rlogo <- content(res)
rlogo

plot(0:1, 0:1, type = "n")
rasterImage(rlogo, 0, 0, 1, 1)


download.file("http://cran.r-project.org/Rlogo.jpg","Rlogo.jpg")

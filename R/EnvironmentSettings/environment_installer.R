## === install required packages ===
pkg_list <- c("devtools","tidyverse","magrittr", "httr", "rvest", "XML", "stringr", "data.table",
              "jsonlite", "RSQLite","RMySQL", "readr", "Rcpp", "foreach",
              "PerformanceAnalytics","quantmod","blotter","quantstrat",
              "IKTrading", "lattice", "doSNOW", "reshape", "beepr","partykit","ada","spls","e1071","plyr","randomForest","fpc",
              "lubridate", "extrafont", "ggrepel",
              "rmarkdown", "shiny", "knitr", "prettydoc", "plotly", "DT","mclust")

pkg_new <- pkg_list[!(pkg_list %in% installed.packages()[,"Package"])]

for (pkg in pkg_new){
  if (pkg == "quantmod"){
    devtools::install_github("joshuaulrich/quantmod")
  }
  else if (pkg == "quantstrat"){
    # https://r-forge.r-project.org/R/?group_id=316
    # install.packages("quantstrat", repos="http://R-Forge.R-project.org")
    devtools::install_github("braverock/quantstrat")
  }
  else if (pkg == "blotter"){
    # install.packages("blotter", repos="http://R-Forge.R-project.org")
    devtools::install_github("braverock/blotter")
  }
  else if (pkg == "xts"){
    devtools::install_github("joshuaulrich/xts")
  }
  else if (pkg == "IKTrading"){
    devtools::install_github("IlyaKipnis/IKTrading")
  }
  else if (pkg == "data.table"){
    install.packages("data.table", type = "source",
                     repos = "https://Rdatatable.github.io/data.table")
  }
  else if (pkg == "xmlview"){
    devtools::install_github("hrbrmstr/xmlview")
  }
  else{
    install.packages(pkg)  
  }
}

rm(pkg_new, pkg_list)
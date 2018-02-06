# Connector
library(httr)
library(magrittr)
url = "http://tw.stock.yahoo.com/d/s/major_2451.html"
res <- GET(url)
res %>% content("text", encoding = "big5")



# Parser
library(rvest)
res %>% 
  content("text", encoding = "big5") %>% 
  read_html() %>% 
  html_table(fill = T)

tables = res %>% 
  content("text", encoding = "big5") %>% 
  read_html() %>% 
  html_table(fill = T)

# try: which table has data?
View(tables[[8]])
View(tables[[9]])
View(tables[[10]])

sapply(tables,NCOL)
sapply(tables,NROW)

# figure out filtering condition ... 
filter_condition <- (sapply(tables,NCOL)==8)&(sapply(tables,NROW) <= 20)
data_table <- tables[filter_condition][[1]]

names(data_table) = data_table[1,]
data_table = data_table[-1,]

# extract date info
DataString_source = content(res, "text", encoding = "big5")
# DataString_regexp <- "([[:digit:]]{3}) /([[:digit:]]{2}) /([[:digit:]]{2})"
# DataString_Location = str_locate_all(DataString_source,DataString_regexp)[[1]]
# DataString = str_sub(DataString_source, DataString_Location[1],DataString_Location[2])
DateString = regmatches(DataString_source,regexpr("([0-9]+) /([0-9]+) /([0-9]+)",DataString_source))
DateVector = as.numeric(unlist(strsplit(DateString,split = " /")))
DateVector[1] = DateVector[1] + 1911
DataDate = as.Date(paste(DateVector,collapse = "-"))
DataDate

# change the data type of each column
Data_Table = data_table
Data_Table[,1] = as.factor(Data_Table[,1])
Data_Table[,2] = as.integer(as.character(Data_Table[,2]))
Data_Table[,3] = as.integer(as.character(Data_Table[,3]))
Data_Table[,4] = as.integer(as.character(Data_Table[,4]))
Data_Table[,5] = as.character(Data_Table[,5])
Data_Table[,6] = as.integer(as.character(Data_Table[,6]))
Data_Table[,7] = as.integer(as.character(Data_Table[,7]))
Data_Table[,8] = as.integer(as.character(Data_Table[,8]))

View(Data_Table)

rbind(Data_Table[,1:3],Data_Table[,5:7])

names(Data_Table)[c(1,5)] <- "Broker"
Data_Table <- rbind(Data_Table[,1:3],Data_Table[,5:7])

names(Data_Table)
names(Data_Table)[2:3]<-c("Buy","Sell")

stockId = "2451"
Data_Table = data.frame(StockId=stockId,Date=DataDate,Data_Table)

View(Data_Table)

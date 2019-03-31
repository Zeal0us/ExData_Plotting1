#The name of the folder the data is in. 
data_file <- 'household_power_consumption.txt'
download_file_name <- 'exdata_data_household_power_consumption.zip'
library(dplyr)
library(lubridate)
#download data
if (!file.exists(data_file)) {
    if (!file.exists(download_file_name)) {
        download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',download_file_name,mode='wb')
    }
    unzip(download_file_name)
}
data_table <- read.table(data_file,header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings=c("?","NA"))
data_table <- data_table[data_table$Date=='1/2/2007' | data_table$Date=='2/2/2007',]
data_table <- mutate(data_table,date_time=parse_date_time(paste(Date,Time),'dmy_HMS'))
str(data_table)
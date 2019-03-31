#data file name
data_file <- 'household_power_consumption.txt'
#name of file to download
download_file_name <- 'exdata_data_household_power_consumption.zip'
#needed packages
library(dplyr)
library(lubridate)
#download/extract data as needed
if (!file.exists(data_file)) {
    if (!file.exists(download_file_name)) {
        download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',download_file_name,mode='wb')
    }
    unzip(download_file_name)
}
#read in the table
data_table <- read.table(data_file,header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings=c("?","NA"))
#filter out unneeded date ranges
data_table <- data_table[data_table$Date=='1/2/2007' | data_table$Date=='2/2/2007',]
#add a date_time column
data_table <- mutate(data_table,date_time=parse_date_time(paste(Date,Time),'dmy_HMS'))
str(data_table)
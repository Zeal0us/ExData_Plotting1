#this calls the script, also in the repo, for reading the data.
source('./format_data.R');
png('plot1.png')
hist(data_table$Global_active_power,
col="red",
main="Global Active Power",
xlab="Global Active Power (kilowatts)")
dev.off()
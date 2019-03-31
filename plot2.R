#this calls the script, also in the repo, for reading the data.
source('./format_data.R');
png('plot2.png')
with(data_table,
    plot(
        date_time,
        Global_active_power,
        type='l',
        ylab="Global Active Power (kilowatts)",
        xlab=""
        )
    )
dev.off()
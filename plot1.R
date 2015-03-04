library(sqldf)
library(png)

wp <- file("cleaned_household_power_consumption.txt") 
attr(wp, "file.format") <- list(sep = ";", header = TRUE)

wp.df <- sqldf("select *, Date || ' ' || Time as DateTime from wp where Date = '1/2/2007' or Date = '2/2/2007'") 

wp.df$POSIXlt <- as.POSIXlt(wp.df$DateTime,format = "%d/%m/%Y %H:%M:%S")

png("plot1.PNG")

hist(wp.df$Global_active_power, main="Global Active Power", 
        xlab="Global Active Power (kilowatts)",col="red")

dev.off()

head(wp.df) 
close(wp)
library(sqldf)
library(png)

wp <- file("cleaned_household_power_consumption.txt") 
attr(wp, "file.format") <- list(sep = ";", header = TRUE)

wp.df <- sqldf("select *, Date || ' ' || Time as DateTime from wp where Date = '1/2/2007' or Date = '2/2/2007'") 

wp.df$POSIXlt <- as.POSIXlt(wp.df$DateTime,format = "%d/%m/%Y %H:%M:%S")

png("plot2.PNG")

with(wp.df, plot(POSIXlt,Global_active_power,type="n",xlab="",
                 ylab="Global active power (kilowatts)"))

with(wp.df, lines(POSIXlt,Global_active_power))

dev.off()

head(wp.df) 
close(wp)
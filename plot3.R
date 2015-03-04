library(sqldf)
library(png)

wp <- file("cleaned_household_power_consumption.txt") 
attr(wp, "file.format") <- list(sep = ";", header = TRUE)

wp.df <- sqldf("select *, Date || ' ' || Time as DateTime from wp where Date = '1/2/2007' or Date = '2/2/2007'") 

wp.df$POSIXlt <- as.POSIXlt(wp.df$DateTime,format = "%d/%m/%Y %H:%M:%S")

png("plot3.PNG")

with(wp.df, plot(POSIXlt,Sub_metering_1,type="n",xlab="",
                 ylab="Energy sub metering"))

with(wp.df, lines(POSIXlt,Sub_metering_1,col="black"))
with(wp.df, lines(POSIXlt,Sub_metering_2,col="red"))
with(wp.df, lines(POSIXlt,Sub_metering_3,col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lwd=1)
dev.off()

head(wp.df) 
close(wp)
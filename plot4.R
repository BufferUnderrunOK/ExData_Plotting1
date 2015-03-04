library(sqldf)
library(png)

wp <- file("cleaned_household_power_consumption.txt") 
attr(wp, "file.format") <- list(sep = ";", header = TRUE)

wp.df <- sqldf("select *, Date || ' ' || Time as DateTime from wp where Date = '1/2/2007' or Date = '2/2/2007'") 

wp.df$POSIXlt <- as.POSIXlt(wp.df$DateTime,format = "%d/%m/%Y %H:%M:%S")

png("plot4.PNG")

par(mfrow=c(2,2))

#first plot
with(wp.df, plot(POSIXlt,Global_active_power,type="n",xlab="",
                 ylab="Global active power"))

with(wp.df, lines(POSIXlt,Global_active_power))

#second plot
with(wp.df, plot(POSIXlt,Voltage,type="n",xlab="datetime",
                 ylab="Voltage"))

with(wp.df, lines(POSIXlt,Voltage))

#third plot
with(wp.df, plot(POSIXlt,Sub_metering_1,type="n",xlab="",
                 ylab="Energy sub metering"))

with(wp.df, lines(POSIXlt,Sub_metering_1,col="black"))
with(wp.df, lines(POSIXlt,Sub_metering_2,col="red"))
with(wp.df, lines(POSIXlt,Sub_metering_3,col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lwd=1)

#fourth plot
with(wp.df, plot(POSIXlt,Global_reactive_power,type="n",xlab="datetime",
                 ylab="Global_reactive_power"))

with(wp.df, lines(POSIXlt,Global_reactive_power))

dev.off()

head(wp.df) 
close(wp)
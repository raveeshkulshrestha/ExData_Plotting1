pwdf <- read.table(file = "./household_power_consumption.txt", sep = ";", header = TRUE)

## Subset the data set within the date range
validrangedf <- subset(pwdf, as.Date(pwdf$Date, format = "%d/%m/%Y") >= "2007-02-01" & 
                         as.Date(pwdf$Date, format = "%d/%m/%Y") <= "2007-02-02")


## The below also works.

##validrangedf <- subset(pwdf, as.Date(pwdf$Date, format = "%d/%m/%Y") >= 
##                         as.Date("2007-02-01", format = "%Y-%m-%d") & 
##                         as.Date(pwdf$Date, format = "%d/%m/%Y") <= 
##                         as.Date("2007-02-02", format = "%Y-%m-%d"))
## dimension for both is 2880    9

## The below range gives the weekdays of the selected subset - Thursday and 
## Friday which is what we want - and will be the xlab of the graph.
##range(weekdays(as.Date(validrangedf$Date, format = "%d/%m/%Y")))

## Y axis is Global Active Power
## X axis is time series for which we need to combine date and time columns together

## Creata a new column datetime for x axis by combining date and time columns
validrangedf$DateTime <- paste(as.Date(validrangedf$Date, format = "%d/%m/%Y"), 
                               validrangedf$Time) 

## plot the graph using type="S"
## Submetering 1: color black
plot(strptime(validrangedf$DateTime, format = '%Y-%m-%d %H:%M:%S'), 
     validrangedf$Sub_metering_1, type = "S",ylab = "Energy sub metering", xlab="")
## Sub metering 2: color red
points(strptime(validrangedf$DateTime, format = '%Y-%m-%d %H:%M:%S'), 
     validrangedf$Sub_metering_2, type = "S", col="red")
## Sub metering 3: color blue
points(strptime(validrangedf$DateTime, format = '%Y-%m-%d %H:%M:%S'), 
     validrangedf$Sub_metering_3, type = "S", col="blue")

## Set the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = "solid", col = c("black", "red", "blue"))

## copy plot to png
dev.copy(png, file="plot3.png", width = 480, height = 480,units = "px")
dev.off()


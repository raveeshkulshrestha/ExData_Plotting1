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

## to check for the '?' in Global Active Power in the column if any
## which(validrangedf$Global_active_power == "?")
## integer(0): This means that there is no '?' in the column for this data set.

hist(as.numeric(validrangedf$Global_active_power), col = "Red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, file="plot1.png")
dev.off()
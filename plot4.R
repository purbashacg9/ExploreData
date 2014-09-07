### Filename - plot4.R
### Course Project - Exploratory Data Analysis
### Description of Data Set - This assignment uses data for Individual household electric power consumption from the UC Irvine Machine Learning Repository.  The data is composed of measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
### Purpose of this R Script - This program creates 4 ine plots for Global_active_power, Global_reactive_power, voltage and sub metering values against the measurement timestamps for Feb 1 and Feb 2. The plots are created on a 2 by 2 palette and saved in the png file plot4.png.   
### Date: Sep 7, 2014 

#Define path for data files
data_path <-  ".//expdata//"

###Read data only for Feb 1 and Feb 2, 2007 from data file. Number of rows (nrows) indicates the number of lines of data for these 2 days. The rows skipped (skip) contain data for days from before Feb 1, 2007.
df <- read.table(paste(data_path, "household_power_consumption.txt",sep=""),header=FALSE, nrows=2881, skip=66637, na.strings=c("?"),sep=";", col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Plot on a png device with 480 px by 480 px dimension
png("plot4.png", width=480, height=480, units="px")

##Set palette to draw 2 rows of plots with 2 plots in each row
par(mfrow=c(2,2))

with(df, {
    df$Date <- as.Date(df$Date,format="%d/%m/%Y")
    #form a vector combining date and time columns
    dt_tm <- paste(df$Date, df$Time)
    #Ensure all time values are in correct format
    frmt_dt_tm <- strptime(dt_tm,"%Y-%m-%d %H:%M:%S")

   
    plot(frmt_dt_tm, df$Global_active_power, type="l", ylab="Global Active Power", xlab="")
    
    plot(frmt_dt_tm, df$Voltage, type="l", ylab="Voltage", xlab="datetime")

    #plot sub metering values against formatted date time values
    plot(frmt_dt_tm, df$Sub_metering_1,type="n", ylab="Energy sub metering", xlab="")
    lines(frmt_dt_tm, df$Sub_metering_1, col="black", type="l")
    lines(frmt_dt_tm, df$Sub_metering_2, col="red", type="l")
    lines(frmt_dt_tm, df$Sub_metering_3, col="blue", type="l")
    legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(frmt_dt_tm, df$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
})
dev.off()



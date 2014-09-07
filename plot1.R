### Filename - plot1.R
### Course Project - Exploratory Data Analysis
### Description of Data Set - This assignment uses data for Individual household electric power consumption from the UC Irvine Machine Learning Repository.  The data is composed of measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
### Purpose of this R Script - This program creates a histogram for Global_active_power values for Feb 1, 2007 and Feb 2, 2007.  Histogram is saved in a png file plot1.png. 
### Date: Sep 7, 2014


#Define path for data files
data_path <-  ".//expdata//"

###Read data only for Feb 1 and Feb 2, 2007 from data file. Number of rows (nrows) indicates the number of lines of data for these 2 days. The rows skipped (skip) contain data for days from before Feb 1, 2007.  
df <- read.table(paste(data_path, "household_power_consumption.txt",sep=""),header=FALSE, nrows=2881, skip=66637, na.strings=c("?"),sep=";", col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

df$Date <- as.Date(df$Date,format="%d/%m/%Y")

#Plot historgram on a png device with 480 px by 480 px dimension. 
png("plot1.png", width=480, height=480, units="px")
hist(df$Global_active_power,xlab="Global Active Power(kilowatts)",main="Global Active Power",col="red", border="black",breaks=12)
dev.off()
               
               
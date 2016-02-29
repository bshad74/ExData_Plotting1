#if(!file.exists('data.zip')){
#    url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
    
#    download.file(url,destfile = "data.zip")
#}

#unzip("data.zip") # This creates the file "household_power_consumption.txt"

df <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")
name <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
names(df) <- name
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
for( i in 3:9 ){
    df[[i]] <- sapply(df[[i]], as.character)
    df[[i]] <- sapply(df[[i]], as.numeric)
}

png("plot1.png", width=480, height=480)
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
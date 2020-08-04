# Attention: Missing values are code as "?"

# Load the necessary dataset
ec <- read.csv(file="PEER_GRADED_ASSIGNMENT/DATA/household_power_consumption.txt",sep=";")

# Change the class of the column Date from "character" to "Date
ec$Date_format <- as.Date(ec$Date,format="%d/%m/%Y")

# Select data from the dates 2007-02-01 and 2007-02-02
ec_sel <- ec[((ec$Date_format >= "2007-02-01") & (ec$Date_format <= "2007-02-02")), ]

# Adjuts the class and mode of the needed columns to "numeric"
ec_sel$Global_active_power <- as.numeric(ec_sel$Global_active_power)
ec_sel$Global_reactive_power <- as.numeric(ec_sel$Global_reactive_power)
ec_sel$Voltage <- as.numeric(ec_sel$Voltage)
ec_sel$Sub_metering_1 <-  as.numeric(ec_sel$Sub_metering_1)
ec_sel$Sub_metering_2 <-  as.numeric(ec_sel$Sub_metering_2)
ec_sel$Sub_metering_3 <-  as.numeric(ec_sel$Sub_metering_3)

# Add a column that combine the date at time at once in the Date/Time class
x <- with(ec_sel, paste(Date,Time, sep=";"))
ec_sel$Date_Time <- strptime(x,format="%d/%m/%Y;%H:%M:%S")

# Safe the graph in a PNG file
png(file="plot4.png",width=480, height=480)
par(mfcol=c(2,2))

plot(ec_sel$Date_Time,
     ec_sel$Global_active_power,
     type='l',
     ylab="Global Active Power (kilowatts)",
     xlab="")

plot(ec_sel$Date_Time,
     ec_sel$Sub_metering_1,
     type='l',
     ylab="Energy sub metering",
     xlab="")
points(ec_sel$Date_Time,
       ec_sel$Sub_metering_2,
       type='l',
       col="red")
points(ec_sel$Date_Time,
       ec_sel$Sub_metering_3,
       type='l',
       col="blue")
legend("topright",bty='n',col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(ec_sel$Date_Time,
     ec_sel$Voltage,
     type='l',
     xlab="datetime",
     ylab="Voltage")

plot(ec_sel$Date_Time,
     ec_sel$Global_reactive_power,
     type='l',
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()

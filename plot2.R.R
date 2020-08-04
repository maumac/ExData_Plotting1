# Attention: Missing values are code as "?"

# Load the necessary dataset
ec <- read.csv(file="PEER_GRADED_ASSIGNMENT/DATA/household_power_consumption.txt",sep=";")

# Change the class of the column Date from "character" to "Date
ec$Date_format <- as.Date(ec$Date,format="%d/%m/%Y")

# Select data from the dates 2007-02-01 and 2007-02-02
ec_sel <- ec[((ec$Date_format >= "2007-02-01") & (ec$Date_format <= "2007-02-02")), ]

# Adjuts the class and mode of the "Global_active_power" column to "numeric"
ec_sel$Global_active_power <- as.numeric(ec_sel$Global_active_power)

# Add a column that combine the date at time at once in the Date/Time class
x <- with(ec_sel, paste(Date,Time, sep=";"))
ec_sel$Date_Time <- strptime(x,format="%d/%m/%Y;%H:%M:%S")


# Safe the graph in a PNG file
png(file="plot2.png",width=480, height=480)
plot(ec_sel$Date_Time,
     ec_sel$Global_active_power,
     type='l',
     ylab="Global Active Power (kilowatts)",
     xlab="")

dev.off()

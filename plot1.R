# Attention: Missing values are code as "?"

# Load the necessary dataset
ec <- read.csv(file="PEER_GRADED_ASSIGNMENT/DATA/household_power_consumption.txt",sep=";")

# Change the class of the column Date from "character" to "Date
ec$Date <- as.Date(ec$Date,format = "%d/%m/%Y")


# Select data from the dates 2007-02-01 and 2007-02-02
ec_sel <- ec[((ec$Date >= "2007-02-01") & (ec$Date <= "2007-02-02")), ]

# Adjuts the class and mode of the "Global_active_power" column to "numeric"
ec_sel$Global_active_power <- as.numeric(ec_sel$Global_active_power)

# Safe the histogram in a PNG file
png(file="plot1.png",width=480, height=480)
hist(ec_sel$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()

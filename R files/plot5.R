# load data


NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

#subset the data from SCC for shortnamnes containing the word coal
motor <- grep("motor", SCC$Short.Name, ignore.case = T)
subset <- SCC[motor, ]

data <- subset(NEI, NEI$SCC %in% subset$SCC)

#motor vehicle data for baltimore
data <- data[data$fips == "24510",]


# create a plot using ggplot2 
par(mar=c(5.1, 4.5, 4.1, 10))
library(ggplot2)

g <- ggplot(data, aes(year, Emissions))
g <- g + geom_line(stat="summary", fun.y = "sum") +
    ylab(expression('Total PM'[2.5]*"Emissions")) +
    ggtitle("Emissions from motor vehicle sources in Baltimore")
print(g)
dev.copy(png, file="plot5.png")
dev.off() # close the png device
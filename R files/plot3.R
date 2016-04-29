# load data


NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

#subset the data on basis of the fips for baltimore city 
bdata <- subset(NEI, NEI$fips == "24510")

# create a plot using ggplot2 
library(ggplot2)
g <- ggplot(bdata, aes(year, Emissions, color = type))
g <- g + geom_line(stat = "summary", fun.y = "sum") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
print(g)
dev.copy(png, file="plot3.png") #copies plot to png file
dev.off() # close the png device
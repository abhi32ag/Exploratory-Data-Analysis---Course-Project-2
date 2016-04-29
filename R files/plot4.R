# load data


NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

#subset the data from SCC for shortnamnes containing the word coal
subset <- grep("coal", SCC$Short.Name, ignore.case = T)
subset <- SCC[subset, ]

data <- subset(NEI, NEI$SCC %in% subset$SCC)


# create a plot using ggplot2 
library(ggplot2)
par(mar=c(5.1, 4.5, 4.1, 10))
g <- ggplot(data, aes(year, Emissions))
theme_bw()
g<- g + geom_line(stat="summary", fun.y = "sum") +
    ylab(expression('Total PM'[2.5]*"Emissions")) +
    ggtitle("Total Emissions from coal combustion-related sources(1999 to 2008)")
print(g)
dev.copy(png, file="plot4.png") #copies plot to png file
dev.off() # close the png device
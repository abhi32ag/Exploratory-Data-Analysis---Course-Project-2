# load data 
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")


total_emissions <- tapply(NEI$Emissions, NEI$year, sum)
barplot(total_emissions, main="Total emissions by Year", ylab="Total Emissions")
dev.copy(png, file="plot1.png") #copies plot to png file
dev.off() # close the png device
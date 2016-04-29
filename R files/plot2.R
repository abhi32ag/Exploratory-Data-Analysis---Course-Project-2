# load data 


NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

#subset the data on basis of the fips for baltimore city 
bdata <- subset(NEI, NEI$fips == "24510")
# calculate the total emissions by year 
emissions_by_year <- tapply(bdata$Emissions, bdata$year, sum)

# create a barplot to view the decrease 

barplot(emissions_by_year, main="Emissions by Year in Baltimore City ", ylab="Total Emissions")
dev.copy(png, file="plot2.png") #copies plot to png file
dev.off() # close the png device
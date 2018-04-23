library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

NEILA <- NEI[NEI$fips == '24510' | NEI$fips == '06037', ]

SCC <- SCC$SCC[unique(c(grep("vehicle", SCC$Short.Name, ignore.case=TRUE)
                        , grep("vehicle", SCC$EI.Sector, ignore.case=TRUE)
                        , grep("vehicle",SCC$SCC.Level.Two, ignore.case=TRUE)
                        , grep("vehicle",SCC$SCC.Level.Three, ignore.case=TRUE)
                        , grep("vehicle", SCC$SCC.Level.Four, ignore.case=TRUE)))]

vehicleData <- NEILA[NEILA$SCC %in% SCC, ]

yearly_totals <- aggregate(vehicleData[['Emissions']] ~ vehicleData[['year']] + vehicleData[['fips']] , vehicleData, sum)

names(yearly_totals) <- c('year','fips','emissions')

png(filename='plot6.png')

plot <- ggplot(data = yearly_totals, mapping = aes(year, emissions, color = fips))

plot <- plot + geom_point() + geom_smooth()

plot

dev.off()
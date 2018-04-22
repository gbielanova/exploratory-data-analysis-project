## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/summarySCC_PM25.rds")

NEIBC <- NEI[NEI$fips == 24510, ]
yearly_totals <- aggregate(NEIBC$Emissions ~ NEIBC$year, NEIBC, sum)

png('plot2.png')
plot(x = yearly_totals$`NEIBC$year`, y = yearly_totals$`NEIBC$Emissions`, 
     xlab = "Year", ylab = "Emissions", type = "l")
dev.off()



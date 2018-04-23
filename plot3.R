library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/summarySCC_PM25.rds")

NEIBC <- NEI[NEI$fips == 24510, ]

yearly_totals <- aggregate(Emissions ~ year + type, NEIBC, sum)

png(filename='plot3.png')

plot <- ggplot(data = yearly_totals, mapping = aes(year, Emissions, color = type))

plot <- plot + geom_point() + geom_smooth()

plot

dev.off()
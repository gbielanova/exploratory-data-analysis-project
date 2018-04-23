## This first line will likely take a few seconds. Be patient!
SCC <- readRDS("data/Source_Classification_Code.rds")

SCC <- SCC$SCC[unique(c(grep("Coal", SCC$Short.Name), grep("Coal", SCC$EI.Sector), 
                        grep("Coal",SCC$SCC.Level.Three),grep("Coal", SCC$SCC.Level.Four)))]

coalData <- NEI[NEI$SCC %in% SCC, ]

yearly_totals <- aggregate(coalData$Emissions ~ coalData$year, coalData, sum)

png(filename='plot4.png')

plot <- ggplot(data = yearly_totals, aes(x = `coalData$year`, y = `coalData$Emissions`))

plot <- plot + geom_line()

plot

dev.off()
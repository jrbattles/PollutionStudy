# Exploratory Data Analysis - Assignment 2 - Question #1
# Jason R. Battles

# Data should already be loaded into NEI and SCC dataframes from the ObtainData.R script

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=2000, replace=F), ]

# Aggregate
Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

# Generate the graph in the same directory as the source code
png(filename='plot1.png')

barplot(Emissions$PM, names.arg=Emissions$Group.1, col = "brown",
        main=expression(paste('Total PM'[2.5], ' Emissions - All Sources')),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' Emissions in Kilotons')))
dev.off()
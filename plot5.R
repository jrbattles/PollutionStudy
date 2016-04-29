# Exploratory Data Analysis - Assignment 2 - Question #5
# Jason R. Battles

# Data should already be loaded into NEI and SCC dataframes from the ObtainData.R script

# Load ggplot2 library
require(ggplot2)

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland == fips
MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

# Generate the graph in the same directory as the source code
png(filename='plot5.png')

ggplot(data=MD.df, aes(x=year, y=Emissions)) + geom_bar(stat="identity") + guides(fill=F) + 
    ggtitle('Total Motor Vehicle Emissions - Baltimore, MD') + 
    ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
    geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))

dev.off()
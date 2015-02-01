#library needed
library(plyr)
library(lattice)
library(ggplot2)
library(gridExtra)

#unzipping the file are reading it in.
unzip("exdata-data-NEI_data.zip")
summary<-readRDS("summarySCC_PM25.rds")

#selecting data for Baltimore city
data1<-summary[summary$fips%in% c('24510','06037'),]

#getting the data for only On-ROAD 
plotData<-subset(data1,data1$type=="ON-ROAD")[,c(1,4,6)]
plotData<-as.data.frame(plotData,colClasses = c('numeric','integer'))

#replacing the fip value with names of the city
plotData$fips<-gsub("24510",replacement = 'Baltimore',plotData$fips)
plotData$fips<-gsub("06037",replacement = 'Los Angeles',plotData$fips)

#plotting the boxplotEmissions vs years w.r.t "On-ROAD" 
plot1<-ggplot(plotData,aes(x=factor(year),y = Emissions)) + geom_boxplot() +facet_grid(.~fips) + xlab("Year") + ylab("Emissions")+ggtitle("Boxplot of Emission w.r.t years")

#Getting the sum of the Emissions for each fip
sum<-ddply(plotData,.(fips,year),numcolwise(sum))

#plotting the sum value of Emissions for the above
plot2<-ggplot(sum,aes(x=year,y=Emissions))+geom_line(aes(col=fips)) + scale_x_continuous(breaks = unique(plotData$year)) + xlab("Year") + ylab("Sum of Emissions")+ggtitle("Maximum Emissions w.r.t year")

#putting both the plots in 1 graph
grid.arrange(plot1, plot2, nrow=2)
dev.copy(png,file='plot6.png')
dev.off()


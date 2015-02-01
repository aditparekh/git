#library needed
library(plyr)
library(lattice)
library(ggplot2)
library(gridExtra)

#unzipping the file are reading it in.
unzip("exdata-data-NEI_data.zip")
scc<-readRDS("Source_Classification_Code.rds")
summary<-readRDS("summarySCC_PM25.rds")

#selecting data for Baltimore city
data1<-summary[summary$fips==24510,]

#getting the data for only On-ROAD 
plotData<-subset(summary,summary$type=="ON-ROAD")[,c(4,6)]
plotData<-as.data.frame(plotData,colClasses = c('numeric','integer'))

#plotting the boxplotEmissions vs years w.r.t "On-ROAD" 
plot1<-ggplot(plotData,aes(x=factor(year),y = Emissions)) + geom_boxplot() + xlab("Year") + ylab("Emissions")+ggtitle("Boxplot of Baltimore Emission w.r.t years")

#plotting the sum value of Emissions for the above
sum<-data.frame(year=unique(plotData$year),sum=tapply(plotData$Emissions,plotData$year,sum))
plot2<-ggplot(sum,aes(x=year,y=sum))+geom_line() +scale_x_continuous(breaks = unique(plotData$year))+ggtitle("Total sum of Baltimore Emission w.r.t years")

#putting both the plots in 1 graph
grid.arrange(plot1, plot2, ncol=2)
dev.copy(png,file='plot5.png')
dev.off()


#library needed
library(plyr)
library(lattice)

#unzipping the file are reading it in.
unzip("exdata-data-NEI_data.zip")
scc<-readRDS("Source_Classification_Code.rds")
summary<-readRDS("summarySCC_PM25.rds")

#selecting only data for Baltimore City, Maryland
data1<-summary[summary$fips==24510,]

#summing the column of Emisison for Baltimore.
plotData<-ddply(data1,.variables = 'year',numcolwise(sum))
png("plot2.png",width=480,height=480,units='px')
with(plotData,{
  plot(year,Emissions,xlab="year",ylab="Emissions",main="Total Emissions in Baltimore City, Maryland",type='n')
  lines(year,Emissions,col="red")
})
dev.off()


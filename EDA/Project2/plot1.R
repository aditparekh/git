#library needed
library(plyr)
library(lattice)

#unzipping the file are reading it in.
unzip("exdata-data-NEI_data.zip")
scc<-readRDS("Source_Classification_Code.rds")
summary<-readRDS("summarySCC_PM25.rds")

#summing the column of Emisison.
plotData<-ddply(summary,.variables = 'year',numcolwise(sum))
png("plot1.png",width=480,height=480,units='px')
with(plotData,{
  plot(year,Emissions,xlab="year",ylab="Emissions",main = "Total PM2.5 Emissions in the US", type='n')
  lines(year,Emissions,col="red")
})
dev.off()


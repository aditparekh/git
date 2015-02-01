#library needed
library(plyr)
library(lattice)
library(ggplot2)

#unzipping the file are reading it in.
unzip("exdata-data-NEI_data.zip")
scc<-readRDS("Source_Classification_Code.rds")
summary<-readRDS("summarySCC_PM25.rds")

#selecting data for Baltimore city
data1<-summary[summary$fips==24510,]

#summing the column of Emisison for the each type (point, nonpoint, onroad, nonroad) for every year.
plotData<-ddply(data1,.(year,type),numcolwise(sum))

#plotting the Emissions vs years w.r.t type
ggplot(plotData,aes(x=year,y = Emissions))+geom_line(aes(col=type))
dev.copy(png,file='plot3.png')
dev.off()


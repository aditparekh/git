#library needed
library(plyr)
library(lattice)
library(ggplot2)

#unzipping the file are reading it in.
unzip("exdata-data-NEI_data.zip")
scc<-readRDS("Source_Classification_Code.rds")
summary<-readRDS("summarySCC_PM25.rds")

#slecting the columns needed in both data sets - scc: SCC & EI.Sector, summary: SCC, Emissions & year
scc<-scc[,c(1,4)]
summary<-summary[,c(2,4,6)]

#merging both the datasets.
data1<-join(summary,scc,by='SCC',type='inner')

#identifying which attribute in EI.Sector contain the value Coal
grep("Coal",unique(data1$EI.Sector))

#subsetting the joined dataset for only Coal related combustion sources, which are 
#Fuel Comb - Electric Generation - Coal
#Fuel Comb - Industrial Boilers, ICEs - Coal 
#Fuel Comb - Comm/Institutional - Coal  
plotData<-subset(data1,data1$EI.Sector %in% c('Fuel Comb - Electric Generation - Coal','Fuel Comb - Industrial Boilers, ICEs - Coal','Fuel Comb - Comm/Institutional - Coal'))

#getting the sum of the Emissions for all Coal based sources
plotData<-data.frame(Emissions=tapply(plotData$Emissions,plotData$year,sum))
plotData<-cbind(year=rownames(plotData),Emissions=plotData)
#plotting the Emissions vs years w.r.t type
ggplot(plotData,aes(x=year,y = Emissions))+geom_point(col='red')
dev.copy(png,file='plot4.png')
dev.off()


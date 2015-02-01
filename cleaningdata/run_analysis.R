run_analysis<-function(directory){

  #defining varibales
  tidy<-data.frame(subject=numeric(),activity=character(),meanX=numeric(),meanY=numeric(),meanZ=numeric(),stdX=numeric(),stdY=numeric(),stdZ=numeric())
  
  #library needed
  library(reshape2)
  library(plyr)
  library(data.table)
  
  #reading the first 6 columns of the data files for train and test
  dataTrain<-read.table(paste(directory,"/train/X_train.txt",sep=""),header=F,na.strings=T,stringsAsFactors=F,colClasses=as.numeric())[,c(1,2,3,4,5,6)]
  dataTest<-read.table(paste(directory,"/test/X_test.txt",sep=""),header=F,na.strings=T,stringsAsFactors=F,colClasses=as.numeric())[,c(1,2,3,4,5,6)]
  
  #reading the labels (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying)
  activityTrain<-read.table(paste(directory,"/train/y_train.txt",sep=""),header=F,na.strings=T,stringsAsFactors=F)
  activityTest<-read.table(paste(directory,"/test/y_test.txt",sep=""),header=F,na.strings=T,stringsAsFactors=F)
  
  #reading the subjects (1-30 subjects)
  subjectTrain<-read.table(paste(directory,"/train/subject_train.txt",sep=""),header=F,na.strings=T,stringsAsFactors=F)
  subjectTest<-read.table(paste(directory,"/test/subject_test.txt",sep=""),header=F,na.strings=T,stringsAsFactors=F)
  
  #concatinating the data files,labels & subjects
  mergeTrain<-cbind(subjectTrain,activityTrain,dataTrain)
  colnames(mergeTrain)<-c("subject","activity","meanX","meanY","meanZ","stdX","stdY","stdZ")
  mergeTest<-cbind(subjectTest,activityTest,dataTest)  
  colnames(mergeTest)<-c("subject","activity","meanX","meanY","meanZ","stdX","stdY","stdZ")
  
  #adding both the trained and test data into one file and ordering by subject and activity
  data<-rbind(mergeTrain,mergeTest)
  data<-arrange(data,subject,activity)
  
  #setting labels for activity
  data$activity<-as.factor(data$activity)
  levels(data$activity)<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")  
  
  #Creating the Tidy data for mean by activity & subject 
  dataSplit<-split(data,data$subject)
  for(i in 1:length(dataSplit)){
    dataDT<-as.data.frame(dataSplit[[i]])
    dataSummary<-aggregate(dataDT[c(-1,-2)],list(subject=dataDT$subject,activity=dataDT$activity),mean)
    tidy<-rbind(tidy,dataSummary)    
  }
  tidy[,c(3:8)]<-round(tidy[,c(3:8)],3)
  #write.table(tidy,"tidy.txt",row.names=F,sep="\t")
  write.fwf(tidy,"tidy.txt",sep=" ",rownames=F,justify="left")
  
}
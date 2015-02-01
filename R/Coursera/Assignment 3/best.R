best<-function(state,outcome){
  
  hosp<-vector('character')
  #input the data
  data<-read.csv('outcome-of-care-measures.csv',colClasses="character")
  colnames(data)[c(11,17,23)]<-c("heart.attack","heart.failure","pneumonia")
    
  #stop statements
  if(!(state %in% data$State)) stop("Invalid State")
  if(!(outcome %in% c("heart attack","heart failure","pneumonia"))) stop("Invalid outcome")
  
  #selecting the outcome and stat
  if (outcome =='heart attack') stats<-subset(data,State==state,select=c(Hospital.Name,heart.attack))
  if (outcome =='heart failure') stats<-subset(data,State==state,select=c(Hospital.Name,heart.failure))
  if (outcome =='pneumonia') stats<-subset(data,State==state,select=c(Hospital.Name,pneumonia))
  
  #getting the min value
  stats[,1]<-as.character(stats[,1])
  stats[,2]<-as.numeric(stats[,2])
  stats<-stats[complete.cases(stats),]
  min<-min(stats[,2])

  #ordering the hospitals
  hosp<-subset(stats[,1],stats[,2]==min)
  hosp<-sort(hosp,decreasing=TRUE)
  return(hosp)
}
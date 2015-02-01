rankhospital<-function(state,outcome,rank='best'){
  
  hosp<-vector('character')
  
  #input the data
  data<-read.csv('outcome-of-care-measures.csv',colClasses="character")
  colnames(data)[c(11,17,23)]<-c("heart.attack","heart.failure","pneumonia")
    
  #stop statements
  if(!(state %in% data$State)) stop("Invalid State")
  if(!(outcome %in% c("heart attack","heart failure","pneumonia"))) stop("Invalid outcome")
  if(!(rank %in% c("best","worst") | is.numeric(rank))) stop("Invalid rank")
  
  #selecting the outcome and stat
  if (outcome =='heart attack') stats<-subset(data,State==state,select=c(Hospital.Name,heart.attack))
  if (outcome =='heart failure') stats<-subset(data,State==state,select=c(Hospital.Name,heart.failure))
  if (outcome =='pneumonia') stats<-subset(data,State==state,select=c(Hospital.Name,pneumonia))
  
  #getting the columns in right format and removing NA's
  stats[,1]<-as.character(stats[,1])
  stats[,2]<-as.numeric(stats[,2])
  stats<-stats[complete.cases(stats),]
 
  #ordering the hospitals with rank as additional column
  stats<-stats[order(stats[,2]),]
  order<-seq(1,nrow(stats),1)
  stats<-cbind(stats,order)
  
  #hosp output
  if (!is.numeric(rank)){
     if (rank=='best') hosp<-stats[1,1]
     if (rank== 'worst') hosp<-stats[nrow(stats),1]
  }
  if (rank > nrow(stats)) hosp<-'NA'
  else hosp<-as.character(subset(stats,stats[,3]==rank,select=Hospital.Name))
  
  return(hosp)
  
}
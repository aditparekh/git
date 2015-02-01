rankall<-function(outcome,rank='best'){
  
  #initializing the variables
  hosp<-vector('character')
  
  #input the data
  data<-read.csv('outcome-of-care-measures.csv',colClasses="character")
  colnames(data)[c(11,17,23)]<-c("heart.attack","heart.failure","pneumonia")
  if (rank=='best') rank<-1
    
  #stop statements
  if(!(outcome %in% c("heart attack","heart failure","pneumonia"))) stop("Invalid outcome")
  if(!(rank %in% c("best","worst") | is.numeric(rank))) stop("Invalid rank")
  
  #selecting the outcome and stat
  if (outcome =='heart attack') stats<-data[,c(2,7,11)]
  if (outcome =='heart failure') stats<-data[,c(2,7,17)]
  if (outcome =='pneumonia') stats<-data[,c(2,7,23)]
  
  #getting the columns in right format and removing NA's
  stats[,1]<-as.character(stats[,1])
  stats[,2]<-as.factor(stats[,2])
  stats[,3]<-as.numeric(stats[,3])
  stats<-stats[complete.cases(stats),]
 
  #order by outcome
  stats<-stats[order(stats[,3]),]
  
  #split into different states
  stats<-split(stats,stats[,2])
  
  #lopping through the states
  for(i in 1:length(stats)){
    test<-stats[[i]]
    test<-test[order(test[,3], test[,1]),]
    
    #testing for NA in rank
    if (rank>nrow(test) & is.numeric(rank)){
      eachState<-data.frame('NA',test[1,2])
      colnames(eachState)<-c('Hospital.Name','State')  
    }
  
    if(rank =='worst') {
      eachState<-test[nrow(test),c(1,2)]  
    }
    else {
      eachState<-test[rank,c(1,2)]
    }         
    hosp<-rbind(hosp,eachState)
  }
    
  colnames(hosp)<-c('hospital','state')

  return(hosp)
  
}
complete<-function(directory,id=1:332){
  
  #getting the files in the folder and reading it in data
  dir<- paste(directory,'/',sep="")
  files<-list.files(path=dir,pattern=".csv")
  data<-data.frame(Date=numeric(0),sulfate=numeric(0),nitrate=numeric(0),ID=numeric(0))
  for(i in id){
    file<-read.csv(paste(directory,"/",files[i],sep=""),header=TRUE)
    data <- rbind(data,file)
  }
  summary<-tapply(complete.cases(data),data$ID,sum)
  nobs<-as.numeric(summary)
  return(data.frame(id,nobs))

}

corr<-function(directory,threshold=0){
  
  dir<- paste(directory,'/',sep="")
  files<-list.files(path=dir,pattern=".csv")
  data<-data.frame(Date=numeric(0),sulfate=numeric(0),nitrate=numeric(0),ID=numeric(0))
  total_covar<-vector('numeric')
  
  for(i in 1:332){
    file<-read.csv(paste(directory,"/",files[i],sep=""),header=TRUE)
    if(sum(complete.cases(file))>threshold){
      data<-file[complete.cases(file),]
      covar<-cor(data$nitrate,data$sulfate)
      total_covar<-append(total_covar,covar,5)
    }
  }
  return (total_covar)
}
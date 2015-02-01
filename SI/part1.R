#library
library(ggplot2)
library(gridExtra)

#initializing the variables
lambda<-0.2
samples<-40
trials<-1000

sampleDist<-0 #exponential distribution of every 40 samples
meanSample<-0 #mean of the 40 samples
dist<-0 #saving all the distributions over 1000 trials
mean<-0 #saving all the means from teh 1000 trials.

for (i in 1:trials){
  sampleDist<-rexp(samples,lambda)
  meanSample<-mean(sampleDist)
  dist<-c(dist,sampleDist)
  mean<-c(mean,meanSample)
}
mean<-data.frame(mean=mean[-1])
dist<-data.frame(dist=dist[-1])

#comparing means 
meanT<-1/lambda
meanD<-colMeans(mean)

#comparing the sds
sdT<-1/(lambda*sqrt(samples))
sdD<-sd(mean$mean)

#finding the 95% interval about the mean
range<-round(c((qnorm(.975)*sdT*c(-1,1)+meanD),as.numeric(meanD)),2)

#plot of the exponential distribution
p<-ggplot(data=dist,aes(dist))+
  geom_histogram(aes(y=..density..),binwidth=.3)+
  scale_x_continuous(limits=c(0,40))+
  xlab("sample values(10K samples)") +
  ylab("probability") + 
  ggtitle("Density histogram of exponential distribution")+
  theme(axis.title=element_text(size=8),plot.title=element_text(size=8,face="bold"))


#histogram of means
h<-ggplot(data=mean,aes(x=mean)) +
  geom_histogram(aes(y=..density..),binwidth=.2,colour="black", fill="white") +
  geom_density(alpha=.4, fill="red",size=1) +
  xlab("mean values of each trial") +
  ylab("probability") + 
  ggtitle("Density histogram of means of each trial")+
  geom_vline(xintercept=range, linetype="dotted",color='blue')+
  theme(axis.title=element_text(size=8),plot.title=element_text(size=8,face="bold"))+
  scale_x_continuous(breaks=range,labels=c(range[1],range[2]))
  
grid.arrange(p,h,ncol=2)

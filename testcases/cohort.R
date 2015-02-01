Cohort Analysis using R
Have put down some code in R that once can use for cohort analysis. I have heavily borrowed from Tomasz

Ensure that you are in the ridght directory and the data is in the format of: date / customer name or id/ amount

library(plyr)
library(ggplot2)
library(lubridate)
library(xlsx)
library(scales)
library(gridExtra)

setwd(“~/Desktop/”)
test1<-read.xlsx(“gt.xlsx”,sheetIndex =1,header=T)
test1<-test1[complete.cases(test1),];
colnames(test1)<-c(‘id’,’date’,’revenue’)
GT<-test1[,c(2,1,3)]

GT[,1]<- as.Date(GT[,1])
GT$date<-paste(year(GT[,1]),month(GT[,1]),”01",sep="-"")
GT$date<-as.Date(GT$date)
GT[,c(2,3)]<-as.numeric(unlist((GT[,c(2,3)])))
               
### COMPUTE AVERAGES ACROSS CUSTOMER BASE ###
monthly_average = ddply(GT,~date,summarise, avg_revenue=mean(revenue), customers = length(unique(id)))
               
monthly_average$rev_growth=c(NA,round(((tail(monthly_average$avg_revenue,-1)/head(monthly_average$avg_revenue,-1) -1))*100,2))
monthly_average$cust_growth=c(NA,round(((tail(monthly_average$customers,-1)/head(monthly_average$customers,-1) -1))*100,2))
               
mavg<-ggplot(monthly_average, aes(x=date, y=avg_revenue)) + geom_point() + scale_x_date(labels=date_format(“%m/%y”)) + geom_hline(yintercept=mean(monthly_average$avg_revenue),col=’red’)+ labs(title = “Average revenue by Calendar Month for Customers in $”, x=”Year”, y=”Average revenue ($)”)
             
mavg_o<-ggplot(monthly_average[monthly_average$avg_revenue<5000,], aes(x=date, y=avg_revenue)) + geom_point() + scale_x_date(labels=date_format(“%m/%y”)) + geom_hline(yintercept=mean(monthly_average$avg_revenue),col=’red’)+ labs(title = “Average revenue by Calendar Month for Customers in $”, x=”Year”, y=”Average revenue ($)”)
               
mrev_mean<-mean(monthly_average$rev_growth,na.rm=T)
mcus_mean<-mean(monthly_average$cust_growth,na.rm=T)
mavgrev<-ggplot(monthly_average[monthly_average$avg_revenue<5000,], aes(x=date, y=rev_growth)) + geom_line()+scale_x_date(labels=date_format(“%m/%y”))+
  geom_hline(yintercept=mrev_mean,col=’red’)
mavgcus<-ggplot(monthly_average[monthly_average$avg_revenue<5000,], aes(x=date, y=cust_growth)) +
  geom_line()+scale_x_date(labels=date_format(“%m/%y”))+
  geom_hline(yintercept=mcus_mean,col=’red’)
               
### REVENUE BY COHORT ###
cohort = ddply(GT,~id,summarise,cohort=min(date), revenue=sum(revenue), num_months_as_customer = round(as.numeric(((max(date)-min(date))/(365.25/12))+1)))
               
cohort_summary = ddply(cohort, ~cohort, summarise, mean_revenue = sum(revenue)/sum(num_months_as_customer),customers= sum(num_months_as_customer))
cohort_summary$rev_growth=c(NA,round(((tail(cohort_summary$mean_revenue,-1)/head(cohort_summary$mean_revenue,-1) -1))*100,2))
cohort_summary$cust_growth=c(NA,round(((tail(cohort_summary$customers,-1)/head(cohort_summary$customers,-1) -1))*100,2))
               
cavg<-ggplot(cohort_summary) + geom_bar(aes(cohort, mean_revenue), stat=”identity”) + geom_hline(yintercept=mean(cohort_summary$mean_revenue),col=’red’)+ scale_x_date(labels=date_format(“%m/%y”))+ labs(title=”Average Monthly Revenue by Cohort”, x=”Cohort”, y=”Monthly Revenue”)
cagv_o<-ggplot(cohort_summary[cohort_summary$mean_revenue<5000,]) + geom_bar(aes(cohort, mean_revenue), stat=”identity”) + geom_hline(yintercept=mean(cohort_summary$mean_revenue),col=’red’)+ scale_x_date(labels=date_format(“%m/%y”))+ labs(title=”Average Monthly Revenue by Cohort”, x=”Cohort”, y=”Monthly Revenue”)
               
mcrev_mean<-mean(cohort_summary$rev_growth,na.rm=T)
mccus_mean<-mean(cohort_summary$cust_growth,na.rm=T)
mavgrev<-ggplot(cohort_summary[cohort_summary$mean_revenue<5000,], aes(x=cohort, y=rev_growth)) + geom_line()+scale_x_date(labels=date_format(“%m/%y”))+ geom_hline(yintercept=mrev_mean,col=’red’)
               
mavgcus<-ggplot(cohort_summary[cohort_summary$mean_revenue<5000,], aes(x=cohort, y=cust_growth)) +
  geom_line()+scale_x_date(labels=date_format(“%m/%y”))+
  geom_hline(yintercept=mcus_mean,col=’red’)
               
#monthly
png(“monthly”,width=480,height=480,units=’px’)
grid.arrange(mavg_o,mavgrev,mavgcus)
dev.off()

#cohort
png(“cohort”,width=480,height=480,units=’px’)
grid.arrange(mavg_o,mavgrev,mavgcus)
dev.off()

#monthly vs cohort
png(“monthly_cohort”,width=480,height=480,units=’px’)
grid.arrange(mavg,cavg,mavg_o,cagv_o)
dev.off()
#libraries needed
library(ggplot2)
library(plyr)
library(lattice)
library(reshape2)

#loading the data file & undertanding dataset
data<-ToothGrowth
str(data) #three variables with 60 observations.
factor(data$dose) # 3 levels of dosage - 0.5,1,2
factor(data$supp) # two levels of suppliments - OJ(orange juice) and VC (Vitamin C)

Dose<-factor(data$dose)

#initial understanding using boxplots for tooth length w.r.t supplements & dosage
bx1<-ggplot(data=data,aes(y=len,x=supp,fill=Dose))+
  geom_boxplot()+facet_grid(.~dose) +
  ggtitle("Boxplot of Tooth Length w.r.t Suppliments")+
  xlab("Suppliments")+
  ylab("Tooth Length")

# Using the violin plot to see the variability in the suppliments:
ggplot(data=data,aes(y=len,x=factor(dose),fill=supp))+geom_violin()+facet_grid(.~supp)


#breaking the data into different dosages
test1<-subset(ToothGrowth,ToothGrowth$dose==0.5)
test2<-subset(ToothGrowth,ToothGrowth$dose==1)
test3<-subset(ToothGrowth,ToothGrowth$dose==2)

#Performing multiple t tests for the following variations. 
#In effect we have 15 variations 6C2

#1. OJ@0.5 w.r.t OJ@1
h1<-t.test(test1[test1$supp=='OJ',]$len,test2[test2$supp=='OJ',]$len,paired = FALSE,var.equal = TRUE)
#2. OJ@0.5 w.r.t OJ@2
h2<-t.test(test1[test1$supp=='OJ',]$len,test3[test3$supp=='OJ',]$len,paired = FALSE,var.equal = TRUE)
#3. OJ@1 w.r.t OJ@2
h3<-t.test(test2[test2$supp=='OJ',]$len,test3[test3$supp=='OJ',]$len,paired = FALSE,var.equal = TRUE)

#4. VC@0.5 w.r.t VC@1
h4<-t.test(test1[test1$supp=='VC',]$len,test2[test2$supp=='VC',]$len,paired = FALSE,var.equal = TRUE)
#5. VC@0.5 w.r.t VC@2
h5<-t.test(test1[test1$supp=='VC',]$len,test3[test3$supp=='VC',]$len,paired = FALSE,var.equal = TRUE)
#6. VC@1 w.r.t VC@2
h6<-t.test(test2[test2$supp=='VC',]$len,test3[test3$supp=='VC',]$len,paired = FALSE,var.equal = TRUE)

#7. OJ@0.5 w.r.t VC@0.5
h7<-t.test(test1[test1$supp=='OJ',]$len,test1[test1$supp=='VC',]$len,paired = FALSE,var.equal = TRUE)
#8. OJ@0.5 wr.t VC@1
h8<-t.test(test1[test1$supp=='OJ',]$len,test2[test2$supp=='VC',]$len,paired = FALSE,var.equal = TRUE)
#9. OJ@0.5 wr.t VC@2
h9<-t.test(test1[test1$supp=='OJ',]$len,test3[test3$supp=='VC',]$len,paired = FALSE,var.equal = TRUE)

#10. OJ@1 w.r.t VC@0.5
h10<-t.test(test2[test2$supp=='OJ',]$len,test1[test1$supp=='VC',]$len,paired = FALSE,var.equal = TRUE)
#11. OJ@1 w.r.t VC@1
h11<-t.test(test2[test2$supp=='OJ',]$len,test2[test2$supp=='VC',]$len,paired = FALSE,var.equal = TRUE)
#12. OJ@1 w.r.t VC@2
h12<-t.test(test2[test2$supp=='OJ',]$len,test3[test3$supp=='VC',]$len,paired = FALSE,var.equal = TRUE)

#13. OJ@2 w.r.t VC@0.5
h13<-t.test(test2[test2$supp=='OJ',]$len,test1[test1$supp=='VC',]$len,paired = FALSE,var.equal = TRUE)
#14. OJ@2 w.r.t VC@1
h14<-t.test(test2[test2$supp=='OJ',]$len,test2[test2$supp=='VC',]$len,paired = FALSE,var.equal = TRUE)
#15. OJ@2 w.r.t VC@2
h15<-t.test(test2[test2$supp=='OJ',]$len,test3[test3$supp=='VC',]$len,paired = FALSE,var.equal = TRUE)
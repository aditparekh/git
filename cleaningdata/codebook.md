{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf200
{\fonttbl\f0\fnil\fcharset0 TrebuchetMS;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural

\f0\fs24 \cf0 Variables used in the program:\
\
1. tidy: An empty data frame called that will eventually hold the required result in it. The desired dimensions of this data frame would be 8 columns (Subject, Activity, MeanX,MeanY,MeanZ,StdX,StdY,StdZ) by 30 rows (there are 30 subjects)\
2. dataTrain: data frame that contains only the first six columns of the entire train data that has 561 columns that represent the 561 features. The data frame has only 6 columns - meanX,meanY,meanZ,stdX,stdY,stdZ with 7352 rows that represent the 6 activities per subject, with a total of 21 subjects.\
3. dataTest: data frame that contains only the first six columns of the entire test data that has 561 columns that represent the 561 features. The data frame has only 6 columns - meanX,meanY,meanZ,stdX,stdY,stdZ with 2947 rows that represent the 6 activities per subject, with a total of 9 subjects.\
4. activityTrain: data frame that contains the activity ("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING\'94) for each of the train data which relates to 7352 values\
5. activityTest: data frame that contains the activity ("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING\'94) for each of the train data which relates to 2947 values.\
6. subjectTrain: data frame that contains the subjects or volunteers who are participating in the train data. The total volunteers are 21 in number and have total reading of 7352 values.\
7. subjectTest: data frame that contains the subjects or volunteers who are participating in the test data. The total volunteers are 9 in number and have total reading of 2947 value.\
8. mergeTrain: A data frame that has the column merged value of dataTrain, activityTrain and SubjectTrain. The merged entity has 8 columns and 7352 rows\
9. mergeTest: A data frame that has the column merged value of dataTest, activityTest and SubjectTest. The merged entity has 8 columns and 2947 rows\
10. data: This is the master data frame that contains the values of both the mergeTest and mergeTrain data. It has 8 columns and 10299(7352+ 2947) rows.\
11. dataSplit: This has 30 elements in its list, with each element, where each element contains a dataset pertaining to each subject. Each element has 8 columns.\
12. dataDT: Represents the data frame of each element in the list with 8 columns.\
13. dataSummary: This  represents the aggregate information pertaining to mean of the following columns: MeanX, MeanY, MeanZ, StdX, StdY, StdZ is provided with respect to each activity. \
14. Tidy: This variable which was defined at the start stores all the values of each aggregate mean by subject.}
{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf200
{\fonttbl\f0\fnil\fcharset0 TrebuchetMS;}
{\colortbl;\red255\green255\blue255;\red38\green38\blue38;}
\margl1440\margr1440\vieww15040\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural

\f0\fs24 \cf0 Assumptions about the data files & an explanation of what the run_analysis function does.\
\
Assumptions:\
1. The folder containing all the data (UCI HAR Dataset) is present in the working directory\
2. The script is stored in the working directory\
\
Script Explanation:\
\
Step 1: \cf2 Merges the training and the test sets to create one data set.\cf0 \
1. Define all the variables that we might need. I have created an empty data frame called tidy that will eventually hold the required result in it. The desired dimensions of this data frame would be 8 columns (Subject, Activity, MeanX,MeanY,MeanZ,StdX,StdY,StdZ) by 30 rows (there are 30 subjects)\
2. Libraries have been defined that we would need for the functions that are being used - reshape2, plyr and data.table.\
3. test and train folder contain three files each, which have values for: subjects that have participated, the activities that each subject has performed and finally the data set that contains all the 561 features.\
\
\pard\tx220\tx720\pardeftab720\li720\fi-720\sl420
\cf2 Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.\'a0\cf0 \
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural
\cf0 4. All the six files mentioned above have been read into files as data frames - dataTrain, activityTrain,subjectTrain, dataTest, activityTest,subjectTest.\
5. For each of the train data files and the test data files, we have column bound the subject, activity and features into one file . The features that we have read in are the first six which represent the mean and standard deviation along the X,Y and Z co-ordinates. The files are mergeTrain and mergeTest\
6. The column names for each of the above bound datasets (test and train) are defined.\
\
Step 3: \cf2 Appropriately labels the data set with descriptive variable\'a0names.\cf0 \
7. This column bound data of both the training and test data are row bound together to create one massive data frame with the following eight columns: Subject, Activity, MeanX, MeanY, MeanZ, StdX, StdY, StdZ. The massive data set is called data.\
8. The massive data set is ordered by subject and then activity.\
\
\cf2 Step 4: Uses descriptive activity names to name the activities in the data set\cf0 \
9. The labels for activity are inputed here - "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"\
\
Step 5: \cf2 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.\'a0\cf0 \
10. The massive data set is then split by subject into 30 lists, where each list contains a dataset pertaining to each subject. The file is referred to by dataSplit.\
11. We use a for loop to iterate through all the 30 lists (subjects) in the split data set.\
12. For each list, which is converted into a dataset, the aggregate information pertaining to mean of the following columns: MeanX, MeanY, MeanZ, StdX, StdY, StdZ is provided with respect to each activity. This file is called dataSummary\
13. Eventually we define a variable which keeps storing the above data for each subject which is called tidy.\
14. The values of the mean are rounded to the third digit to make the data look more presentable\
15. The data is written into a file when the individual runs the program, in the working directory. The file is called \'91tidy\'92.\
}
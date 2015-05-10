#Uncomment the next two lines to download and unzip the files

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="data.zip",mode="wb",method="libcurl")
#unzip("data.zip")

#Firstly, variables for the different involved files are created.

file1="UCI HAR Dataset/test/X_test.txt"            #Data of the tests
file2="UCI HAR Dataset/train/X_train.txt"          #Data of the training
file3<-"UCI HAR Dataset/features.txt"              #Name of the variables
file11<-"UCI HAR Dataset/test/y_test.txt"          #Activities for which test data were obtained
file12<-"UCI HAR Dataset/train//y_train.txt"       #Activities for which trainig data were obtained
file4<-"UCI HAR Dataset/activity_labels.txt"       #Labels of the different activities
file13<-"UCI HAR Dataset/test/subject_test.txt"    #Subjects for which test data were obtained
file14<-"UCI HAR Dataset/train//subject_train.txt" #Subjects for which trainig data were obtained

#Files are read resulting in different data tables for each one of them.
test<-read.table(file1)
train<-read.table(file2)

#Include the names of the variables in the tables for the test and training data.
#This covers Step 4 of the assesment
variables<-read.table(file3)
names(test)<-variables[,2]
names(train)<-variables[,2]
labeltest<-read.table(file11)
labeltrain<-read.table(file12)

#Add the activities of each observation
test<-cbind(labeltest,test)
names(test)[1]="Label"
train<-cbind(labeltrain,train)
names(train)[1]="Label"
activities<-read.table(file4)
names(activities)=c("Label","activity")

#Add the subject of each observation
subjectstest<-read.table(file13)
subjectstrain<-read.table(file14)
train<-cbind(train,subjectstrain)
test<-cbind(test,subjectstest)
names(test)[563]<-"Subject"
names(train)[563]<-"Subject"

#Add the original data each observation comes from. (Not required in the assesment)
test<-cbind(test,"test")
train<-cbind(train,"train")
names(test)[564]<-"test.train"
names(train)[564]<-"test.train"

# Data from test and train merged in one data frame. Including an extra column with
# file they come from and the sub. Step 1 of the assesment.

total<-rbind(test,train)


#Extract only means and std. Step 2 of the assesment

library(stringr)
totalmean<-total[,str_detect(names(total),"mean")&!str_detect(names(total),"meanFreq")]
totalstd<-total[,str_detect(names(total),"std")]
totalextra<-total[,c(1,563,564)]
total<-cbind(totalextra,totalmean,totalstd)

#Include names of activities. Step 3 of the assesment
library(dplyr)
total<-merge(total,activities)
total<-total[,-1]
#At this point we have completed the 4 first steps. Only one left to go

#Step 5 of the assesment. Obtain the mean of each observation when grouped by 
#subject and activity. To be honest, this took me a while until I found 
#summarise_each as I did not want to go through programming a loop to do so
totalgrouped<-group_by(total,Subject,activity)
final<-summarise_each(totalgrouped, funs(mean))
final<-select(final,-test.train)

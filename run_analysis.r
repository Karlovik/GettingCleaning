#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="data.zip",mode="wb",method="libcurl")
#unzip("data.zip")

file1="UCI HAR Dataset/test/X_test.txt"
file2="UCI HAR Dataset/train/X_train.txt"
file3<-"UCI HAR Dataset/features.txt"
file11<-"UCI HAR Dataset/test/y_test.txt"
file12<-"UCI HAR Dataset/train//y_train.txt"
file4<-"UCI HAR Dataset/activity_labels.txt"
file13<-"UCI HAR Dataset/test/subject_test.txt"
file14<-"UCI HAR Dataset/train//subject_train.txt"

test<-read.table(file1)
train<-read.table(file2)
variables<-read.table(file3)
names(test)<-variables[,2]
names(train)<-variables[,2]
labeltest<-read.table(file11)
labeltrain<-read.table(file12)
test<-cbind(labeltest,test)
names(test)[1]="Label"
train<-cbind(labeltrain,train)
names(train)[1]="Label"
activities<-read.table(file4)
names(activities)=c("Label","activity")
subjectstest<-read.table(file13)
subjectstrain<-read.table(file14)
train<-cbind(train,subjectstrain)
test<-cbind(test,subjectstest)
names(test)[563]<-"Subject"
names(train)[563]<-"Subject"
test<-cbind(test,"test")
train<-cbind(train,"train")
names(test)[564]<-"test.train"
names(train)[564]<-"test.train"
total<-rbind(test,train)
# Data from test and train merged in one data frame. Including an extra column with
# file they come from and the sub

#Extract only means and std
library(stringr)
totalmean<-total[,str_detect(names(total),"mean")&!str_detect(names(total),"meanFreq")]
totalstd<-total[,str_detect(names(total),"std")]
totalextra<-total[,c(1,563,564)]
total<-cbind(totalextra,totalmean,totalstd)

#Include names of activities
library(dplyr)
total<-merge(total,activities)
total<-total[,-1]
totalgrouped<-group_by(total,Subject,activity)
final<-summarise_each(totalgrouped, funs(mean))
final<-select(final,-test.train)

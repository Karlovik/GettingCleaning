The original data can be downloaded from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and a comprehensive description of the variables can be found in that archive.

The initial data are several measurements of a accelerometer "Acc" and a gyroscope "Gyro" and it contains data of different features from 30 diferent subjects carrying out 6 different activities. The signals are given in the time domain and those obtained from the accelerometer were divided in Body "Body" and Gravity "Gravity" for each axis in the 3d space. "Jerk" signal were computed next and the euclidean norm "Mag" was calculated from the values of the coordinates.

A Fast Fourier Transform was applied to some of these signals producing the variables starting with "f"(to indicate frequency domain signals). 

From the original data we substract the variables corresponding at the mean and standard deviation of each feature, obtaining one row for each observation. Finally, we compute the mean of all the observations for subject and activity:

Subject: the subject of study. 30 different subjects
activity: the activity carried out during the observation "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS" and "WALKING_UPSTAIRS"

We have analogous variables to the following for each axis, OX,OY,OZ and for the standard deviation.
tBodyAcc-mean()-X
tGravityAcc-mean()-X
tBodyAccJerk-mean()-X
tBodyGyro-mean()-X
tBodyGyroJerk-mean()-X
tBodyAccMag-mean()
tGravityAccMag-mean()
tBodyAccJerkMag-mean()
tBodyGyroMag-mean()
tBodyGyroJerkMag-mean()
fBodyAcc-mean()-X
fBodyAccJerk-mean()-X
fBodyGyro-mean()-X
fBodyAccMag-mean()
fBodyBodyAccJerkMag-mean()
fBodyBodyGyroMag-mean()
fBodyBodyGyroJerkMag-mean()

# GettingCleaning

This repository contains only one script "run_analysis.r"
##run_analysis.r
- Create variables with the names of the files inlcuding the data, the names of the variables, the activites and the subjects
- Read the files with read.table
- Name the variables of the data
- Associate the activity to each observation
- Associate the subject to each observation
- Merge the tests and training data
- Extract the variables which are the means of each one of the original variables using str_detect
- Extract the variables which are the standard deviation of each one of the original variables using str_detect
- We obtain a table named "total" which solves the four 1st steps of the assesment
- We group "total" by activity and subject, and we apply summarise_each to obtain the mean of each variable by group saving the data in the table "final"

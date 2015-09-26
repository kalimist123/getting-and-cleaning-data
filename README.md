
Getting and Cleaning Data - Course Project
Michael Lennon

This repository includes all files required for the course project of the Coursera course "Getting And Cleaning data"
https://www.coursera.org/course/getdata

This project involves manipulating and cleaning the "Human Activity Recognition Using Smartphones" Data Set

Details:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Dataset: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Files included in this Repo:
CodeBook.md: Describes the variables, the data, and any transformations performed to clean up the data
README.md: Gives an overview of the repo and a brief explanation of how the analysis process works
run_analysis.R: R script for performing the analysis


How to use:
1) Download the raw data
2) Extract to root directory
3) Open and Execute the run_analysis.R script

Procedure
1) Merge the training, test and subject data
2) Extract mean and standard deviation variables
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) creates a second, independent tidy data set with the average of each variable for each activity and each subject.

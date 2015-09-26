Getting and Cleaning Data - Course Project
------------------------------------------
Michael Lennon

This repository includes all files required for the course project of the Coursera course "Getting And Cleaning data" https://www.coursera.org/course/getdata

The files document and provide scripts to transform the "Human Activity Recognition Using Smartphones" Data Set.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The raw dataset for which can be found here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Files included in this repository:

 - *CodeBook.md*: Describes the variables, the data, and any transformations performed to clean up the data.
 - *README.md*: Gives an overview of the repo and a brief explanation of how the analysis process works.
 - *run_analysis.R*: R script for performing the analysis.

How to use:

 - Download the raw data.
 - Extract to root directory.
 - Open and Execute the run_analysis.R script.
 
Procedure:

 - Merge the training, test and subject data.
 - Extract mean and standard deviation variables
 - Use descriptive activity names to name the activities in the data set
 - Appropriately label the data set with descriptive variable names.
 - Create a second, independent tidy data set with the average of each variable for each activity and each subject.


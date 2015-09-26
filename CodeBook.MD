

Getting and Cleaning Data Project
---------------------------------
Michael Lennon

**Description**

Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

**Original Raw Dataset**

A full description of the data used in this project can be found at The UCI Machine Learning Repository
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The source data for this project can be found here.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

**Original Data Set Description**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
 Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

**Attribute Information**

For each record in the dataset it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
Its activity label.
- An identifier of the subject who carried out the experiment.


**Data Files to loaded into datasets in script**
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

**Processed Dataset Information**

Comprises 180 rows of 81 Variables

Variables include:
- *Subject*: Integer indicating the individual involved
- *Activity*: String representing the state of the subject when the measurement was recorded (e.g Walking)
- *Mean*: Decimal indicating the mean of each measurement variable for a subject/activity.


**Data Transformation Process:**
**Step 1: Merge the training and test sets to create one data set**

Being by loading all required datasets from files
A merged dataset xdata is created by binding the xtrain and the xtest datasets  using rowbinding (rbind)
the xdata dataset then has it columns named from the features dataset (features.txt)

A merged dataset ydata is created nby binding the ytrain and the ytest datasets using rowbinding
the ydata dataset has its column changed to 'Activity'

**Step 2: Extract only the measurements on the mean and standard deviation for each measurement**

Extract mean and standard deviation variables using the grepl function we create a subset of the xdata dataset for variables 
whose column name includes 'mean' or 'std'


**Step 3: Use descriptive activity names to name the activities in the data set**

Replace the Activity column in the ydata dataset with the proper Activity label from the activity_labels.txt file
The SQLDF library (https://cran.r-project.org/web/packages/sqldf/index.html) is used here to join the ydata dataset and the activity_label dataset via the *ydata.Activity* and *activitylabel.Id* columns.
Subsequently merge the xdata, ydata and subjectdata datasets to form the mergeddata dataset


**Step 4: Appropriately label the data set with descriptive variable names**

Parentheses symbols are removed from the names in the mergeddata dataset. the names are then set to lowercase and standardised using the make.names function.

**Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.**

Use the ddply function to create a data set with the average of each veriable for each activity and subject. Write this to a new text file.

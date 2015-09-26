require(plyr)

#check if sqldf package is installed
list.of.packages <- c("sqldf")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
library(sqldf)

#set the root pathfile
pathfile<-file.path(getwd(),"UCI HAR Dataset")

#set the test and train pathfiles
pathfiletest<-file.path(pathfile, "test")
pathfiletrain<-file.path(pathfile, "train")

#populate datasets from files
xtest<-read.table(file.path(pathfiletest,"X_test.txt"))
ytest<-read.table(file.path(pathfiletest,"Y_test.txt"))
subjecttest<-read.table(file.path(pathfiletest,"subject_test.txt"))

xtrain<-read.table(file.path(pathfiletrain,"X_train.txt"))
ytrain<-read.table(file.path(pathfiletrain,"Y_train.txt"))
subjecttrain<-read.table(file.path(pathfiletrain,"subject_train.txt"))

activitylabels<-read.table(file.path(pathfile,
                                     "activity_labels.txt"),
                           col.names = c("Id", "Activity")
)
featurelabels<-read.table(file.path(pathfile,
                                    "features.txt"),
                          colClasses = c("character")
)



# Step 1
# Merge the training and test sets to create one data set
###############################################################################

#merge the xdata
xdata<- rbind(xtrain, xtest)

#use the featurelabels dataset to name the xdata columns
names(xdata)<-featurelabels$V2

#merge the ydata
ydata<-rbind(ytrain, ytest)
names(ydata)<-c("Activity")

#merge the subjectdata
subjectdata<-rbind(subjecttrain,subjecttest)
names(subjectdata)<-c("Subject")


# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
######################################################################################


#grab only the columns that include the string mean or std. 
xdata<-xdata[,grepl("mean|std", names(xdata))]

# Step 3
# Use descriptive activity names to name the activities in the data set
###############################################################################

#use SQLDF to join activity labels dataset to ydataset and get the proper activity name

ydata <- sqldf("SELECT activitylabels.Activity
               FROM ydata
               , activitylabels where ydata.Activity = activitylabels.Id")

mergeddata <- cbind(xdata, ydata, subjectdata)


# Step 4
# Appropriately label the data set with descriptive variable names
###############################################################################

#remove parentheses from names
names(mergeddata) <- gsub("([()])","",names(mergeddata))

#use the make.names function to standardardise names. then lowercase the names
names(mergeddata) = tolower(make.names(names(mergeddata)))


#Step 5.
#Create a second, independent tidy data set with the average of each variable for each activity and each subject.
################################################################################################################

#use the ddply function to get averages for subject and activity across columns
finaldata<-ddply(mergeddata, c("subject","activity"), numcolwise(mean))

write.table(finaldata, file = "sensor_average_action_subject.txt")

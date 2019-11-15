setwd("C:/Users/Richard/GettingCleaningDataAssignment")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile ="sportsdata.zip")
unzip("sportsdata.zip")

### Section 1: Merges the test set and training set into one set.
# pull in all parts:
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

dim(X_train); dim(X_test)
dim(y_train); dim(y_test)
dim(subject_train); dim(subject_test)

train_set <- cbind(subject_train,y_train,X_train)
test_set <- cbind(subject_test,y_test,X_test)

# Merge train set and test set
merged_messy <- rbind(train_set,test_set)  
names(merged_messy)[1]="subject"
names(merged_messy)[2]="activity"

### Section 2 - Extract only the measurements on the mean and 
#   standard deviation for each measurement - measurements that have both
#   mean and s.d. explicitly: i.e. end in mean() and s.d().
#   Appropriately label the data set with descriptive variable names 
features <- read.table("./UCI HAR Dataset/features.txt")
featurenames <- as.character(features[,2])
names(merged_messy)[3:563] = featurenames
keeplist<- c(grep("^(*.)+mean+()",featurenames),grep("^(*.)+std+()",featurenames))
keeplist<- sort(keeplist)
keepnames <- c("subject","activity",featurenames[keeplist])
merged<- merged_messy[keepnames]

# drop meanFreq()
droplist <- grep("mean[Ff]req()",keepnames)
dropnames <- keepnames[droplist]
merged <- merged[, ! names(merged) %in% dropnames, drop = F]
names(merged)

### Section 3 - Use descriptive activity names to name the activities in the 
#   data set
act_lbl <- read.table("./UCI HAR Dataset/activity_labels.txt") 
act_lbl
act_lbls <- as.character(act_lbl$V2)
merged$activity <- factor(merged$activity,
                    levels = c(1:6),
                    labels = act_lbls)

### Section 4 - From the data set in step 4, creates a second, independent tidy 
#   data set with the average of each variable for each activity and 
#   each subject.
library(dplyr)
rm(list=setdiff(ls(), "merged"))
tidydata<-aggregate(merged, list(subject = merged$subject, activity = merged$activity),mean)
tidydata[c(3,4)]=NULL
write.table(tidydata, file="./GCDAssignmentSubmission/tidied_data.txt", row.name=FALSE)

rm(list=ls())
check <- read.table("./GCDAssignmentSubmission/tidied_data.txt",header=TRUE)

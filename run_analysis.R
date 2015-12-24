
## Set working directory - (data files are in the working directory)
setwd("C:\\Users\\Nikolaos\\Documents\\R\\R lessons\\GetCleanData\\UCI HAR Dataset")

## Read the data from different files in different tables
sub_tr <- read.table("subject_train.txt")
x_tr <- read.table("x_train.txt")
y_tr <- read.table("y_train.txt")
sub_test <- read.table("subject_test.txt")
x_test <- read.table("x_test.txt")
y_test <- read.table("y_test.txt")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

## Merge tables of the two datasets
total_x <- rbind(x_tr, x_test)
total_y <- rbind(y_tr, y_test)
total_sub <- rbind(sub_tr, sub_test)

## Cive descriptive activity names to name the activities
y2labels <- as.data.frame(activity_labels[,2][match(total_y[ ,1], activity_labels[,1])])

## Give a name to the activities column
names(y2labels) <- paste("activities")

## Give a name to the subject column
names(total_sub) <- paste("subject")

## Make appropriate names for each column of x_tr and x_test
nam <- make.names(features$V2)
names(total_x) <- paste(nam) 

## Keep only columns with "mean" or "std" in their name
##Use grep function to get the positions of nam character vector 
##that contain 'mean' or 'std' strings.
##Use unique function just for the case a name contains both 'mean' and 'std'
total_xf <- total_x[ ,unique( c(grep("mean", nam), grep("std", nam)) )]

## Create final data set by binding all columns
mydata <- cbind(y2labels, total_sub, total_xf)

## Create data set with the average of each variable for each activity
## and each subject  
library(dplyr)
sum_data <- summarise_each(group_by(mydata, activities, subject), funs(mean))

## write data in file
write.table( sum_data, file = "GCData_project_mean.txt", row.name=FALSE)



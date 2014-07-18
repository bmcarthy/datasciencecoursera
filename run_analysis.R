## This program uses Human Activity Recognition Using Smartphones Dataset from 
##==================================================================
##  Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
## Smartlab - Non Linear Complex Systems Laboratory
## DITEN - Universit‡ degli Studi di Genova.
## Via Opera Pia 11A, I-16145, Genoa, Italy.
## activityrecognition@smartlab.ws
## www.smartlab.ws
##==================================================================
##  
##  The Program combines the test and training datasets to create a single 
##  dataset containing all mean and standard deviation measurement
##  columns from the original dataset.  Each row of measurements is
##  linked to the activity and subject that generated the data.
##  The measurements are averaged for each activity and subject 
##  combination.  The final dataset contains the average of each 
##  measurement for each activity and subject combination. 

## Read feature names and edit to produce more legible column names
infeature <- read.table("./features.txt")
outfeature <- gsub("-", "", infeature[,2])
outfeature <- gsub("\\,", "", outfeature)
outfeature <- gsub("\\(", "", outfeature)
outfeature <- gsub("\\)", "", outfeature)
outfeature <- gsub("mean","Mean", outfeature)
outfeature <- gsub("std","Stdev", outfeature)
outfeature <- gsub("tBody","avgTimeBody", outfeature)
outfeature <- gsub("tGravity","avgTimeGravity", outfeature)
outfeature <- gsub("fBody","avgFreqBody", outfeature)
outfeature <- gsub("BodyBody","Body", outfeature)
outfeature <- gsub("angleavg","avgAngle", outfeature)
outfeature <- gsub("angleXgravityMean","avgAngleXgravityMean", outfeature)
outfeature <- gsub("angleYgravityMean","avgAngleYgravityMean", outfeature)
outfeature <- gsub("angleZgravityMean","avgAngleZgravityMean", outfeature)

## Find and sequence all columns containing a mean or standard deviation
grepmean <- grep("mean", outfeature, ignore.case=TRUE)
grepstd <- grep("std", outfeature, ignore.case=TRUE)
meanstd <- sort.int(c(grepmean, grepstd))

## Read test data files, extract mean and standard deviation columns,
## and attach subject number and activity to each row
inStest <- read.table("./test/subject_test.txt", col.names=c("subject"))
inXtest <- read.table("./test/X_test.txt",col.names=(outfeature))
inXtestmeanstd <- inXtest[,meanstd]
inYtest <- read.table("./test/Y_test.txt", col.names=c("activity"))
cbindtest <- cbind (inYtest, inStest, inXtestmeanstd)

## Read training data files, extract mean and standard deviation columns,
## and attach subject number and activity to each row
inStrain <- read.table("./train/subject_train.txt", col.names=c("subject"))
inXtrain <- read.table("./train/X_train.txt",col.names=(outfeature))
inXtrainmeanstd <- inXtrain[,meanstd]
inYtrain <- read.table("./train/Y_train.txt", col.names=c("activity"))
cbindtrain <- cbind (inYtrain, inStrain, inXtrainmeanstd)

## Combine test and training data into one data frame
rbindall <- rbind(cbindtest, cbindtrain)

## Sort data by activity and subject number
attach(rbindall)
allsorted <- rbindall[order(activity, subject),]
detach(rbindall)

## Aggregate data by activity and subject number 
attach(allsorted)
aggdata <- aggregate(allsorted[,3:88], by=list(activity=activity, subject=subject), FUN=mean)
detach(allsorted)

## Sort aggregated data by activity and subject number
attach(aggdata)
sortedagg <- aggdata[order(activity, subject),]
detach(aggdata)

## Convert activity codes to literal activity descriptions and
## convert numeric subject column in each data frame to factors
inActivityLabels <- read.table("./activity_labels.txt")
allsorted$activity <- inActivityLabels[allsorted$activity,2]
allsorted$subject <- as.factor(allsorted$subject)
sortedagg$activity <- inActivityLabels[sortedagg$activity,2]
sortedagg$subject <- as.factor(sortedagg$subject)

## Write the aggregated data frame to a .txt dataset excluding row names
write.table(sortedagg, file="tidyagg.txt", row.names=FALSE)

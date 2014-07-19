
Code Book for Smart Phone Related Human Activity Recognition Data Extract
--------------

### Study Design


The data for this study was extracted from the Human Activity Recognition Using Smartphones Dataset, which was doanloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The original dataset was developed by:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Universit� degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. activityrecognition@smartlab.ws www.smartlab.ws

An R language program was used to combine the test and training datasets to create a single dataset containing all mean and standard deviation measurement columns from the original dataset. Each row of measurements was linked to the activity and subject number that generated the data. The measurements were averaged for each activity and subject combination. The final tidy data file contains the average of each measurement for each activity and subject combination.

The run_analysis.R program uses the following data transformations to produce the tidy data file with the average values for each activity and subject combination. The aggregated data frame was written to a text file.

1. More legible column names were produced by removing the special characters from the original names in the features.txt file and converting the names to CamelCase format; names were also modified to indicate that average data values of the final tidy data file 
2. Columns that do not have "mean"" or "std" in the feature name, ignoring case, were eliminated from the data
3. Associated subject number and activity numbers were attached to each row of mean and standard deviation data.
4. All rows from the test data and the training data were combined into one set of data
5. The data was sorted by activity number and subject number
6. The data was aggregated to calculate the average value for each activity and subject combination
7. Activity numbers were converted to literal activity descriptions based upon the activity label data provided in the original data
8. The subject column data type was converted to factor


### Code Book


#### Work Variables:

__infeature data frame__ - Used to contain the content of the features.txt dataset when it is read into the program 
* V1 Integer variable - contains the row name 
* V2 Character Factor variable - contains the feature names for the data

__outfeature__ - Character vector - Used to contain the modified, more legible, feature names

__grepmean__ - Integer vector - Used to contain index values of the feature names in outfeature, which are for mean values

__grepstd__ - Integer vector - Used to contain index values of the feature names in outfeature, which are for standard deviation values

__meanstd__ - Integer vector - Used to contain combined index values from grepmean and grepstd, sorted in ascending numeric order

__inStest__ - data frame - Used to contain the content of the subject_test.txt dataset when it is read into the program, the values represent the identifiers for the subjects in the study

__inXtest__ - data frame - Used to contain the content of the X_test.txt dataset when it is read into the program

__inXtestmeanstd__ - data frame - Used to contain the columns from inXtest which match the index values in the meanstd vector

__inYtest__ - data frame - Used to contain the content of the Y_test.txt dataset when it is read into the program, the values represent the identifiers for the activities in the study

__cbindtest__ - data frame - Used to contain the bound columns from inYtest, inStest, and inXtestmeanstd, data frames

__inStrain__ - data frame - Used to contain the content of the subject_train.txt dataset when it is read into the program, the values represent the identifiers for the subjects in the study

__inXtrain__ - data frame - Used to contain the content of the X_train.txt dataset when it is read into the program

__inXtrainmeanstd__ - data frame - Used to contain the columns from inXtrain which match the index values in the meanstd vector

__inYtrain__ - data frame - Used to contain the content of the Y_train.txt dataset when it is read into the program, the values represent the identifiers for the activities in the study

__cbindtrain__ - data frame - Used to contain the bound columns from inYtrain, inStrain, and inXtrainmeanstd, data frames

__rbindall__ - data frame - Used to contain the bound rows from cbindtest and cbindtrain data frames

__allsorted__ - data frame - Used to contain the bound rows from the rbindall data frame sorted in ascending order by activity type number and subject number

__aggdata__ - data frame - 
Used to contain the aggregated data from the rbindall data frame, the data is aggregated by activity number and subject number, data values are averaged via the mean function

__Sortedagg__ - data frame - Used to contain the rows from the aggdata data frame sorted in ascending order by activity type number and subject number

__inActivityLabels__ - data frame - Used to contain the content of the activity_labels.txt dataset when it is read into the program
    
    
#### tidyagg.txt dataset data elements:

__Activity__ - Character Factor variable   
Six possible values representing the activities being performed by the study subjects   

1. WALKING 
2. WALKING_UPSTAIRS 
3. WALKING_DOWNSTAIRS 
4. SITTING 
5. STANDING 
6. LAYING

__Subject__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric  
Identifies the subject who performed the activity, (ranges from 1 to 30)

__avgTimeBodyAccMeanX__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body acceleration on the X axis

__avgTimeBodyAccMeanY__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body acceleration on the Y axis

__avgTimeBodyAccMeanZ__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body acceleration on the Z axis

__avgTimeBodyAccStdevX__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body acceleration on the X axis

__avgTimeBodyAccStdevY__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body acceleration on the Y axis

__avgTimeBodyAccStdevZ__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body acceleration on the Z axis

__avgTimeGravityAccMeanX__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the gravity acceleration on the X axis

__avgTimeGravityAccMeanY__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the gravity acceleration on the Y axis

__avgTimeGravityAccMeanZ__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the gravity acceleration on the Z axis

__avgTimeGravityAccStdevX__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the gravity acceleration on the X axis

__avgTimeGravityAccStdevY__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the gravity acceleration on the Y axis

__avgTimeGravityAccStdevZ__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the gravity acceleration on the Z axis

__avgTimeBodyAccJerkMeanX__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body acceleration jerk signals on the X axis

__avgTimeBodyAccJerkMeanY__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body acceleration jerk signals on the Y axis

__avgTimeBodyAccJerkMeanZ__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body acceleration jerk signals on the Z axis

__avgTimeBodyAccJerkStdevX__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body acceleration jerk signals on the X axis

__avgTimeBodyAccJerkStdevY__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body acceleration jerk signals on the Y axis

__avgTimeBodyAccJerkStdevZ__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body acceleration jerk signals on the Z axis

__avgTimeBodyGyroMeanX__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body gyroscope signals on the X axis

__avgTimeBodyGyroMeanY__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body gyroscope signals on the Y axis

__avgTimeBodyGyroMeanZ__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body gyroscope signals on the Z axis

__avgTimeBodyGyroStdevX__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body gyroscope signals on the X axis

__avgTimeBodyGyroStdevY__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body gyroscope signals on the Y axis

__avgTimeBodyGyroStdevZ__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric
Average of the standard deviations of the time domain of the body gyroscope signals on the Z axis

__avgTimeBodyGyroJerkMeanX__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body gyroscope jerk signals on the X axis

__avgTimeBodyGyroJerkMeanY__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body gyroscope jerk signals on the Y axis

__avgTimeBodyGyroJerkMeanZ__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body gyroscope jerk signals on the Z axis

__avgTimeBodyGyroJerkStdevX__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body gyroscope jerk signals on the X axis

__avgTimeBodyGyroJerkStdevY__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body gyroscope jerk signals on the Y axis

__avgTimeBodyGyroJerkStdevZ__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body gyroscope jerk signals on the Z axis

__avgTimeBodyAccMagMean__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body acceleration signal magnitude

__avgTimeBodyAccMagStdev__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body acceleration signal magnitude 

__avgTimeGravityAccMagMean__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the gravity acceleration signal magnitude

__avgTimeGravityAccMagStdev__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the gravity acceleration signal magnitude

__avgTimeBodyAccJerkMagMean__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body acceleration jerk signal magnitude

__avgTimeBodyAccJerkMagStdev__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body acceleration jerk signal magnitude

__avgTimeBodyGyroMagMean__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body gyroscope signal magnitude

__avgTimeBodyGyroMagStdev__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body gyroscope signal magnitude

__avgTimeBodyGyroJerkMagMean__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the means of the time domain of the body gyroscope jerk signal magnitude

__avgTimeBodyGyroJerkMagStdev__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the standard deviations of the time domain of the body gyroscope jerk signal magnitude

avgFreqBodyAccMeanX		Hz	  -99.999999999999999	Numeric
Average of the means of the frequency domain of the body acceleration on the X axis

avgFreqBodyAccMeanY		Hz	  -99.999999999999999	Numeric
Average of the means of the frequency domain of the body acceleration on the Y axis

avgFreqBodyAccMeanZ		Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body acceleration on the Z axis

avgFreqBodyAccStdevX		Hz	 -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body acceleration on the X axis

avgFreqBodyAccStdevY		Hz	 -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body acceleration on the Y axis

avgFreqBodyAccStdevZ		Hz	  -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body acceleration on the Z axis

avgFreqBodyAccMeanFreqX		Hz	 -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body acceleration frequency on the X axis



avgFreqBodyAccMeanFreqY		Hz	  -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body acceleration frequency on the Y axis

avgFreqBodyAccMeanFreqZ		Hz	 -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body acceleration frequency on the Z axis

avgFreqBodyAccJerkMeanX		Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body acceleration jerk signals on the X axis

avgFreqBodyAccJerkMeanY		Hz	  -99.999999999999999	Numeric
Average of the means of the frequency domain of the body acceleration jerk signals on the Y axis

avgTimeBodyAccJerkMeanZ		Hz	  -99.999999999999999	Numeric
Average of the means of the frequency domain of the body acceleration jerk signals on the Z axis

avgFreqBodyAccJerkStdevX		Hz	 -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body acceleration jerk signals on the X axis

avgFreqBodyAccJerkStdevY		Hz	 -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body acceleration jerk signals on the Y axis

avgFreqBodyAccJerkStdevZ		Hz	 -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body acceleration jerk signals on the Z axis
avgFreqBodyAccJerkMeanFreqX	Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body acceleration jerk signal frequency on the X axis

avgFreqBodyAccJerkMeanFreqY	Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body acceleration jerk signal frequency on the Y axis

avgFreqBodyAccJerkMeanFreqZ	Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body acceleration jerk signal frequency on the Z axis

avgFreqBodyGyroMeanX		Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body gyroscope signals on the X axis

avgFreqBodyGyroMeanY		Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body gyroscope signals on the Y axis

avgFreqBodyGyroMeanZ		Hz	  -99.999999999999999	Numeric
Average of the means of the frequency domain of the body gyroscope signals on the Z axis

avgFreqBodyGyroStdevX		Hz	 -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body gyroscope signals on the X axis

avgFreqBodyGyroStdevY		Hz	  -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body gyroscope signals on the Y axis
avgFreqBodyGyroStdevZ		Hz	 -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body gyroscope signals on the Z axis

avgFreqBodyGyroMeanFreqX		Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body gyroscope signal frequency on the X axis

avgFreqBodyGyroMeanFreqY		Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body gyroscope signal frequency on the Y axis

avgFreqBodyGyroMeanFreqZ		Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body gyroscope signal frequency on the Z axis

avgFreqBodyAccMagMean		Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body acceleration signal magnitude

avgFreqBodyAccMagStdev		Hz	 -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body acceleration signal magnitude 

avgFreqBodyAccMagMeanFreq	Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body acceleration signal magnitude frequency



AvgFreqBodyAccJerkMagMean		Hz	  -99.999999999999999	Numeric
Average of the means of the frequency domain of the body acceleration signal magnitude frequency

avgFreqBodyAccJerkMagStdev		Hz	 -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body acceleration signal magnitude frequency

avgFreqBodyAccJerkMagMeanFreq		Hz	  -99.999999999999999	Numeric
Average of the means of the frequency domain of the body acceleration jerk signal magnitude frequency

avgFreqBodyGyroMagMean		Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body gyroscope signal magnitude

avgFreqBodyGyroMagStdev		Hz	 -99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body gyroscope signal magnitude

avgFreqBodyGyroMagMeanFreq		Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body gyroscope signal magnitude frequency

avgFreqBodyGyroJerkMagMean		Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body gyroscope jerk signal magnitude

avgFreqBodyGyroJerkMagStdev		Hz	-99.999999999999999	Numeric
Average of the standard deviations of the frequency domain of the body gyroscope jerk signal magnitude
avgFreqBodyGyroJerkMagMeanFreq		Hz	 -99.999999999999999	Numeric
Average of the means of the frequency domain of the body gyroscope jerk signal magnitude frequency

__avgAngleTimeBodyAccMeangravity__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Degrees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the angle of the mean body acceleration and the mean gravity acceleration in the time domain

__avgAngleTimeBodyAccJerkMeangravityMean__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Degrees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the angle of the mean body jerk acceleration and the mean gravity acceleration in the time domain

__avgAngleTimeBodyGyroMeangravityMean__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Degrees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the angle of the mean body gyroscope acceleration and the mean gravity acceleration in the time domain

__avgAngleTimeBodyGyroJerkMeangravityMean__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Degrees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the angle of the mean body gyroscope jerk acceleration and the mean gravity acceleration in the time domain

__avgAngleXgravityMean__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Degrees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the angle of the mean gravity acceleration in the time domain on the X axis

__avgAngleYgravityMean__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Degrees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the angle of the mean gravity acceleration in the time domain on the Y axis

__avgAngleZgravityMean__ - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Degrees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;99.999999999999999&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numeric   
Average of the angle of the mean gravity acceleration in the time domain on the Z axis

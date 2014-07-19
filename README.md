### README


The data for this study was extracted from the Human Activity Recognition Using Smartphones Dataset, which was downloaded from: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The original dataset was developed by:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The run_analysis.R program is used to combine the test and training datasets to create a single dataset containing all mean and standard deviation measurement columns from the original dataset.  Each row of measurements is linked to the activity name and subject number that generated the data. The measurements were averaged for each activity and subject combination.  The final dataset contains the average of each measurement for each activity and subject combination.  

This program can be run as long as the downloaded dataset has been unzipped into your working directory.

The run_analysis.R program uses the following  data extraction and conversion process:

1.	Read feature names into data frame named infeature
2.	Use gsub function to edit the values in the infeature data frame to produce more legible column names; place results in the data frame named outfeature
3.	Use grep function to find the column index values for all columns in the outfeature data frame that have “mean” or “std” in the feature name, ignoring case; merge and sequence all columns index values in ascending order and place the result in a integer vector named meanstd
4.	Read test data files into data frames named inStest, inXtest, and inYtest
5.	Use the column index values in the meanstd vector to extract mean and standard deviation columns; place those columns in a data frame named inXtestmeanstd
6.	Use the cbind function to combine all the columns inYtest, inStest, and inStestmeanstd data frames into one data frame named cbindtest, thereby attaching the associated subject number and activity number to each row of mean and standard deviation data.
7.	Read training data files into data frames named inStrain, inXtrain, and inYtrain
8.	Use the column index values in the meanstd vector to extract mean and standard deviation columns; place those columns in a data frame named inXtrainmeanstd
9.	Use the cbind function to combine all the columns inYtraint, inStrain, and inStrainmeanstd data frames into one data frame named cbindtrain, thereby attaching the associated subject number and activity number to each row of mean and standard deviation data.
10.	Use the rbind function to combine the rows in the cbindtest and cbindtrain data frames into one data frame named rbindall
11.	Sort data in the rbindall data frame by activity number and subject number and place the results in the data frame named allsorted
12.	Use the aggregate function with the mean parameter to calculate the average value for each activity number and subject number combination; place the output in a data frame named aggdata
13.	Sort the aggregated data in the aggdata data frame by activity number and subject number; place the output in a data frame named sortedagg
14.	Read the activity label data into a data frame named inActivityLabels
15.	Convert activity numbers in the allsorted and sortedagg data frames to literal activity descriptions
16.	Convert numeric subject column in the allsorted and sortedagg data frames to factors
17.	Write the aggregated data frame to a dataset named tidyagg.txt, excluding row names


__The following information was provided with the original dataset:__

For more information about this dataset contact: activityrecognition@smartlab.ws

License

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Summary of Human Activity Recognition Using Smartphones
=================================================

The data contains averages calculated by activity and subject for various accelerometer and gyroscope signals (see below). It is build from [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

Data description:

- subject - participant in the study tagged from 1 to [number of participants],

- activity - factory with the following values:  
  1 - WALKING  
  2 - WALKING_UPSTAIRS  
  3 - WALKING_DOWNSTAIRS  
  4 - SITTING  
  5 - STANDING  
  6 - LAYING  

  *Measurements**:
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag
 
The explanation for these columns is copied (with a minor correction added in **bold**)) from *features_info.txt* from the original data:

----------
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, **fBodyAccMag**, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are:   
mean: Mean value,  
std: Standard deviation,  
**all other measurements were omitted**  

----------

You can also look at *features.txt* from the original data. The names of the variables were kept consistent except for:

- Parentheses were removed
- Dash ("-") replaced with a dot "."
- "BodyBody" replaced with "Body" ("Body" is mistakenly duplicated in some of the original "features")

Only mean and standard deviation (std) observations were used. The following transformations were applied to the original data:

1. For train data set, the sensor data (*X_train.txt*), activities (*y_train.txt*) and subjects (*subject_train.txt*) were combined.
2. For test data set, the sensor data (*X_test.txt*), activities (*y_test.txt*) and subjects (*subject_test.txt*) were combined.
3. Combined training and test data from the first two steps were merged together.
4. Integer activity identifier was to character (factor with six levels) using *activity_labels.txt*. See activity column above for the levels.
5. For every subject and activity mean of every average was calculated and stored in the same variables/columns as the original data (see above for variable name description and corrections)

At the moment of the writing (Sep 17, 2015) the resulting data set (*activity_avg.txt*) contains 180 rows (number_of_subjects*number_of_activities).

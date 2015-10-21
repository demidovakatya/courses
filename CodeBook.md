# Codebook

This is a codebook that describes the variables, the data, and any transformations or work that are performed to clean up the data. It indicates all the variables and summaries calculated, along with units, and any other relevant information.

## Background
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Raw data
### Files structure
The data for this project included the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

### Data structure
'train/X_train.txt': 7352 obs.
'test/X_test.txt': 2947 obs.
In total, there are 10299 obs. (records).

For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment. 

## Creating the tidy datafile
To get the tidy data file, you need to download and run the run_analysis.R script.
An Internet connection will be required to download the .zip-file with the data [62,6 MB].

The code in the script is divided into sections, and these sections will be explained further.

### 0. Read the files.
* Downloads a `UCI_HAR_20_Dataset.zip` file with data if it doesn't exist. [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Unzips the data into [a folder](https://github.com/demidovakatya/gettingandclearingdata/tree/master/UCI%20HAR%20Dataset).
* Reads features.txt into `features`.
* Reads X_train.txt and x_test.txt into `x.test` and `x.train` (recorded data).
* Reads y_train.txt and y_test.txt into `y.test` and `y.train` (activity types).
* Reads subject_test.txt and subject_train.txt into `subject.test` and `subject.train`.

### 1. Merge datasets.
* Merges (with `cbind`) subjects, activity types, recorded data into two dataframes: `test` and `train`.
* Merges (with `rbind`) the training and the test sets to create one data set: `data`.
* Removes unnecessary objects from the environment.

### 2. Extract only the measurements on the mean and standard deviation for each measurement.
* Creates a logical vector `req.features` where `TRUE` stands for mean() or std() variables.
* Removes from `data` unnecessary columns.

### 3. Use descriptive activity names to name the activities in the data set
* Reads activity_labels.txt as `activity.labels`.
* Uses activity names as labels for the factor variable. This solution is based on the fact that the activity variable is categorical.

### 4. Appropriately label the data set with descriptive variable names.
* Stores current variable names in a vector.
* Using `sub` function, makes these names more descriptive.
* Assigns new names to `data` column names.

### 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
* Loads the `plyr` library.
* Using the `aggregate` function, calculates mean variables for each activity and each subject.
* Assigns it to a new data set, `tidy.data`.
* Writes the tidy data set `tidy.data` into a text file `tidy_data.txt`.

[go to run_analysis.R →](https://github.com/demidovakatya/gettingandclearingdata/blob/master/run_analysis.R)

[look at the text file →](https://github.com/demidovakatya/gettingandclearingdata/blob/master/tidy_data.txt)

## Description of the variables

### Dimensions of the dataset
### Summary of the data

### Variables in the dataset
There are the following variables in the resulting data set `tidy.data`.

#### Subject
`Subject` – an identifier of the subject who performed the activity. 
Factor with 30 levels/labels: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30

#### Activity
`Activity` – a type of performed activity. 
Factor w/ 6 levels:
Level | Label
------|------
1 | WALKING
2 | WALKING_UPSTAIRS
3 | WALKING_DOWNSTAIRS
4 | SITTING
5 | STANDING
6 | LAYING

#### Features
All features are numeric vectors within `[-1,1]`. 
- The gyroscope units are rad/seg.
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).

`Time` — time domain signals.
`Freq` — frequency domain signals.
`Body.Acceleration` – body acceleration signals
`Body.AccelerationJerk` – the body linear acceleration
`Gravity.Acceleration` – gravity acceleration signals
`Body.AngularVelocity` – the body angular velocity
`X`, `Y`, `Z` – de
`Magnitude` – the magnitude of the signals, calculated using the Euclidean norm

There are only means and standard deviations of these signals in the `tidy.data` data set.

List of all variable names:
* `Time.Body.Acceleration.Mean.X`
* `Time.Body.Acceleration.Mean.Y`
* `Time.Body.Acceleration.Mean.Z`
* `Time.Body.Acceleration.StDev.X`
* `Time.Body.Acceleration.StDev.Y`
* `Time.Body.Acceleration.StDev.Z`
* `Time.Gravity.Acceleration.Mean.X`
* `Time.Gravity.Acceleration.Mean.Y`
* `Time.Gravity.Acceleration.Mean.Z`
* `Time.Gravity.Acceleration.StDev.X`
* `Time.Gravity.Acceleration.StDev.Y`
* `Time.Gravity.Acceleration.StDev.Z`
* `Time.Body.AccelerationJerk.Mean.X`
* `Time.Body.AccelerationJerk.Mean.Y`
* `Time.Body.AccelerationJerk.Mean.Z`
* `Time.Body.AccelerationJerk.StDev.X`
* `Time.Body.AccelerationJerk.StDev.Y`
* `Time.Body.AccelerationJerk.StDev.Z`
* `Time.Body.AngularVelocity.Mean.X`
* `Time.Body.AngularVelocity.Mean.Y`
* `Time.Body.AngularVelocity.Mean.Z`
* `Time.Body.AngularVelocity.StDev.X`
* `Time.Body.AngularVelocity.StDev.Y`
* `Time.Body.AngularVelocity.StDev.Z`
* `Time.Body.AngularVelocityJerk.Mean.X`
* `Time.Body.AngularVelocityJerk.Mean.Y`
* `Time.Body.AngularVelocityJerk.Mean.Z`
* `Time.Body.AngularVelocityJerk.StDev.X`
* `Time.Body.AngularVelocityJerk.StDev.Y`
* `Time.Body.AngularVelocityJerk.StDev.Z`
* `Time.Body.Acceleration.Magnitude.Mean`
* `Time.Body.Acceleration.Magnitude.StDev`
* `Time.Gravity.Acceleration.Magnitude.Mean`
* `Time.Gravity.Acceleration.Magnitude.StDev`
* `Time.Body.AccelerationJerk.Magnitude.Mean`
* `Time.Body.AccelerationJerk.Magnitude.StDev`
* `Time.Body.AngularVelocity.Magnitude.Mean`
* `Time.Body.AngularVelocity.Magnitude.StDev`
* `Time.Body.AngularVelocityJerk.Magnitude.Mean`
* `Time.Body.AngularVelocityJerk.Magnitude.StDev`
* `Freq.Body.Acceleration.Mean.X`
* `Freq.Body.Acceleration.Mean.Y`
* `Freq.Body.Acceleration.Mean.Z`
* `Freq.Body.Acceleration.StDev.X`
* `Freq.Body.Acceleration.StDev.Y`
* `Freq.Body.Acceleration.StDev.Z`
* `Freq.Body.AccelerationJerk.Mean.X`
* `Freq.Body.AccelerationJerk.Mean.Y`
* `Freq.Body.AccelerationJerk.Mean.Z`
* `Freq.Body.AccelerationJerk.StDev.X`
* `Freq.Body.AccelerationJerk.StDev.Y`
* `Freq.Body.AccelerationJerk.StDev.Z`
* `Freq.Body.AngularVelocity.Mean.X`
* `Freq.Body.AngularVelocity.Mean.Y`
* `Freq.Body.AngularVelocity.Mean.Z`
* `Freq.Body.AngularVelocity.StDev.X`
* `Freq.Body.AngularVelocity.StDev.Y`
* `Freq.Body.AngularVelocity.StDev.Z`
* `Freq.Body.Acceleration.Magnitude.Mean`
* `Freq.Body.Acceleration.Magnitude.StDev`
* `Freq.Body.AccelerationJerk.Magnitude.Mean`
* `Freq.Body.AccelerationJerk.Magnitude.StDev`
* `Freq.Body.AngularVelocity.Magnitude.Mean`
* `Freq.Body.AngularVelocity.Magnitude.StDev`
* `Freq.Body.AngularVelocityJerk.Magnitude.Mean`
* `Freq.Body.AngularVelocityJerk.Magnitude.StDev`

## Resources
1. [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
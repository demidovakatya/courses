# Codebook

This is a codebook that describes the variables, the data, and any transformations or work that are performed to clean up the data. It indicates all the variables and summaries calculated, along with units, and any other relevant information.

## Background
![Accelerometer and gyroscope](https://dl.dropboxusercontent.com/u/9420368/acc-gyro.png)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Raw data
### Files structure
The data for this project includes the following files:
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
* Downloads a `UCI_HAR_20_Dataset.zip` file with data if it doesn't exist. [:package: source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
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
* Using the `grepl` function, chooses a data set with only those columns that contain mean values (`-mean()`), standard deviation (`-std()`), and reassignes this data set to `data`.

### 3. Use descriptive activity names to name the activities in the data set
* Reads activity_labels.txt as `activity.labels`.
* Uses activity names as labels for the factor variable. This solution is based on the fact that the activity variable is categorical.

### 4. Appropriately label the data set with descriptive variable names.
* Stores current variable names in a vector.
* Using `sub` function, makes these names more descriptive.
* Assigns new names to `data` column names.

[:ledger: read about variable names →](#description-of-the-variables)

### 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
* Loads the `plyr` library.
* Using the `aggregate` function, calculates mean variables for each activity and each subject.
* Assigns it to a new data set, `tidy.data`.
* Writes the tidy data set `tidy.data` into a text file `tidy_data.txt`.

[:page_with_curl: go to run_analysis.R →](https://github.com/demidovakatya/gettingandclearingdata/blob/master/run_analysis.R)

[:page_with_curl: look at the text file →](https://github.com/demidovakatya/gettingandclearingdata/blob/master/tidy_data.txt)

## Description of the variables

### Structure of the dataset

```
str(tidy.data)
'data.frame':	180 obs. of  68 variables:
 $ Subject                                      : Factor w/ 30 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ Activity                                     : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ Time.Body.Acceleration.Mean.X                : num  0.277 0.276 0.276 0.279 0.278 ...
 $ Time.Body.Acceleration.Mean.Y                : num  -0.0174 -0.0186 -0.0172 -0.0148 -0.0173 ...
 $ Time.Body.Acceleration.Mean.Z                : num  -0.111 -0.106 -0.113 -0.111 -0.108 ...
 $ Time.Body.Acceleration.StDev.X               : num  -0.284 -0.424 -0.36 -0.441 -0.294 ...
 $ Time.Body.Acceleration.StDev.Y               : num  0.1145 -0.0781 -0.0699 -0.0788 0.0767 ...
 $ Time.Body.Acceleration.StDev.Z               : num  -0.26 -0.425 -0.387 -0.586 -0.457 ...
 $ Time.Gravity.Acceleration.Mean.X             : num  0.935 0.913 0.937 0.964 0.973 ...
 $ Time.Gravity.Acceleration.Mean.Y             : num  -0.2822 -0.3466 -0.262 -0.0859 -0.1004 ...
 $ Time.Gravity.Acceleration.Mean.Z             : num  -0.0681 0.08473 -0.13811 0.12776 0.00248 ...
 $ Time.Gravity.Acceleration.StDev.X            : num  -0.977 -0.973 -0.978 -0.984 -0.979 ...
 $ Time.Gravity.Acceleration.StDev.Y            : num  -0.971 -0.972 -0.962 -0.968 -0.962 ...
 $ Time.Gravity.Acceleration.StDev.Z            : num  -0.948 -0.972 -0.952 -0.963 -0.965 ...
 $ Time.Body.AccelerationJerk.Mean.X            : num  0.074 0.0618 0.0815 0.0784 0.0846 ...
 $ Time.Body.AccelerationJerk.Mean.Y            : num  0.02827 0.01825 0.01006 0.00296 -0.01632 ...
 $ Time.Body.AccelerationJerk.Mean.Z            : num  -4.17e-03 7.90e-03 -5.62e-03 -7.68e-04 8.32e-05 ...
 $ Time.Body.AccelerationJerk.StDev.X           : num  -0.114 -0.278 -0.269 -0.297 -0.303 ...
 $ Time.Body.AccelerationJerk.StDev.Y           : num  0.067 -0.0166 -0.045 -0.2212 -0.091 ...
 $ Time.Body.AccelerationJerk.StDev.Z           : num  -0.503 -0.586 -0.529 -0.751 -0.613 ...
 $ Time.Body.AngularVelocity.Mean.X             : num  -0.0418 -0.053 -0.0256 -0.0318 -0.0489 ...
 $ Time.Body.AngularVelocity.Mean.Y             : num  -0.0695 -0.0482 -0.0779 -0.0727 -0.069 ...
 $ Time.Body.AngularVelocity.Mean.Z             : num  0.0849 0.0828 0.0813 0.0806 0.0815 ...
 $ Time.Body.AngularVelocity.StDev.X            : num  -0.474 -0.562 -0.572 -0.501 -0.491 ...
 $ Time.Body.AngularVelocity.StDev.Y            : num  -0.0546 -0.5385 -0.5638 -0.6654 -0.5046 ...
 $ Time.Body.AngularVelocity.StDev.Z            : num  -0.344 -0.481 -0.477 -0.663 -0.319 ...
 $ Time.Body.AngularVelocityJerk.Mean.X         : num  -0.09 -0.0819 -0.0952 -0.1153 -0.0888 ...
 $ Time.Body.AngularVelocityJerk.Mean.Y         : num  -0.0398 -0.0538 -0.0388 -0.0393 -0.045 ...
 $ Time.Body.AngularVelocityJerk.Mean.Z         : num  -0.0461 -0.0515 -0.0504 -0.0551 -0.0483 ...
 $ Time.Body.AngularVelocityJerk.StDev.X        : num  -0.207 -0.39 -0.386 -0.492 -0.358 ...
 $ Time.Body.AngularVelocityJerk.StDev.Y        : num  -0.304 -0.634 -0.639 -0.807 -0.571 ...
 $ Time.Body.AngularVelocityJerk.StDev.Z        : num  -0.404 -0.435 -0.537 -0.64 -0.158 ...
 $ Time.Body.Acceleration.Magnitude.Mean        : num  -0.137 -0.29 -0.255 -0.312 -0.158 ...
 $ Time.Body.Acceleration.Magnitude.StDev       : num  -0.22 -0.423 -0.328 -0.528 -0.377 ...
 $ Time.Gravity.Acceleration.Magnitude.Mean     : num  -0.137 -0.29 -0.255 -0.312 -0.158 ...
 $ Time.Gravity.Acceleration.Magnitude.StDev    : num  -0.22 -0.423 -0.328 -0.528 -0.377 ...
 $ Time.Body.AccelerationJerk.Magnitude.Mean    : num  -0.141 -0.281 -0.28 -0.367 -0.288 ...
 $ Time.Body.AccelerationJerk.Magnitude.StDev   : num  -0.0745 -0.1642 -0.1399 -0.3169 -0.2822 ...
 $ Time.Body.AngularVelocity.Magnitude.Mean     : num  -0.161 -0.447 -0.466 -0.498 -0.356 ...
 $ Time.Body.AngularVelocity.Magnitude.StDev    : num  -0.187 -0.553 -0.562 -0.553 -0.492 ...
 $ Time.Body.AngularVelocityJerk.Magnitude.Mean : num  -0.299 -0.548 -0.566 -0.681 -0.445 ...
 $ Time.Body.AngularVelocityJerk.Magnitude.StDev: num  -0.325 -0.558 -0.567 -0.73 -0.489 ...
 $ Freq.Body.Acceleration.Mean.X                : num  -0.203 -0.346 -0.317 -0.427 -0.288 ...
 $ Freq.Body.Acceleration.Mean.Y                : num  0.08971 -0.0219 -0.0813 -0.1494 0.00946 ...
 $ Freq.Body.Acceleration.Mean.Z                : num  -0.332 -0.454 -0.412 -0.631 -0.49 ...
 $ Freq.Body.Acceleration.StDev.X               : num  -0.319 -0.458 -0.379 -0.447 -0.298 ...
 $ Freq.Body.Acceleration.StDev.Y               : num  0.056 -0.1692 -0.124 -0.1018 0.0426 ...
 $ Freq.Body.Acceleration.StDev.Z               : num  -0.28 -0.455 -0.423 -0.594 -0.483 ...
 $ Freq.Body.AccelerationJerk.Mean.X            : num  -0.171 -0.305 -0.305 -0.359 -0.345 ...
 $ Freq.Body.AccelerationJerk.Mean.Y            : num  -0.0352 -0.0788 -0.1405 -0.2796 -0.1811 ...
 $ Freq.Body.AccelerationJerk.Mean.Z            : num  -0.469 -0.555 -0.514 -0.729 -0.59 ...
 $ Freq.Body.AccelerationJerk.StDev.X           : num  -0.134 -0.314 -0.297 -0.297 -0.321 ...
 $ Freq.Body.AccelerationJerk.StDev.Y           : num  0.10674 -0.01533 -0.00561 -0.2099 -0.05452 ...
 $ Freq.Body.AccelerationJerk.StDev.Z           : num  -0.535 -0.616 -0.544 -0.772 -0.633 ...
 $ Freq.Body.AngularVelocity.Mean.X             : num  -0.339 -0.43 -0.438 -0.373 -0.373 ...
 $ Freq.Body.AngularVelocity.Mean.Y             : num  -0.103 -0.555 -0.562 -0.688 -0.514 ...
 $ Freq.Body.AngularVelocity.Mean.Z             : num  -0.256 -0.397 -0.418 -0.601 -0.213 ...
 $ Freq.Body.AngularVelocity.StDev.X            : num  -0.517 -0.604 -0.615 -0.543 -0.529 ...
 $ Freq.Body.AngularVelocity.StDev.Y            : num  -0.0335 -0.533 -0.5689 -0.6547 -0.5027 ...
 $ Freq.Body.AngularVelocity.StDev.Z            : num  -0.437 -0.56 -0.546 -0.716 -0.42 ...
 $ Freq.Body.Acceleration.Magnitude.Mean        : num  -0.129 -0.324 -0.29 -0.451 -0.305 ...
 $ Freq.Body.Acceleration.Magnitude.StDev       : num  -0.398 -0.577 -0.456 -0.651 -0.52 ...
 $ Freq.Body.AccelerationJerk.Magnitude.Mean    : num  -0.0571 -0.1691 -0.1868 -0.3186 -0.2695 ...
 $ Freq.Body.AccelerationJerk.Magnitude.StDev   : num  -0.1035 -0.1641 -0.0899 -0.3205 -0.3057 ...
 $ Freq.Body.AngularVelocity.Magnitude.Mean     : num  -0.199 -0.531 -0.57 -0.609 -0.484 ...
 $ Freq.Body.AngularVelocity.Magnitude.StDev    : num  -0.321 -0.652 -0.633 -0.594 -0.59 ...
 $ Freq.Body.AngularVelocityJerk.Magnitude.Mean : num  -0.319 -0.583 -0.608 -0.724 -0.548 ...
 $ Freq.Body.AngularVelocityJerk.Magnitude.StDev: num  -0.382 -0.558 -0.549 -0.758 -0.456 ...
 ```
[:page_with_curl: summary →](https://github.com/demidovakatya/gettingandclearingdata/edit/master/Summary.md)

### Variables in the dataset
There are the following variables in the resulting data set `tidy.data`:

#### Subject
An identifier of the subject who performed the activity. 

Factor with 30 levels/labels: 

1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30

#### Activity
A type of performed activity. 

Factor w/ 6 levels:

| Level  |  Label |
|---|---|
|1 | WALKING|
|2 | WALKING_UPSTAIRS|
|3 | WALKING_DOWNSTAIRS |
|4 | SITTING |
|5 | STANDING |
|6 | LAYING |

#### Features
- All features are numeric vectors within `[-1,1]`. 
- The gyroscope units are rad/seg.
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).- 
- `Time` — time domain signal.
- `Freq` — frequency domain signal.
- `Body.Acceleration` – body linear acceleration.
- `Body.AccelerationJerk` – body linear acceleration jerk.
- `Gravity.Acceleration` – gravity acceleration.
- `Body.AngularVelocity` – the body angular velocity.
- `Body.AngularVelocityJerk` – the body angular velocity jerk.
- `Magnitude` – the magnitude of the signal, calculated using the Euclidean norm
- `X`, `Y`, `Z` – the axis of the signal.
- `Mean` – mean value of the signal.
- `StDev` – standard deviation of the signals.

So, for example, `Time.Body.AngularVelocity.Mean.Y` → time domain body angular velocity signal in the Y direction

Table of all "feature" variables:

| Mean   |      Standard Deviation      |
|:----------|:-------------|
| Time.Body.Acceleration.Mean.X | Time.Body.Acceleration.StDev.X |
| Time.Body.Acceleration.Mean.Y | Time.Body.Acceleration.StDev.Y |
| Time.Body.Acceleration.Mean.Z | Time.Body.Acceleration.StDev.Z |
| Time.Gravity.Acceleration.Mean.X | Time.Gravity.Acceleration.StDev.X |
| Time.Gravity.Acceleration.Mean.Y | Time.Gravity.Acceleration.StDev.Y |
| Time.Gravity.Acceleration.Mean.Z | Time.Gravity.Acceleration.StDev.Z |
| Time.Body.AccelerationJerk.Mean.X | Time.Body.AccelerationJerk.StDev.X |
| Time.Body.AccelerationJerk.Mean.Y | Time.Body.AccelerationJerk.StDev.Y |
| Time.Body.AccelerationJerk.Mean.Z | Time.Body.AccelerationJerk.StDev.Z |
| Time.Body.AngularVelocity.Mean.X | Time.Body.AngularVelocity.StDev.X |
| Time.Body.AngularVelocity.Mean.Y | Time.Body.AngularVelocity.StDev.Y |
| Time.Body.AngularVelocity.Mean.Z | Time.Body.AngularVelocity.StDev.Z |
| Time.Body.AngularVelocityJerk.Mean.X | Time.Body.AngularVelocityJerk.StDev.X |
| Time.Body.AngularVelocityJerk.Mean.Y | Time.Body.AngularVelocityJerk.StDev.Y |
| Time.Body.AngularVelocityJerk.Mean.Z | Time.Body.AngularVelocityJerk.StDev.Z |
| Time.Body.Acceleration.Magnitude.Mean | Time.Body.Acceleration.Magnitude.StDev |
| Time.Gravity.Acceleration.Magnitude.Mean | Time.Gravity.Acceleration.Magnitude.StDev |
| Time.Body.AccelerationJerk.Magnitude.Mean | Time.Body.AccelerationJerk.Magnitude.StDev |
| Time.Body.AngularVelocity.Magnitude.Mean | Time.Body.AngularVelocity.Magnitude.StDev |
| Time.Body.AngularVelocityJerk.Magnitude.Mean | Time.Body.AngularVelocityJerk.Magnitude.StDev |
| Freq.Body.Acceleration.Mean.X | Freq.Body.Acceleration.StDev.X |
| Freq.Body.Acceleration.Mean.Y | Freq.Body.Acceleration.StDev.Y |
| Freq.Body.Acceleration.Mean.Z | Freq.Body.Acceleration.StDev.Z |
| Freq.Body.AccelerationJerk.Mean.X | Freq.Body.AccelerationJerk .StDev.X |
| Freq.Body.AccelerationJerk.Mean.Y | Freq.Body.AccelerationJerk.StDev.Y  |
| Freq.Body.AccelerationJerk.Mean.Z | Freq.Body.AccelerationJerk.StDev.Z  |
| Freq.Body.AngularVelocity.Mean.X | Freq.Body.AngularVelocity.StDev.X |
| Freq.Body.AngularVelocity.Mean.Y | Freq.Body.AngularVelocity.StDev.Y |
| Freq.Body.AngularVelocity.Mean.Z | Freq.Body.AngularVelocity.StDev.Z |
| Freq.Body.Acceleration.Magnitude.Mean | Freq.Body.Acceleration.Magnitude.StDev |
| Freq.Body.AccelerationJerk.Magnitude.Mean | Freq.Body.AccelerationJerk.Magnitude.StDev  |
| Freq.Body.AngularVelocity.Magnitude.Mean | Freq.Body.AngularVelocity.Magnitude.StDev  |
| Freq.Body.AngularVelocityJerk.Magnitude.Mean | Freq.Body.AngularVelocityJerk.Magnitude.StDev  |

## Resources
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
[Guide to Designing Expanded Ad Units](https://developer.apple.com/library/iad/documentation/UserExperience/Conceptual/DesigningExpandedAdUnits/FeaturesforExpandedAdUnits/FeaturesforExpandedAdUnits.html)

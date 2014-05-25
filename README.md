Getting_Cleaning_Data_project
=============================
Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Main tasks are follows: 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The data were collected from the accelerometers from the Samsung Galaxy S smartphone.  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Activity_labels.txt : Records the activity_id(1:6) with activity(Walking, walking_upstairs, etc.)
features.txt : List of all features.
Train(test)/X_train.txt: Training set.(X have total 561 columns stand for 561 features)
Train(test)/y_train.txt: Training labels. (6 activities)
Train(test)/subject_test.txt: 30 volunteers



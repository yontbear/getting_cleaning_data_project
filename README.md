Getting_Cleaning_Data_project
=============================
Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Main tasks are follows: 
* 1.Merges the training and the test sets to create one data set.
* 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
* 3.Uses descriptive activity names to name the activities in the data set
* 4.Appropriately labels the data set with descriptive activity names. 
* 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The data were collected from the accelerometers from the Samsung Galaxy S smartphone.  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

* Activity_labels.txt : Records the activity_id(1:6) with activity(Walking, walking_upstairs, etc.)
* features.txt : List of all features.
* Train(test)/X_train.txt: Training set.(X have total 561 columns stand for 561 features)
* Train(test)/y_train.txt: Training labels. (6 activities)
* Train(test)/subject_test.txt: 30 volunteers

#Explanation

* Use read.table to read data

data used: activity_labels.txt,  features.txt,  test/X_test.txt,  test/y_test.txt, 
test/subject_test.txt,  train/X_train.txt,  train/y_train.txt,  train/subject_train.txt

* Before using merge to merge all_test,all_train with label, in order to avoid duplicate name(first element all called “V1”)
* label the name first

names(sub_test) <- "Volunteer"
names(y_test) <- "Activity_ID"

* Now cbind x_test, y_test, sub_test into a data, same as x_train, y_train and sub_train

all_test <- cbind(sub_test, y_test, x_test)

* Merge all_test with activity label

merge_test <- merge(label, all_test, by.x = "V1",by.y = "Activity_ID", all = T)

* Give the merge_test name

cname1 <- as.character(feature$V2)
cname2 <- c("Activity_ID","Activity_Label","Volunteer",cname1)
names(merge_test)<- cname2

* Use rbind to generate finaldata

finalData1 <- rbind(merge_test,merge_train)

* Use grepl() function to tell with column is mean() and std()

rule <- grepl("mean\\(\\)", cname2) | grepl("std\\(\\)", cname2)

* Subtract the final data

subtract_all <- finalData1[rule]

* In order to generate mean for each volunteers’ each activity, use melt and dcast
* But the data cannot include activity label(since it’s character which cannot be calculated)

* output data use write.table() function

write.table(Mean, "tidy.txt")



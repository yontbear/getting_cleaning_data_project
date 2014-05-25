* setwd() to  UCI HAR Dataset

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


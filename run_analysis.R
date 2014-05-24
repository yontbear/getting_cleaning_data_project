## Read in data
label <- read.table("activity_labels.txt")
feature <- read.table("features.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
sub_test <- read.table("test/subject_test.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
sub_train <- read.table("train/subject_train.txt")

#label the name
names(sub_test) <- "Volunteer"
names(sub_train) <- "Volunteer"
names(y_test) <- "Activity_ID"
names(y_train) <- "Activity_ID"

# Comine x,y,sub
all_test <- cbind(sub_test, y_test, x_test)
all_train <- cbind(sub_train, y_train, x_train)

# Merge all_test with activity label
merge_test <- merge(label, all_test, by.x = "V1",by.y = "Activity_ID", all = T)
merge_train <- merge(label, all_train, by.x = "V1", by.y = "Activity_ID", all = T)

# label the name
cname1 <- as.character(feature$V2)
cname2 <- c("Activity_ID","Activity_Label","Volunteer",cname1)
names(merge_test)<- cname2
names(merge_train) <- cname2

#rbind merge_test and merge_train
finalData1 <- rbind(merge_test,merge_train)
#subtract first three column
first3 <- finalData1[,1:3]
first13 <- finalData[,c(1,3)]

#choose mean()&std()
rule <- grepl("mean\\(\\)", cname2) | grepl("std\\(\\)", cname2)

#subtract mean()&std()
subtract_all <- finalData1[rule]

#cbind first three columns and subtract_all
finalData2 <- cbind(first3, subtract_all)
finalDataForMean <- cbind(first13,subtract_all)

write.table(finalData2, "finalData2.txt")

#reshape2
library(reshape2)
meltData <- melt(finalDataForMean, id.vars =c("Activity_ID","Volunteer"))
Mean <- dcast(meltData, Activity_ID + Volunteer ~ variable, mean)

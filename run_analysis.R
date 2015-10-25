## This code is prepared for the Getting and Cleaning Data project on Coursera

## Load the data

features <- read.table("features.txt")
activityLabels <- read.table("activity_labels.txt")
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/Y_train.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/Y_test.txt")
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")

## Merge the training and test sets

X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
remove(X_train)
remove(X_test)
remove(y_train)
remove(y_test)
remove(subject_train)
remove(subject_test)

## Extract only the measurements on the mean and the standard deviation

selected_features <- grepl("(mean)|(std)", features[,2])
features <- features[selected_features,]
X_data <- X_data[,selected_features]

## Use descriptive activity names to name the activities

labeled_y_data <- data.frame(activity = factor(y_data[,1], labels = activityLabels[,2]))
remove(y_data)

## Appropriately label the data set with descriptive variable names

colnames(X_data) <- features[,2]
colnames(subject_data) <- c("subject")

## Bind the data together
cleaned_data <- cbind(subject_data, labeled_y_data, X_data)
remove(X_data)
remove(subject_data)
remove(labeled_y_data)

## Take the average of each variable for each activity and each subject
avg_data_activity <- lapply(split(cleaned_data[,-(1:2)], cleaned_data$activity), colMeans, na.rm = TRUE)
avg_data_activity <- data.frame(avg_data_activity)
avg_data_subject <- lapply(split(cleaned_data[,-(1:2)], cleaned_data$subject), colMeans, na.rm = TRUE)
avg_data_subject <- data.frame(avg_data_subject)

## Print the output in a text file
write.table(cleaned_data, file = "tidy_dataset.txt", row.names = FALSE)
write.table(avg_data_activity, file = "activity_average.txt")
write.table(avg_data_subject, file = "activity_subject.txt")
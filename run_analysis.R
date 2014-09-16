library(dplyr)
# Step 0 - Download and unzip data.
# file_url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(file_url, destfile = "dataset.zip", mode = "wb")
# unzip("dataset.zip")

# Steps 1 and 2 - Merge the training and the test sets into one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
dir = "./UCI HAR Dataset"
features = read.table(paste(dir,"features.txt", sep = "/"), col.names = c("idx", "name"))
activity_id = "activity.id" 

# read test data, labels, and subjects 
test <- read.table(paste(dir, "test", "X_test.txt" , sep = "/")) 
test_labels <- as.integer(scan(paste(dir, "test", "y_test.txt" , sep = "/")))
test_subjects <- as.integer(scan(paste(dir, "test", "subject_test.txt" , sep = "/")))
  # and combine them
test <- cbind(test, activity.id = test_labels, subj = test_subjects)

# read train data, labels, and subjects
train <- read.table(paste(dir, "train", "X_train.txt" , sep = "/"))
train_labels <- as.integer(scan(paste(dir, "train", "y_train.txt" , sep = "/")))
train_subjects <- as.integer(scan(paste(dir, "train", "subject_train.txt" , sep = "/")))
  # and combine them
train <- cbind(train, activity.id = train_labels, subj = train_subjects)

idx <- grep("(mean\\(\\)|std\\(\\))", features$name) # we are only interested in mean and std

activity_labels = arrange(read.table(paste(dir,"activity_labels.txt", sep = "/"), 
                          col.names = c(activity_id, "activity.name")), activity.id)
activity_labels$activity.name <- factor(activity_labels$activity.name, levels = activity_labels$activity.name)
data <- tbl_df(rbind_list(test, train))  %>%
    # Step 3 - Use descriptive activity names to name the activities in the data set 
  inner_join(activity_labels, by = "activity.id") %>% 
  select(idx, activity.name, subj)

# Step 4 - Appropriately label the data set with descriptive variable names
varnames <- as.character(features[idx, 2])
# instead of attempting one complicated perl expression, let's go step by step
varnames <- gsub("\\(\\)", "", varnames) # remove parentheses
varnames <- gsub("-", ".", varnames) # dash cannot be used in column names
varnames <- gsub("BodyBody", "Body", varnames) # "body" is mistakenly duplicated in original "features"
colnames(data) <- c(varnames, "activity", "subject")

# Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data_avg <- group_by(data, activity, subject) %>%
    summarise_each(funs(mean)) %>%
    select(activity, subject, 1:ncol(data)) %>%
    arrange(activity, subject)

write.table(data_avg, "activity_avg.txt", row.names=FALSE)

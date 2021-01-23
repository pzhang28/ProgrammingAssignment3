library(dplyr)
# Load metadata
activity_labels <- read.table("./data/activity_labels.txt", col.names=c("activity.id", "activity.label"))
features <- read.table("./data/features.txt", col.names=c("feature.id", "feature.label"))

# Load data
## 4. Appropriately labels the data set with descriptive variable names. 
x_train <- read.table("./data/train/X_train.txt", col.names=features$feature.label)
y_train <- read.table("./data/train/y_train.txt")
subject_train <- read.table("./data/train/subject_train.txt", col.names=c("subject"))

x_test <- read.table("./data/test/X_test.txt", col.names=features$feature.label)
y_test <- read.table("./data/test/y_test.txt")
subject_test <- read.table("./data/test/subject_test.txt", col.names=c("subject"))

# Merge data
## 1. Merges the training and the test sets to create one data set.
bind_cols(x_train, y_train, subject_train) %>%
  bind_rows(bind_cols(x_test, y_test, subject_test)) %>%
  rename(activity.id = V1) %>%
  ## 3. Uses descriptive activity names to name the activities in the data set
  inner_join(activity_labels, by="activity.id") %>%
  ## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  select(subject, activity.label, contains("mean") | contains("std")) -> df

# Summarizing
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
df %>%
  group_by(subject, activity.label) %>%
  summarise(across(everything(), list(mean))) -> tidy_avg_df

write.table(tidy_avg_df, file="tidy_dataset.txt", row.names=FALSE)

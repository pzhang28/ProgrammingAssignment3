# CodeBook
## Data source
The data folder in this repository contains a dataset from the following source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Additional information about the including data is available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Steps of the Analysis
In general the R script run_analysis.R executes the tasks below.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

To simplify the code, the script processes this five steps in a different order.

First it loads the activity labels and feature names, to read the train and test datasets with descriptive variable names (Step 4). Then it merges the data with the dpylr package to a big data frame (Step 1), before it joins the activity labels to assign descriptive activity names to this (Step 3). In the end the dataframe will be filtered on the relevant columns (Step 2) to calculate the mean for each variable and export this result as tidy dataset (Step 5).
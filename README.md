---
title: "Readme.md"
author: "Marbo87"
date: "31 8 2020"
output: html_document
---

## Coursera Course Project Instructions

You should create one R script called run_analysis.R that does the following.  

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Creating the tidy data set
The labels of features are read in as tables from a *.txt file and filtered for the labels containing 'mean' or 'std' (79 out of 561).
The corresponding indices are used to filter the data for these features.

Next, the activity indices and corresponding labels are loaded from a text file (activity_labels.txt) in order to label the test (y_test.txt) and training (y_train.txt) observations with a descriptive name, namely walking, walkingupstairs, walking downstairs, sitting, standing and laying.
Next the test (2947) and training (7352) data are combined into a single table (10299) 'actlaball'.

Then all subject indices for test (subject_test.txt) and training (subject_training.txt) are loaded and combined into a single table 'suball'.

Finally the training and test sets are loaded from X_train.txt and X_test.txt and combined to the table 'comb'.
Then it is filtered for the mean and std variables, the variables (rows) are named by the variable names and the activity labels are included as the first column.
For all variables and observations, all non-letter symbols are removed and all letters are converted to lower case.
This data table is named 'combined'.

Then the average is calculated for this data set for each activity and each subject after grouping for these variables, and stored in a table called 'averages'.

This is for Getting and Cleaning Data Course Project of the Coursera Data Science Specialization

run_analysis.R is the script used to merge and clean the testing and training data from UCI HAR dataset, and the summarize the data for each subject and each activity.
The flow of analysis follows:
1) merging the testing and training data
2) filtering for only the mean and std of each activity
3) changing the variable means to be more descriptive
4) grouping the measurements by subject and activity
6) summarize by calculating the mean of each variable for each acitivity and each subject

tidy.txt is the resulting summary of data from UCH HAR, which lists the average mean and std of each variable measured for 6 different activities on 30 subjects.


## This is the course project for the Getting and Cleaning Data Coursera course. 

The R script, run_analysis.R, does the following:

1. We start loading the training and test datasets and merging them.
2. Then, we keep only those columns which reflect a mean or standard deviation, in other words, the columns that contain the words "mean" or "std".
3. Loads the activity and subject data for each dataset, and merges those columns with the dataset.
4. Converts the activity and subject columns into factors.
5. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
6. We obtain the file tidyData.txt.
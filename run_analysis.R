library(plyr)


# 1. Merges the training and the test sets to create one data set.

# Train variable
xTrain <- read.table("train/X_train.txt")
yTrain <- read.table("train/y_train.txt")
subjectTrain <- read.table("train/subject_train.txt")

#Test variable
xTest <- read.table("test/X_test.txt")
yTest <- read.table("test/y_test.txt")
subjectTest <- read.table("test/subject_test.txt")

# Merge files x, y and subject into a new data set
xData <- rbind(xTrain, xTest)
yData <- rbind(yTrain, yTest)
subjectData <- rbind(subjectTrain, subjectTest)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")

# Extract index of columns with contain words mean() or std()
MeanOrSTD <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the columns
xData <- xData[, MeanOrSTD]

names(xData) <- features[MeanOrSTD, 2]


# 3. Uses descriptive activity names to name the activities in the data set

activitiesLabels <- read.table("activity_labels.txt")

# values with activity names
yData[, 1] <- activitiesLabels[yData[, 1], 2]

names(yData) <- "activity"


# 4. Appropriately labels the data set with descriptive variable names.

names(subjectData) <- "subject"

# bind all the data in a single data set
allData <- cbind(xData, yData, subjectData)


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

newData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(newData, "TidyData.txt", row.name=FALSE)

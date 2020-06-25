library(dplyr)

setwd("UCI HAR Dataset")

#reading training and testing data
trainSubject = read.table("train/subject_train.txt")
trainActivity = read.table("train/y_train.txt")
trainRes = read.table("train/x_train.txt")

testSubject = read.table("test/subject_test.txt")
testActivity = read.table("test/y_test.txt")
testRes = read.table("test/X_test.txt")

#reading labels for the features and activity tested
features = read.table("features.txt", as.is=TRUE)
activity_labels = read.table("activity_labels.txt")

#merging the datasets
allres = rbind(
  cbind(testSubject, testActivity, testRes),
  cbind(trainSubject, trainActivity, trainRes)
)

alllabels <- c("subject", "activity", features[,2])
keep <- grep("subject|activity|.*mean.*|.*std.*", alllabels)

#filtering only mean and std columns
alllabels <- alllabels[keep]
allres <- allres[,keep]

#changing to more descriptive variable names
alllabels <- gsub("-mean", "Mean", meanstd)
alllabels <- gsub("-std", "Std", alllabels)
alllabels <- gsub("[()]", "", alllabels)
alllabels <- gsub("^f", "frequency", alllabels)
alllabels <- gsub("^t", "time", alllabels)
alllabels <- gsub("Acc", "Acceleration", alllabels)
alllabels <- gsub("Gyro", "AngularVelocity", alllabels)
alllabels <- gsub("BodyBody", "Body", alllabels)

#assigning new column names
colnames(allres) <- alllabels

#factorize activity names and subject ids
allres$activity <- factor(allres$activity, levels = activity_labels[,1], labels = activity_labels[,2])
allres$subject <- as.factor(allres$subject)

means <- allres %>% group_by(activity, subject) %>% summarise_all(mean)

write.table(means, "tidy.txt", append = FALSE, sep = " ", dec = ".",
            row.names = FALSE)


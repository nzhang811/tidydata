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
colnames(allres) = c("subject", "activity_id", features[,2])


#Set the working directory to UCI HAR folder
setwd("/Users/Ittai/Box Sync/Coursera/GettingAndCleaningData/PeerAssessment/UCI HAR Dataset/")
# Merges the training and the test sets to create one data set.
#masterData=data.frame()
#Combine results data
xtrain <- read.table("train/X_train.txt",header=FALSE)
xtest <- read.table("test/X_test.txt",header=FALSE)
xData <- rbind(xtrain,xtest)
#combine Activity Label data
ytrain <- read.table("train/Y_train.txt",header=FALSE)
ytest <- read.table("test/Y_test.txt",header=FALSE)
yData <- rbind(ytrain,ytest)
# Combine Subject data
strain <- read.table("train/subject_train.txt",header=FALSE)
stest <- read.table("test/subject_test.txt",header=FALSE)
sData <- rbind(ytrain,ytest)

# Extracts only the measurements on the mean and standard deviation for each measurement.
features<-read.table("features.txt")
keepFeatures <- grep("-mean|-std", features[, 2])
xDataKeep <- xData[,keepFeatures]
names(xDataKeep) <- features[keepFeatures, 2]

# Uses descriptive activity names to name the activities in the data set

# Appropriately labels the data set with descriptive activity names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
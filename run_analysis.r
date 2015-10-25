library(plyr); library(reshape2)
# for all data

setwd("~/Documents/My Documents/Coursera/DataScienceTrack/GettingAndCleaningData/data/UCI HAR Dataset/")

 activity_labels <- read.table("activity_labels.txt", col.names=c("activity_num","activity"))  # dim 6  2 (numbers) and  labels for activities
# features_info.txt    # measures recorded and how they were summarized (and what the summaries are called)
  features       <- read.table("features.txt")         # dim 561 2 (numbers) and labels for features

# Test subject activity data
setwd("~/Documents/My Documents/Coursera/DataScienceTrack/GettingAndCleaningData/data/UCI HAR Dataset/test/Inertial Signals")

# 2947 x 128 obs on data, labels should be in features.txt
  body_acc_x_test  <- read.table("body_acc_x_test.txt",  col.names=paste("bodyAccX", 1:128,sep=""))
  body_acc_y_test  <- read.table("body_acc_y_test.txt",  col.names=paste("bodyAccY", 1:128,sep=""))
  body_acc_z_test  <- read.table("body_acc_z_test.txt",  col.names=paste("bodyAccZ", 1:128,sep=""))
  body_gyro_x_test <- read.table("body_gyro_x_test.txt", col.names=paste("bodyGyroX",1:128,sep=""))
  body_gyro_y_test <- read.table("body_gyro_y_test.txt", col.names=paste("bodyGyroY",1:128,sep=""))
  body_gyro_z_test <- read.table("body_gyro_z_test.txt", col.names=paste("bodyGyroZ",1:128,sep=""))
  total_acc_x_test <- read.table("total_acc_x_test.txt", col.names=paste("totalAccX",1:128,sep=""))
  total_acc_y_test <- read.table("total_acc_y_test.txt", col.names=paste("totalAccY",1:128,sep=""))
  total_acc_z_test <- read.table("total_acc_z_test.txt", col.names=paste("totalAccZ",1:128,sep=""))

# Test subject overview data
setwd("~/Documents/My Documents/Coursera/DataScienceTrack/GettingAndCleaningData/data/UCI HAR Dataset/test")

  subject_test <- read.table("subject_test.txt",col.names="subject")  # 2947 x 1 
  y_test <- read.table("y_test.txt", col.names="activity_num")   # dim  2947    1
  testActivity <- join(y_test, activity_labels, by='activity_num', type='left', match='all')
  x_test <- read.table("x_test.txt", col.names=paste('feature',features[,1],sep=""))   # dim  2947  561
  testDat <- data.frame(dataSet = "test", subject_test, testActivity, x_test,body_acc_x_test,body_acc_y_test,
                        body_acc_z_test,body_gyro_x_test,body_gyro_y_test,body_gyro_z_test,total_acc_x_test,
                        total_acc_y_test,total_acc_z_test)

  ######################################  Train Subject Data ##########################################
# Train subject activity data
setwd("~/Documents/My Documents/Coursera/DataScienceTrack/GettingAndCleaningData/data/UCI HAR Dataset/train/Inertial Signals")
# 7352 x 128

  body_acc_x_train  <- read.table("body_acc_x_train.txt",  col.names=paste("bodyAccX", 1:128,sep=""))
  body_acc_y_train  <- read.table("body_acc_y_train.txt",  col.names=paste("bodyAccY", 1:128,sep=""))
  body_acc_z_train  <- read.table("body_acc_z_train.txt",  col.names=paste("bodyAccZ", 1:128,sep=""))
  body_gyro_x_train <- read.table("body_gyro_x_train.txt", col.names=paste("bodyGyroX",1:128,sep=""))
  body_gyro_y_train <- read.table("body_gyro_y_train.txt", col.names=paste("bodyGyroY",1:128,sep=""))
  body_gyro_z_train <- read.table("body_gyro_z_train.txt", col.names=paste("bodyGyroZ",1:128,sep=""))
  total_acc_x_train <- read.table("total_acc_x_train.txt", col.names=paste("totalAccX",1:128,sep=""))
  total_acc_y_train <- read.table("total_acc_y_train.txt", col.names=paste("totalAccY",1:128,sep=""))
  total_acc_z_train <- read.table("total_acc_z_train.txt", col.names=paste("totalAccZ",1:128,sep=""))


# Train subject overview data
  setwd("~/Documents/My Documents/Coursera/DataScienceTrack/GettingAndCleaningData/data/UCI HAR Dataset/train")
  subject_train <- read.table("subject_train.txt",col.names="subject")   # 7352 x   1
  y_train       <- read.table("y_train.txt", col.names="activity_num")       # 7352 x   1
  trainActivity <- join(y_train, activity_labels, by='activity_num', type='left', match='all')
  x_train       <- read.table("x_train.txt", col.names=paste('feature',features[,1],sep="")) # 7352 x 561
  trainDat <- data.frame(dataSet = "train", subject_train, trainActivity, x_train, body_acc_x_train, 
                         body_acc_y_train, body_acc_z_train,  body_gyro_x_train, body_gyro_y_train, body_gyro_z_train,
                         total_acc_x_train, total_acc_y_train, total_acc_z_train) 

  allDat <- rbind(testDat,trainDat)

  # specify features to be extracted for smaller data set:
  myVars <- c("dataSet","activity", "subject", paste("feature",grep("mean",features[,2]),sep=""),
               paste("feature",grep("Mean",features[,2]),sep=""), paste("feature",grep("std",features[,2]),sep=""))

  myColNames <- c("dataSet","activity","subject",as.character(features[grep("mean",features[,2]),2]),
               as.character(features[grep("Mean",features[,2]),2]), as.character(features[grep("std",features[,2]),2]))

  smallDat <- allDat[myVars]
  names(smallDat) <- myColNames

  smallDat$uniqueSubject <- paste(smallDat$dataSet,smallDat$subject) 
  smallDat1 <- subset(smallDat, select=-c(dataSet,subject))


  # create tidy data with means of all variables by uniqueSubject and activity

  myMeltDat <- melt(smallDat1, id.vars=c("uniqueSubject", "activity"))

  newTidyDat <- ddply(myMeltDat, c("uniqueSubject", "activity", "variable"), summarise, mean = mean(value))


  write.table(newTidyDat,row.names=FALSE,file="tidyData.txt")




run_analysis<-function(){
  #Setting required libaries
  library(dplyr)
  library(reshape2)
  #Getting the raw data...
  gettingRawData()
  #Merging raw data...
  mergeRawData()
  #Applying required transformations... 
  tidyData<-transformRawData()
  #Gettinf average tidy data...
  tidyAVerageDataSet<-getAverageData(tidyData)
  #Saving data into a file...
  write.table(tidyAVerageDataSet,file = "tidyAverageData.txt",row.names = FALSE)
}

#Fuction that set the raw data ready to be cleaning
gettingRawData<-function(dataDir="UCI HAR Dataset"){
  
  #Setting file path for each file we going to use
  rA_TrainingFile<-paste(dataDir,"train/X_train.txt",sep = "/")
  rA_TestFile<-paste(dataDir,"test/X_test.txt",sep = "/")
  rA_FeaturesFile<-paste(dataDir,"features.txt",sep = "/")
  rA_ActivityLabelsFile<-paste(dataDir,"activity_labels.txt",sep = "/")
  rA_TestActivitiesFile<-paste(dataDir,"test/y_test.txt",sep = "/")
  rA_TrainingActivitiesFile<-paste(dataDir,"train/y_train.txt",sep = "/")
  rA_SubjectTestFile<-paste(dataDir,"test/subject_test.txt",sep = "/")
  rA_SubjectTrainingFile<-paste(dataDir,"train/subject_train.txt",sep = "/")
  
  #Setting the working datasets
  trainingDataSet<<-read.table(rA_TrainingFile)
  testDataSet<<-read.table(rA_TestFile)
  featuresDataSet<<-read.table(rA_FeaturesFile,stringsAsFactors = FALSE)[[2]]
  activityLabelsDataSet<<-read.table(rA_ActivityLabelsFile,stringsAsFactors = FALSE)
  testActivitiesDataSet<<-read.table(rA_TestActivitiesFile,stringsAsFactors = FALSE)  
  trainingActivitiesDataSet<<-read.table(rA_TrainingActivitiesFile,stringsAsFactors = FALSE)
  testSubjectsDataSet<<-read.table(rA_SubjectTestFile,stringsAsFactors = FALSE)
  trainingSubjectsDataSet<<-read.table(rA_SubjectTrainingFile,stringsAsFactors = FALSE)  
}

#Function to merge raw data
mergeRawData<-function(){
  #merging raw data from test and training
  mTrainingTestData<<-rbind(testDataSet,trainingDataSet)
  #merging raw data from activities
  mActivitiesData<<-rbind(testActivitiesDataSet,trainingActivitiesDataSet)
  #merging raw data from subjects
  mSubjectsData<<-rbind(testSubjectsDataSet,trainingSubjectsDataSet)  
}

#Perform data transformation to get tidy data
transformRawData<-function(){
  #Adding column names to mTrainingTestData
  colnames(mTrainingTestData)<-featuresDataSet
  #Extracting only the measurements on the mean and standard deviation for each measurement. 
  mTrainingTestData<<-mTrainingTestData[,grep("mean|std",featuresDataSet)]
  
  #Renaming variables names
  varNames<-names(mTrainingTestData)
  varNames <- gsub(pattern="^t",replacement="time",x=varNames)
  varNames <- gsub(pattern="^f",replacement="freq",x=varNames)
  varNames <- gsub(pattern="-?mean[(][)]-?",replacement="Mean",x=varNames)
  varNames <- gsub(pattern="-?std[()][)]-?",replacement="Std",x=varNames)
  varNames <- gsub(pattern="-?meanFreq[()][)]-?",replacement="MeanFreq",x=varNames)
  varNames <- gsub(pattern="BodyBody",replacement="Body",x=varNames)
  names(mTrainingTestData) <- varNames
  
  #naming activities
  colnames(activityLabelsDataSet)<-c("Id","Label")
  colnames(mActivitiesData)[1]<-"Id"
  #Merging  labels with the set of activities
  lActivities<-merge(mActivitiesData,activityLabelsDataSet,by="Id")
  
  #Adding activity column
  mTrainingTestData<-cbind(activity=lActivities[,"Label"],mTrainingTestData)
  
  #naming subjects
  colnames(mSubjectsData)<-"Subject"
  
  #Adding subject column
  mTrainingTestData<-cbind(mSubjectsData,mTrainingTestData)
  
  #Returning the tidy data
  rTidyData<-mTrainingTestData[order(mTrainingTestData$Subject,mTrainingTestData$activity),]
  rTidyData
  
  
}

#Return average data of a given dataset
getAverageData<-function(tidyDataSet){
  #Melting data for apply mean
  mealtedData<-melt(tidyDataSet, id = c("Subject", "activity"))
  #Getting the final independent tidy data set with the average of each variable for each activity and each subject.
  tidyAverageData<-dcast(mealtedData, Subject + activity ~ variable, mean)
  #Returning data
  tidyAverageData
}
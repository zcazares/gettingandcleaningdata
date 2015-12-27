---
title: "CodeBook"
author: "Othoniel Cazares"
date: "26 de diciembre de 2015"
output: html_document
---

##Summary

  1. Variables
  2. Data
  3. Methods

####1. Variables

  * **tidyData**: Variable that get the first tidy dataset before apply the average.
  * **tidyAVerageDataSet**: Variable that get the final result of the function.

  * **rA_TrainingFile**: This variable sets the path for the file "x_train.txt".
  * **rA_TestFile**: This variable sets the path for the file "x_test.txt".
  * **rA_FeaturesFile**: This variable sets the path for the file "features.txt".
  * **rA_ActivityLabelsFile**: This variable sets the path for the file "activity_labels.txt".
  * **rA_TestActivitiesFile**: This variable sets the path for the file "test/y_test.txt".
  * **rA_TrainingActivitiesFile**: This variable sets the path for the file "train/y_train.txt".
  * **rA_SubjectTestFile**: This variable sets the path for the file "test/subject_test.txt".
  * **rA_SubjectTrainingFile**: This variable sets the path for the file "train/subject_train.txt".
  
  * **trainingDataSet**: Variable that contains the dataset of training txt.
  * **testDataSet**: Variable that contains the dataser of test txt
  * **featuresDataSet**: This variable contains the titles that we going to use for the merge dataset. 
  * **activityLabelsDataSet**: This variable is use to set the labels of the activities.
  * **testActivitiesDataSet**: Activities indexes of every "Test" observation.
  * **trainingActivitiesDataSet**: Activities indexes of every "Training" observation.
  * **testSubjectsDataSet**: Subject  indexes of every "Test" observation.
  * **trainingSubjectsDataSet**: Subject  indexes of every "Training" observation.
  
  * **mTrainingTestData**: Merged data is stored in this variable.
  * **mActivitiesData**: Merged activities data is stored in this variable.
  * **mSubjectsData**: Merged subjects data is stored in this variable.
  
  * **varNames**: Array object that contains the titles of the dataset.
  
  * **lActivities**: Set of activities that we going to bind in the main dataset. 

  * **rTidyData**: Store the result of treating the raw data.
  
  * **mealtedData**: Melted data for apply average and get the final result.
  * **tidyAverageData**: Variable that contains the final result of the function.


####2. Data

  * **features.txt**: List of all features.
  * **activity_labels.txt**: Links the class labels with their activity name.
  * **train/X_train.txt**: Training set.
  * **train/y_train.txt**: Training labels.
  * **test/X_test.txt**: Test set.
  * **test/y_test.txt**: Test labels.
  * **train/subject_train.txt**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
  * **train/subject_test.txt**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
  

####3. Methods

  * **run_analysis**: Main method that makes the calls to the required methods.
      * Parameters: None.
  
  * **gettingRawData**: Method to get the raw data from the original files. 
      * Parametes: Data source path.
      * Description: Set the path files and create dataframes for each file.
  
  * **mergeRawData**: Method for merge data from the raw datasets.    
      * Parametes: None.
      * Description: Merging data from training and test dataset, treining and test activities and traning and test subjects.
      
  * **transformRawData**: Transform raw data to get tidy data for proper analysis.
      * Parametes: None.
      * Actions: 
        * Name columns of the main dataset with the features content.
        * Extract only the measurements data of mean and standard deviation for each measurement. 
        * Rename columns for proper reading.        
        * Name columns for activities data.
        * Merge activities dataset to make relational data.
        * Add activitiy column.
        * Name columns of subjets for proper reading.
        * Add subjets column.
        * Getting and returning ordered data.
        
  * **getAverageData**: Return average data of a given dataset.
      * Parametes: Tidy Dataset.
      * Actions:
        * Melt data to apply the mean to the dataset.
        * Apply mean to melted data.
        * Returning the proper info.
        
        
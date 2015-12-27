---
title: "README"
author: "Othoniel Cazares"
date: "26 de diciembre de 2015"
output: html_document
---

##Summary

  1. Description
  2. Process
  3. Results


####1. Description
  
  * Main.
  * Collect the raw data.
  * Merge the collected data.
  * Transform the raw data.
  * Calculate the average.

####2. Process

  * **Main**: Principal method that make the calls to the rest of the processes in the given order, "Collect raw data", "Merge data", "Transform the raw data", "Calculate average" and "Return the proper result".
  
  * **Collect the raw data**: Process via "gettingRawData" method who sets the variables path and load the necesary dataset to working with.
  
  * **Merge the collected data**: Merge the collected raw data, returning the complete dataset to apply needed transformations.
  
  * **Transform the raw data**: Make the complete transformation of the raw data, add title, extract only the needed data, add activities and the subjects to return a tidy dataset.
  
  * **Calculate the average**: Gets a tidy dataset to calculate the average and return the final data set.
  
####3. Results

  The resulting data set is composed of the data acquired from the files provided in which the metrics collected by subject and activity is defined then we save this data into a "txt" file in the working directory named "tidyAverageData.txt".
---
title: "CodeBook.md"
author: "Diana Duncan"
date: "August 23, 2015"
output: html_document
---

Data Dictionary - Subject/Activity means of collected means and standard deviations
===================================================================================

Code book that describes the variables, the data, and any transformations or work that performed to clean up the data

  Original data here: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
  Description of original data sets: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The methodology for obtaining the "tidy" dataset was as follows:

- The training and test sets were appended together into a single data frame
- The activities and subjects were included as columns in the data.frame.  
- The column names were gleaned from the features.txt file, with substitutions make for readability.  
    - I did not understand the "angle" features well enough to make meaningful substitutions, so left them as-is so as not to introduce error on my part.

- The columns containing the "mean" or "std" were selected from the data set
- The data was grouped by Subject and Activity, and each column was averaged within that group

Subject
------
    An identifier of the wearer of the device
    
Activity
--------
    The activity performed while wearing the device.  

mean(Time_Body_Acceleration_mean_On_X_Axis),               mean(Time_Body_Acceleration_mean_On_Y_Axis),              
mean(Time_Body_Acceleration_mean_On_Z_Axis),               mean(Time_Gravity_Acceleration_mean_On_X_Axis),           
mean(Time_Gravity_Acceleration_mean_On_Y_Axis),            mean(Time_Gravity_Acceleration_mean_On_Z_Axis),           
mean(Time_Body_Acceleration_Jerk_mean_On_X_Axis),          mean(Time_Body_Acceleration_Jerk_mean_On_Y_Axis),         
mean(Time_Body_Acceleration_Jerk_mean_On_Z_Axis),          mean(Time_Body_Gyroscope_mean_On_X_Axis),                 
mean(Time_Body_Gyroscope_mean_On_Y_Axis),                  mean(Time_Body_Gyroscope_mean_On_Z_Axis),                 
mean(Time_Body_Gyroscope_Jerk_mean_On_X_Axis),             mean(Time_Body_Gyroscope_Jerk_mean_On_Y_Axis),            
mean(Time_Body_Gyroscope_Jerk_mean_On_Z_Axis),             mean(Time_Body_Acceleration_Mag_mean),                    
mean(Time_Gravity_Acceleration_Mag_mean),                  mean(Time_Body_Acceleration_JerkMag_mean),                
mean(Time_Body_Gyroscope_Mag_mean),                        mean(Time_Body_Gyroscope_JerkMag_mean),                   
mean(Frequency_Body_Acceleration_mean_On_X_Axis),          mean(Frequency_Body_Acceleration_mean_On_Y_Axis),         
mean(Frequency_Body_Acceleration_mean_On_Z_Axis),          mean(Frequency_Body_Acceleration_meanFreq_On_X_Axis),     
mean(Frequency_Body_Acceleration_meanFreq_On_Y_Axis),      mean(Frequency_Body_Acceleration_meanFreq_On_Z_Axis),     
mean(Frequency_Body_Acceleration_Jerk_mean_On_X_Axis),     mean(Frequency_Body_Acceleration_Jerk_mean_On_Y_Axis),    
mean(Frequency_Body_Acceleration_Jerk_mean_On_Z_Axis),     mean(Frequency_Body_Acceleration_Jerk_meanFreq_On_X_Axis),
mean(Frequency_Body_Acceleration_Jerk_meanFreq_On_Y_Axis), mean(Frequency_Body_Acceleration_Jerk_meanFreq_On_Z_Axis),
mean(Frequency_Body_Gyroscope_mean_On_X_Axis),             mean(Frequency_Body_Gyroscope_mean_On_Y_Axis),            
mean(Frequency_Body_Gyroscope_mean_On_Z_Axis),             mean(Frequency_Body_Gyroscope_meanFreq_On_X_Axis),        
mean(Frequency_Body_Gyroscope_meanFreq_On_Y_Axis),         mean(Frequency_Body_Gyroscope_meanFreq_On_Z_Axis),        
mean(Frequency_Body_Acceleration_Mag_mean),                mean(Frequency_Body_Acceleration_Mag_meanFreq),           
mean(Frequency_BodyBody_Acceleration_JerkMag_mean),        mean(Frequency_BodyBody_Acceleration_JerkMag_meanFreq),   
mean(Frequency_BodyBody_Gyroscope_Mag_mean),               mean(Frequency_BodyBody_Gyroscope_Mag_meanFreq),          
mean(Frequency_BodyBody_Gyroscope_JerkMag_mean),           mean(Frequency_BodyBody_Gyroscope_JerkMag_meanFreq),      
mean(angletBody_Acceleration_Mean.gravity),                mean(angletBody_Acceleration_JerkMean.gravityMean),       
mean(angletBody_Gyroscope_Mean.gravityMean),               mean(angletBody_Gyroscope_JerkMean.gravityMean),          
mean(angleX.gravityMean),                                  mean(angleY.gravityMean),                                 
mean(angleZ.gravityMean),                                  mean(Time_Body_Acceleration_std_On_X_Axis),               
mean(Time_Body_Acceleration_std_On_Y_Axis),                mean(Time_Body_Acceleration_std_On_Z_Axis),               
mean(Time_Gravity_Acceleration_std_On_X_Axis),             mean(Time_Gravity_Acceleration_std_On_Y_Axis),            
mean(Time_Gravity_Acceleration_std_On_Z_Axis),             mean(Time_Body_Acceleration_Jerk_std_On_X_Axis),          
mean(Time_Body_Acceleration_Jerk_std_On_Y_Axis),           mean(Time_Body_Acceleration_Jerk_std_On_Z_Axis),          
mean(Time_Body_Gyroscope_std_On_X_Axis),                   mean(Time_Body_Gyroscope_std_On_Y_Axis),                  
mean(Time_Body_Gyroscope_std_On_Z_Axis),                   mean(Time_Body_Gyroscope_Jerk_std_On_X_Axis),             
mean(Time_Body_Gyroscope_Jerk_std_On_Y_Axis),              mean(Time_Body_Gyroscope_Jerk_std_On_Z_Axis),             
mean(Time_Body_Acceleration_Mag_std),                      mean(Time_Gravity_Acceleration_Mag_std),                  
mean(Time_Body_Acceleration_JerkMag_std),                  mean(Time_Body_Gyroscope_Mag_std),                        
mean(Time_Body_Gyroscope_JerkMag_std),                     mean(Frequency_Body_Acceleration_std_On_X_Axis),          
mean(Frequency_Body_Acceleration_std_On_Y_Axis),           mean(Frequency_Body_Acceleration_std_On_Z_Axis),          
mean(Frequency_Body_Acceleration_Jerk_std_On_X_Axis),      mean(Frequency_Body_Acceleration_Jerk_std_On_Y_Axis),     
mean(Frequency_Body_Acceleration_Jerk_std_On_Z_Axis),      mean(Frequency_Body_Gyroscope_std_On_X_Axis),             
mean(Frequency_Body_Gyroscope_std_On_Y_Axis),              mean(Frequency_Body_Gyroscope_std_On_Z_Axis),             
mean(Frequency_Body_Acceleration_Mag_std),                 mean(Frequency_BodyBody_Acceleration_JerkMag_std),        
mean(Frequency_BodyBody_Gyroscope_Mag_std),                mean(Frequency_BodyBody_Gyroscope_JerkMag_std)
---------------------------------------------------------------------------------------------------------
      
      The aggregated means of the mean and stadard deviation measurements for the Subject/Activity.  See the README.txt and features_info.txt for further explanation of each measurment.

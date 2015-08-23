# run_Analysis.R
options(digits=9)
library(reshape2)
library(data.table)
library(dplyr)

# Set this to the directory to where the https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip file
# has been unzipped
# directory <- "E:\\CourseraCollatoral\\GettingAndCleaningData\\UCI HAR Dataset"
directory <- curwd()

# Load the labels files
fileName <- sprintf("%s/%s", directory, "activity_labels.txt")
#activity_labels <- read.table(fileName, col.names = c("ActivityCode","Activity"))
activity_labels <- scan(fileName, what=list(numeric(3),""))
fileName <- sprintf("%s/%s", directory, "features.txt")
features <- read.table(fileName, col.names = c("FeatureCode","Feature"))
#features <- scan(fileName, what=list(numeric(3),""))

#Derive readable names for features
features$FeatureName <- str_replace(features$Feature, "^t", "Time_")
features$FeatureName <- str_replace(features$FeatureName, "^f", "Freq_")
features$FeatureName <- str_replace(features$FeatureName, "Acc", "_Accel_")
features$FeatureName <- str_replace(features$FeatureName, "Gyro", "_Gyro_")
features$FeatureName <- str_replace_all(features$FeatureName, "[()]", "")
features$FeatureName <- str_replace(features$FeatureName, "-X", "_On_X_Axis")
features$FeatureName <- str_replace(features$FeatureName, "-Y", "_On_Y_Axis")
features$FeatureName <- str_replace(features$FeatureName, "-Z", "_On_Z_Axis")
features$FeatureName <- str_replace_all(features$FeatureName, "-", "_")
features$FeatureName <- str_replace_all(features$FeatureName, "__", "_")

subjects <- vector("numeric")
ys <- vector("numeric")
dataSets <- c("test","train")
# Load the test and train files
for(dataSet in dataSets)
{
    fileName <- sprintf("%s/%s/subject_%s.txt", directory, dataSet, dataSet)
    subjectDataSet <- scan(fileName)
    subjects <- append(subjects, subjectDataSet)
    
    fileName <- sprintf("%s/%s/y_%s.txt", directory, dataSet, dataSet)
    yDataSet <- scan(fileName)
    ys <- append(ys, yDataSet)
    
    tName <- paste("x", dataSet, sep="")
    fileName <- sprintf("%s/%s/X_%s.txt", directory, dataSet, dataSet)
    #assign(tName, read.table(fileName, header=FALSE, col.names=features[[2]]))
    assign(tName, read.table(fileName, header=FALSE, col.names=features$FeatureName))
}

# Merge the data into Subject   Activity    Measurements...
mergedSets <- rbindlist(list(xtest, xtrain), use.names=TRUE, fill=FALSE)
mergedSets$Subject <- subjects
mergedSets$ActivityCode <- ys
mergedSets$Activity <- activity_labels[[2]][mergedSets$ActivityCode]

# Extract only the measurements on the mean and standard deviation for each measurement. 
meansAndStds <- select(mergedSets, Subject, Activity, contains("mean"), contains("std"))

# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
subjectActivityAvgs <- ddply(meansAndStds, .(Subject,Activity), summarize, 
      mean(Time_Body_Accel_mean_On_X_Axis),               mean(Time_Body_Accel_mean_On_Y_Axis),              
      mean(Time_Body_Accel_mean_On_Z_Axis),               mean(Time_Gravity_Accel_mean_On_X_Axis),           
      mean(Time_Gravity_Accel_mean_On_Y_Axis),            mean(Time_Gravity_Accel_mean_On_Z_Axis),           
      mean(Time_Body_Accel_Jerk_mean_On_X_Axis),          mean(Time_Body_Accel_Jerk_mean_On_Y_Axis),         
      mean(Time_Body_Accel_Jerk_mean_On_Z_Axis),          mean(Time_Body_Gyro_mean_On_X_Axis),                 
      mean(Time_Body_Gyro_mean_On_Y_Axis),                  mean(Time_Body_Gyro_mean_On_Z_Axis),                 
      mean(Time_Body_Gyro_Jerk_mean_On_X_Axis),             mean(Time_Body_Gyro_Jerk_mean_On_Y_Axis),            
      mean(Time_Body_Gyro_Jerk_mean_On_Z_Axis),             mean(Time_Body_Accel_Mag_mean),                    
      mean(Time_Gravity_Accel_Mag_mean),                  mean(Time_Body_Accel_JerkMag_mean),                
      mean(Time_Body_Gyro_Mag_mean),                        mean(Time_Body_Gyro_JerkMag_mean),                   
      mean(Freq_Body_Accel_mean_On_X_Axis),          mean(Freq_Body_Accel_mean_On_Y_Axis),         
      mean(Freq_Body_Accel_mean_On_Z_Axis),          mean(Freq_Body_Accel_meanFreq_On_X_Axis),     
      mean(Freq_Body_Accel_meanFreq_On_Y_Axis),      mean(Freq_Body_Accel_meanFreq_On_Z_Axis),     
      mean(Freq_Body_Accel_Jerk_mean_On_X_Axis),     mean(Freq_Body_Accel_Jerk_mean_On_Y_Axis),    
      mean(Freq_Body_Accel_Jerk_mean_On_Z_Axis),     mean(Freq_Body_Accel_Jerk_meanFreq_On_X_Axis),
      mean(Freq_Body_Accel_Jerk_meanFreq_On_Y_Axis), mean(Freq_Body_Accel_Jerk_meanFreq_On_Z_Axis),
      mean(Freq_Body_Gyro_mean_On_X_Axis),             mean(Freq_Body_Gyro_mean_On_Y_Axis),            
      mean(Freq_Body_Gyro_mean_On_Z_Axis),             mean(Freq_Body_Gyro_meanFreq_On_X_Axis),        
      mean(Freq_Body_Gyro_meanFreq_On_Y_Axis),         mean(Freq_Body_Gyro_meanFreq_On_Z_Axis),        
      mean(Freq_Body_Accel_Mag_mean),                mean(Freq_Body_Accel_Mag_meanFreq),           
      mean(Freq_BodyBody_Accel_JerkMag_mean),        mean(Freq_BodyBody_Accel_JerkMag_meanFreq),   
      mean(Freq_BodyBody_Gyro_Mag_mean),               mean(Freq_BodyBody_Gyro_Mag_meanFreq),          
      mean(Freq_BodyBody_Gyro_JerkMag_mean),           mean(Freq_BodyBody_Gyro_JerkMag_meanFreq),      
      mean(angletBody_Accel_Mean.gravity),                mean(angletBody_Accel_JerkMean.gravityMean),       
      mean(angletBody_Gyro_Mean.gravityMean),               mean(angletBody_Gyro_JerkMean.gravityMean),          
      mean(angleX.gravityMean),                                  mean(angleY.gravityMean),                                 
      mean(angleZ.gravityMean),                                  mean(Time_Body_Accel_std_On_X_Axis),               
      mean(Time_Body_Accel_std_On_Y_Axis),                mean(Time_Body_Accel_std_On_Z_Axis),               
      mean(Time_Gravity_Accel_std_On_X_Axis),             mean(Time_Gravity_Accel_std_On_Y_Axis),            
      mean(Time_Gravity_Accel_std_On_Z_Axis),             mean(Time_Body_Accel_Jerk_std_On_X_Axis),          
      mean(Time_Body_Accel_Jerk_std_On_Y_Axis),           mean(Time_Body_Accel_Jerk_std_On_Z_Axis),          
      mean(Time_Body_Gyro_std_On_X_Axis),                   mean(Time_Body_Gyro_std_On_Y_Axis),                  
      mean(Time_Body_Gyro_std_On_Z_Axis),                   mean(Time_Body_Gyro_Jerk_std_On_X_Axis),             
      mean(Time_Body_Gyro_Jerk_std_On_Y_Axis),              mean(Time_Body_Gyro_Jerk_std_On_Z_Axis),             
      mean(Time_Body_Accel_Mag_std),                      mean(Time_Gravity_Accel_Mag_std),                  
      mean(Time_Body_Accel_JerkMag_std),                  mean(Time_Body_Gyro_Mag_std),                        
      mean(Time_Body_Gyro_JerkMag_std),                     mean(Freq_Body_Accel_std_On_X_Axis),          
      mean(Freq_Body_Accel_std_On_Y_Axis),           mean(Freq_Body_Accel_std_On_Z_Axis),          
      mean(Freq_Body_Accel_Jerk_std_On_X_Axis),      mean(Freq_Body_Accel_Jerk_std_On_Y_Axis),     
      mean(Freq_Body_Accel_Jerk_std_On_Z_Axis),      mean(Freq_Body_Gyro_std_On_X_Axis),             
      mean(Freq_Body_Gyro_std_On_Y_Axis),              mean(Freq_Body_Gyro_std_On_Z_Axis),             
      mean(Freq_Body_Accel_Mag_std),                 mean(Freq_BodyBody_Accel_JerkMag_std),        
      mean(Freq_BodyBody_Gyro_Mag_std),                mean(Freq_BodyBody_Gyro_JerkMag_std)) 

write.table(subjectActivityAvgs, file = "subjectActivityAvgs.txt", row.name = FALSE)

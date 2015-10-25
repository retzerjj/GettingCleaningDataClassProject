  - Variables: 
    Variables used in the tidy dataset include:

     uniqueSubject   An id combining respondent number with test/train group membership.                      

     activity        The activity the respondent was engaged in (numeric indicators were
                     replaced with descriptive names).

     The remaining time/frequency domain vairables associagted with either mean or standard 
     deviation statistics are listed below.

                                          tBodyAcc-mean()-X                      tBodyAcc-mean()-Y                    
      tBodyAcc-mean()-Z                 tGravityAcc-mean()-X                   tGravityAcc-mean()-Y                 
   tGravityAcc-mean()-Z                   tBodyAccJerk-mean()-X                  tBodyAccJerk-mean()-Y                
  tBodyAccJerk-mean()-Z                  tBodyGyro-mean()-X                     tBodyGyro-mean()-Y                   
  tBodyGyro-mean()-Z                     tBodyGyroJerk-mean()-X                 tBodyGyroJerk-mean()-Y               
  tBodyGyroJerk-mean()-Z                 tBodyAccMag-mean()                     tGravityAccMag-mean()                
  tBodyAccJerkMag-mean()                 tBodyGyroMag-mean()                    tBodyGyroJerkMag-mean()              
  fBodyAcc-mean()-X                      fBodyAcc-mean()-Y                      fBodyAcc-mean()-Z                    
  fBodyAcc-meanFreq()-X                  fBodyAcc-meanFreq()-Y                  fBodyAcc-meanFreq()-Z                
  fBodyAccJerk-mean()-X                  fBodyAccJerk-mean()-Y                  fBodyAccJerk-mean()-Z                
  fBodyAccJerk-meanFreq()-X              fBodyAccJerk-meanFreq()-Y              fBodyAccJerk-meanFreq()-Z            
  fBodyGyro-mean()-X                     fBodyGyro-mean()-Y                     fBodyGyro-mean()-Z                   
  fBodyGyro-meanFreq()-X                 fBodyGyro-meanFreq()-Y                 fBodyGyro-meanFreq()-Z               
  fBodyAccMag-mean()                     fBodyAccMag-meanFreq()                 fBodyBodyAccJerkMag-mean()           
  fBodyBodyAccJerkMag-meanFreq()         fBodyBodyGyroMag-mean()                fBodyBodyGyroMag-meanFreq()          
  fBodyBodyGyroJerkMag-mean()            fBodyBodyGyroJerkMag-meanFreq()        angle(tBodyAccMean,gravity)          
  angle(tBodyAccJerkMean),gravityMean)   angle(tBodyGyroMean,gravityMean)       angle(tBodyGyroJerkMean,gravityMean) 
  angle(X,gravityMean)                   angle(Y,gravityMean)                   angle(Z,gravityMean)                 
  tBodyAcc-std()-X                       tBodyAcc-std()-Y                       tBodyAcc-std()-Z                     
  tGravityAcc-std()-X                    tGravityAcc-std()-Y                    tGravityAcc-std()-Z                  
  tBodyAccJerk-std()-X                   tBodyAccJerk-std()-Y                   tBodyAccJerk-std()-Z                 
  tBodyGyro-std()-X                      tBodyGyro-std()-Y                      tBodyGyro-std()-Z                    
  tBodyGyroJerk-std()-X                  tBodyGyroJerk-std()-Y                  tBodyGyroJerk-std()-Z                
  tBodyAccMag-std()                      tGravityAccMag-std()                   tBodyAccJerkMag-std()                
  tBodyGyroMag-std()                     tBodyGyroJerkMag-std()                 fBodyAcc-std()-X                     
  fBodyAcc-std()-Y                       fBodyAcc-std()-Z                       fBodyAccJerk-std()-X                 
  fBodyAccJerk-std()-Y                   fBodyAccJerk-std()-Z                   fBodyGyro-std()-X                    
  fBodyGyro-std()-Y                      fBodyGyro-std()-Z                      fBodyAccMag-std()                    
  fBodyBodyAccJerkMag-std()              fBodyBodyGyroMag-std()                 fBodyBodyGyroJerkMag-std()           


  - Data, 
    
    Readings from fitness experiments with 30 volunteers was collected via smartphone (Samsung Galaxy S II)
    motion sensors.  All data was included in one of two arbitrarily subsetted groups,  train  and  test .

    The data was comprised of triaxial acceleration from an accelerometer (total acceleration) and the 
    estimated body acceleration. In addition, triaxial angular velocity from a gyroscope was included 
    along wit a 561-feature vector with time and frequency domain variables. 

    The activity label for  each experiment was included and volunteer ID was also provided. 

  - Transformations / Cleaning 
    
    The time/frequency domain attribute names were given to data columns. In addition labels were 
    substituted for activity codes in the data set. The time/freq data was combined with sensor 
    data from the smartphone for both the  train  and  test  groups. 
    
    The measurment varibles included in the final data set were averaged simultaneously by
    subject and activity. The output was then written to a txt, tidy dataset.






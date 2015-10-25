Explain how all of the scripts work and how they are connected.  

The "run_analysis.r" script file reads in multiple files for subjects randomly classified as one of either "training" or
"testing". The data is necessary for the development of the algorithms pertaining to the accelerometers from the 
Samsung Galaxy S smartphone.

These data include 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

After the data is read, activity labels are attached to numeric activity category indicators, and variable names
are attached to data in both the test and training data sets.

Training data are combined along with test data. Next the training and test data are also combined. 

Finally, as subset of variables are selected from the data (involving means and standard deviations) and 
means are calculated by respondent/activity. This data is created in a "tidy" data set format and written as
text.





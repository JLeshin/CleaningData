 Running the 'run_analysis.R' file outputs the data table described in the final part of the Coursera Getting and Cleaning Data 
 course project. There are multiple comments within the run_analysis file that describe the functions of specific lines of
 code. 

 The code assumes that the user has all the Samsung data in their working directory, with their original file names. The 
 various 'Parts' of the code refer to the instructions numbered 1-5 in the project description. The code
 first adds Activity and ID columns to both the test and training data. It then merges these two modified data sets, sorts the 
 merged table by the Activities column, and finally labels the columns by feature. The resulting table is called 'Arr'.

 The next task is to subset 'Arr' by taking the first two columns (Activity and ID), along with any column containing the
 text 'mean' or 'std'. This table is called Arr_Mean_Std.

 There are 180 Activity/ID combinations since there are 30 participants, each of whom did 6 activities. They each did a given
 activity some number of times, and our next goal is, for each Activity/ID combination, to find their average measurement. 
 Our final table, titled "Final", consists of one row for each Activity/ID combination and one column for each 
 measurement that is a mean or standard deviation (in addition to the first two columns that specify the Activity/ID 
 combination). 

#IMPORTANT NOTE

The column names of "Final" are the same as the column names of Arr_Mean_Std, but it should be understood
that in 'Final', the column names refer to AVERAGES over each Activity/ID combination. 

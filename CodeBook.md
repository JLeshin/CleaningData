# This is to describe the variables in the data table that is outputted by the 'run_analysis.R' file. 

Each row is an Activity/ID combination that is described by the first two columns of each row, where the combinations are indexed 
by Activity. I have elected to put these combinations in two rows rather than one so that the user can easily sort the data by ID 
if they wish. For example, a row whose first two entries are 'Laying' and '23' means that the data in that row is for the 
participant with ID number 23 and it is this person's data when laying down, as opposed to one of the other activities. 

The column names come directly from the features.txt file of the Samsung data. They contain all features that are either means 
or standard deviations, denoted by 'mean' and 'std', respectively. The column names are descriptions of the measurements. For
further information, the user should consult the Samsung README.txt and features_info.txt files. 
#IMPORTANT:
It should be understood that each of the column names refers to the average of that measurement for a given
Activity/ID combination. 

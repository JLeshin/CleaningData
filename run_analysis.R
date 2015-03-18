#This is part 1

Test<-read.table('X_test.txt')
IDs_Test<-read.table('subject_test.txt')
Acts_Test<-read.table('y_test.txt')

#Next two lines are for sorting later and to avoid repeated column names when joining in 'Together' below
colnames(Acts_Test)<-('Activity') 
colnames(IDs_Test)<-('ID')

Full_Test<-cbind(Acts_Test,IDs_Test,Test)

Train<-read.table('X_train.txt')
IDs_Train<-read.table('subject_train.txt')
Acts_Train<-read.table('y_train.txt')

#Next two lines are for sorting later and to avoid repeated column names when joining in 'Together' below
colnames(Acts_Train)<-('Activity') 
colnames(IDs_Train)<-('ID')

Full_Train<-cbind(Acts_Train,IDs_Train,Train)

Together<-rbind(Full_Train,Full_Test)

install.packages('dplyr')
library(dplyr)

Arr<-arrange(Together,Acts)


#Part 2


Feat<-read.table('features.txt')
colnames(Arr)<-c("Activities","ID",as.character(Feat$V2)) #Gives Arr the Feature col names
Arr_Mean_Std<-Arr[,c(1,2,2+c(grep('mean',Feat$V2), grep('std',Feat$V2)))] #This gets the columns of Arr that measure mean or standard dev.
#The "2+" is necessary to account for the fact that the first two cols of Arr, 'Activities' and 'ID', are not features.


#Part 3
labels<-read.table('activity_labels.txt')
Nice_labels<-as.character(labels[,2])
A<-Arr_Mean_Std$Activities 
for (i in 1:length(A)) {for (j in 1:6) {if(A[i]==j){A[i]<-Nice_lables[j]}}}

Arr_Mean_Std$Activities<-A



#Part 4
#Done when we named columns of 'Arr' earlier


#Part 5

Y<-arrange(Arr_Mean_Std,Activities,ID) #This arranges the table by activity, and by ID number within each activity

ColAves<-function(j){
  N<-c()
  z<-1
  for(i in 1:length(u)){N[i]<-mean(Y[z:z+u[i]-1,j]);z<-z+u[i]}
  return(N)}

M<-c()
for(j in 3:81){M<-c(M,ColAves(j))} #M is one long vector with all our averages, listed by column

dim(M)<-c(180,79) #This converts M to a data frame where each column contains averages for all 180 (Activity,ID) pairs for that column

U<-unique(Y[,1:2])                    

Final<-cbind(U,M)  
colnames(Final)<-colnames(Y)

View(Final)

#All the files are already downloaded and unzipped in the required folder.
# TRAINING SET
xtrain<-read.table("train/X_train.txt")
ytrain<-read.table("train/y_train.txt")
subjecttrain<-read.table("train/subject_train.txt")
train<-cbind(subjecttrain,ytrain,xtrain)
# TEST SET
xtest<-read.table("test/X_test.txt")
ytest<-read.table("test/y_test.txt")
subjecttest<-read.table("test/subject_test.txt")
test<-cbind(subjecttest,ytest,xtest)
# DATA SETS CREATED.

#=======================================================================
#Merging the datasets
mainset<-rbind(test,train)
variablenamestable<-read.table("features.txt")
variablenames<-variablenamestable[,2]
#=======================================================================
#Correcting the variable names
variablenames<-sub("^t","Time ",variablenames)
variablenames<-sub("Acc","Acceleration ",variablenames)
variablenames<-sub("-mean","Mean ",variablenames)
variablenames<-sub("\\(\\)","",variablenames)
variablenames<-sub("-"," ",variablenames)
variablenames<-sub("Gyro","Gyroscope  ",variablenames)
variablenames<-sub("std","Standard_Deviation",variablenames)
variablenames<-sub("max-","Maximum",variablenames)
variablenames<-sub("min-","Minimum",variablenames)
#We require the first two columns i.e. Subject and Activity as well but they are not in the indicesvariablesrequired list.
#Therefore, we manually add Subject and Activity as column names of the first two columns.
names(mainset)=c("Subject","Activity",variablenames)
#=======================================================================
#Extracting th required data
indicescolumnsequired<-grep(".*(Mean|Std)",variablenames)
#Since we also need the first two columns i.e. Subject and Activity, we need to add 2 to every index to shift it two places right.
datasetrequired<-mainset[,c(1,2,indicescolumnsequired+2)]
#=======================================================================
#Activity Labels
activitylabelstable<-read.table("activity_labels.txt")
activitylabels<-activitylabelstable[,2]
datasetrequired$Activity<-factor(datasetrequired$Activity,levels = activitylabelstable[,1], labels = activitylabels)
#=======================================================================
#Grouping Data. Pipe Operator will be used.
library(dplyr)
solutiontable<- datasetrequired %>% group_by(Subject,Activity) %>% summarise_all(mean)
#=======================================================================
#Writing Table
write.table(solutiontable,"solutionfile.txt",row.names = FALSE)

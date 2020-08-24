# Course-Project
Zip files already downloaded and unzipped.
Created xtrain and xtest datasets using read.table method from files X_train and X_test.
Created ytrain and ytest datasets using read.table method from files y_train and y_test.
Created subjecttrain and subjecttest datasets using read.table method from subject_train and subject_test files.
Merged subjecttrain,ytrain,xtrain to form train set , subjecttest,ytest,xtest to form test set using cbind function.
Merged train and test set to create mainset using rbind function.
Created variablenamestable using features.txt file via read.table method

Edited variable names to make them descriptive:

1) Changed "t" at the beginning of each variable to "Time".
2) Changed "mean()" to "Mean".
3) Changed "std()" to "Standard_Deviation.
4) Changed "Gyro" to "Gyroscope".
5) Changed "min()" and "max()" to "Minimum" and "Maximum" rspectively.
5) Removed hyphens (-) and extra Parantheses.

Alloted these variable names to mainset with the first two column names as Subject and Activity.

Required columns were the ones with measures of Mean and Standard Deviations, so the required data was extracted (including the Subject anf Activity colums) using grep method.
This new set was named datasetrequired.

dplyr package was loaded.
datasetrequired was grouped by using group_by function from the dplyr package.
Data was grouped by the Student and Activity variables.
Finally, to summarize the data, the function summmarize_all was used with function=mean. (To show the average measurements of each subject with respect to each of the six activities.)
This summarized data was created by the piping operator and was named as the solutiondata.
Finally, the table was written as a text file using write.table function with row.names=FALSE as mentioned in the Course Project instructions on Coursera.


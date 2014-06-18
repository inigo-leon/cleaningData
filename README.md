This file explains the whole operations for this assignment

## Read files
First of all, I read all the necessary files into variables
* subject_test
* X_test
* Y_test
* subject_train
* X_train
* Y_train
* activity_labels
* features


##Merging Full data
In this step, I created 3 variables (X_data, Y_data, subject_data) with all the observations


## Convert the labels to character
As activity_labels$V2 is factor, I transform it into character


##Assign column names to X_data
I put as column names of X_data the labels defined in features.txt

##Merging description to Y_data, without changing the order
I merge Y_data with it labels, joining Y_data and activity_labels by "V1" column, without sorting the result

##Assign column names to Y_data
I put by hand the column names to Y_data ("activity-code", "activity-label")

##Assign column name to subject_data
I put by hand the column names to subject_data ("subject")

##Total data
Y merge subject_data, Y_data and X_datainto a single data frame, named total_data

##Function for detecting mean an std columns
I create a function to detect the columns that end with "std()" or "mean()". It returns a vector with all those column names

##Obtain the columns with mean and std
Then I apply these column names to the total_data and save the result into total_data_meanStd. This is going to be the tisy data set for the 1-4 points of the assignment

##Write the tidy data set as a txt file
I write the data set obtained in the previous step into a txt file

##Tidy data set with the average of each variable for each activity and each subject
The last step is to create an independent tidy data set with the average of each variable for each activity and each subject. To obtain it, I use the aggregate function



## Read files

subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
Y_test <- read.table("Y_test.txt")

subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt")
Y_train <- read.table("Y_train.txt")

activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

##Merging Full data
X_data <- rbind(X_test,X_train)
Y_data <- rbind(Y_test,Y_train)
subject_data <- rbind(subject_test, subject_train)

## Convert the labels to character
activity_labels$V2 <- as.character(activity_labels$V2)

##Assign column names to X_data from features.txt file
colnames(X_data) <- features$V2

##Merging description to Y_data, without changing the order
Y_data <- merge(Y_data,activity_labels,by="V1", sort=FALSE)

##Assign column names to Y_data
colnames(Y_data)<-c("activity-code", "activity-label")

##Assign column name to subject_data
colnames(subject_data) <- c("subject")


##Total data
total_data <- cbind(subject_data, Y_data, X_data)


##Function for detecting mean an std columns
columnMeanStd <- function(x){
    newCols<-NULL
    for (i in 1:length(x)){
        dato <- as.character(x[i])
        if (substr(dato, nchar(dato)-4,nchar(dato))=="std()"
            || substr(dato, nchar(dato)-5,nchar(dato))=="mean()"){
            if (length(newCols)==0){
                newCols<-c(dato)
            }else{
                newCols<-c(newCols,dato)
            }
        }
    }
    newCols
    
}

##Obtain the columns with mean and std
columnNamesMeanStd<-columnMeanStd(colnames(total_data))
total_data_meanStd <- total_data[,columnNamesMeanStd]

##Write the tidy data set as a txt file
write.table(total_data_meanStd, "tidyDataSet.txt", sep=",")

##Create an independent tidy data set with the average of each variable for each activity and each subject
total_data_aggregated<-aggregate(total_data[,4:564], list(Subject=total_data$subject, Activity=total_data$"activity-code"), mean)
write.table(total_data_aggregated, "tidyAggregatedDataSet.txt", sep=",")


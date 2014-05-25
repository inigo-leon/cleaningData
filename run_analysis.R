
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

## Convert the labels to character
activity_labels$V2 <- as.character(activity_labels$V2)

##Asign column names from feature.txt file
colnames(X_data) <- featuresData$V2

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
columnNamesMeanStd<-columnMeanStd(colnames(X_data))
X_data <- X_data[,columnNamesMeanStd]


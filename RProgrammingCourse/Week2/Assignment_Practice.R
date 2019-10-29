# practice assignment
setwd("C:/Users/Richard/dsprojects/RProgrammingCourse/Week2")

dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "Assignment_Practice")

list.files("Assignment_Practice")

andy <- read.csv("Assignment_Practice/Andy.csv")
head(andy)

length(andy$Day)
dim(andy)

str(andy)
summary(andy)
names(andy)

andy[1, "Weight"]
andy[30, "Weight"]

#Alternatively, we could select Weight on Day 30 like this:
andy[which(andy$Day == 30), "Weight"]
andy[which(andy[,"Day"] == 30), "Weight"]

#Or, we could use the `subset()` function to do the same thing:
subset(andy$Weight, andy$Day==30)

andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]

#How much weight did Andy lose?
andy_loss <- andy_start - andy_end
andy_loss

#Let's look at everybody at once:
files <- list.files("Assignment_Practice")
files

#full.names appends the filepath, so that we can stay in our working directory 
# and call files from a deeper directory
files_full <- list.files("Assignment_Practice", full.names=TRUE) 
files_full

#This allows the data to be read in using read.csv. 
head(read.csv(files_full[3]))

#This appends David's data to Andy's under the same varables, i.e. appends row-
# wise
andy_david <- rbind(andy, read.csv(files_full[2]))

head(andy_david)
tail(andy_david)

day_25 <- andy_david[which(andy_david$Day == 25), ]
day_25

#To understand a basic for loop:
for (i in 1:5) {print(i)}

#create a loop that rbinds all datasets. First creates empty dataframe to bind
# to
dat <- data.frame()
for (i in 1:5) {
  dat <- rbind(dat, read.csv(files_full[i]))
}
str(dat)

#Now look at median, while skipping missing values. This can be done in the
# median command with na.rm. See ?median.
#Alternatively, we could subset using `complete.cases()` or `is.na()`

median(dat$Weight, na.rm=TRUE)

#This will subset the median on day 30
dat_30 <- dat[which(dat[, "Day"] == 30),]
dat_30
median(dat_30$Weight)

#This will create a function that: creates dataframe from csvs, subsets by day, calculates median
weightmedian <- function(directory, day)  {
  files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
  dat <- data.frame()                             #creates an empty data frame
  for (i in 1:5) {                                
    #loops through the files, rbinding them together 
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
  median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
  #while stripping out the NAs
}

weightmedian(directory = "Assignment_Practice", day = 20)
weightmedian("Assignment_Practice", 4)
weightmedian("Assignment_Practice", 17)
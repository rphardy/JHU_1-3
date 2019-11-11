setwd("C:/Users/Richard/dsprojects/GettingCleaningData")

if (!file.exists("Week4")){dir.create("./Week4")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile ="./Week4/sportsdata.zip")
setwd("./Week4")
unzip("sportsdata.zip")



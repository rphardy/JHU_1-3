#Assignment 2 - Part 2

setwd("C:/Users/Richard/dsprojects/RProgrammingCourse/Week2/Week2_Assignment")

dataseturl <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataseturl, destfile="rprog_data_specdata.zip")
unzip("rprog_data_specdata.zip")

complete <- function(directory, id = 1:332){
       files_list <- list.files(directory, full.names=TRUE)
       nobs <- vector()
       for (i in id){
               dat <- read.csv(files_list[i])
               nobs  <- c(nobs, sum(complete.cases(dat), na.rm=TRUE))
       }
       out <- cbind(id,nobs)
       print(out)
}
#Week 2 Assignment - Part 3

setwd("C:/Users/Richard/dsprojects/RProgrammingCourse/Week2/Week2_Assignment")

dataseturl <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataseturl, destfile="rprog_data_specdata.zip")
unzip("rprog_data_specdata.zip")

#Correct now
corr <- function(directory, threshold = 0){
  files_list <- list.files(directory, full.names=TRUE)
  corrs <- vector("numeric", length=0)
  for (i in 1:length(files_list)){
    dat <- read.csv(files_list[i])
    nobs <- sum(complete.cases(dat), na.rm=TRUE)
    if ( nobs > threshold) {
      cori <- cor(dat[,"sulfate"],dat[,"nitrate"], use = "pairwise.complete.obs")
      corrs <- c(corrs, cori)
    } else {corrs <- corrs}
  }
  print(corrs)
}

# Assignment 2 - Part 1.

setwd("C:/Users/Richard/dsprojects/RProgrammingCourse/Week2/Week2_Assignment")

dataseturl <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataseturl, destfile="rprog_data_specdata.zip")
unzip("rprog_data_specdata.zip")

list.files("specdata")
file001 <- read.csv("specdata/001.csv")

files <- list.files("specdata")
files_full <- list.files("specdata", full.names = TRUE)

head(read.csv(files_full[1]))
head(read.csv(files_full[2]))
head(read.csv(files_full[3]))

file001_file002 <- rbind(file001, read.csv(files_full[2]))

pollutant <- function(directory, id = 1:332){
  files_list <- list.files(directory, full.names=TRUE)
  dat <- data.frame()
  for (i in id){
    dat <- rbind(dat, read.csv(files_full[i]))
  }
  str(dat)
}

#test so far
pollutant("specdata", 1:3)

#now for pollutantmean
pollutantmean <- function(directory, pollutant, id = 1:332){
  files_list <- list.files(directory, full.names=TRUE)
  dat <- data.frame()
  for (i in id){
    dat <- rbind(dat, read.csv(files_full[i]))
  }
  mean(dat[, pollutant], na.rm = TRUE)
}

pollutantmean("specdata","sulfate", 1:10)
pollutantmean("specdata","nitrate", 70:72)
pollutantmean("specdata","nitrate", 23)
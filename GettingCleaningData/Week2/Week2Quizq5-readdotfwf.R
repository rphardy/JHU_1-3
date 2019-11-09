setwd("C:/Users/Richard/dsprojects/GettingCleaningData/Week2")

fileUrl <- "http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"

data <- read.fwf(fileUrl, widths = c(10,5,4,4,5,4,4,5,4,4,5,4,4), skip =4, header=FALSE)

#for (i in c(2,5,8,11)){
#  data$destring(paste("V",tostring(i),sep=""))=NULL
#}

data$V2=NULL
data$V5=NULL
data$V8=NULL
data$V11=NULL
sum(data$V6[1:1254]) #08JAN2014

rm(data)
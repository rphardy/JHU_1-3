setwd("C:/Users/Richard/dsprojects/GettingCleaningData/Week2")
rm(list=ls())

connection <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(connection)

lapply(c(htmlCode[10],htmlCode[20],htmlCode[30],htmlCode[100]),nchar)
lines <- sapply(c(htmlCode[10],htmlCode[20],htmlCode[30],htmlCode[100]),nchar)

close(connection)
rm(list=ls())
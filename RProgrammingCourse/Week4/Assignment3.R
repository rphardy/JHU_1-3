setwd("C:/Users/Richard/dsprojects/RProgrammingCourse/Week4")

## unzip("rprog_data_ProgAssignment3-data.zip", overwrite=TRUE) #Permission 
## denied. Used manual method

outcome <- read.csv("outcome-of-care-measures.csv", colClasses="character")
head(outcome)

outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])

best <- function(state, outcome){
  #reads .csv.
  #Check state and outcome are valid
  #Return hospital name in that state with lowest 30-day death rate 
}
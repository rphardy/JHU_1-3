best <- function(state,outcome){
   #reads .csv.
   oocm <- read.csv("outcome-of-care-measures.csv", colClasses="character")
   subset <- oocm[,c(2,7,11,17,23)]
   outdict <- c("heart attack" =3, "heart failure"=4, "pneumonia"=5)
   
   for (i in 3:5){
    subset[,i] <- as.numeric(subset[,i])
   }
   
   #select outcome data, order data, check validity of outcome.
   if (outcome %in% names(outdict)){
       mortdata <- na.omit(subset[,c(1,2,outdict[outcome])])
       mortsortdata <- mortdata[order(mortdata[,2],mortdata[,3], mortdata[,1]),]
       #split to state data 
       bystate <- split(mortsortdata, mortsortdata[,2])
       statedict <- c("AK" =1, "AL" =2, "AR" =3, "AZ" =4,"CA" =5, "CO" =6,
                   "CT" =7, "DC" =8, "DE" =9, "FL" =10, "GA" =11, "GU" =12, "HI" =13, "IA" =14,
                   "ID" =15, "IL" =16, "IN" =17, "KS" =18, "KY" =19,"LA" =20, "MA" =21, "MD" =22,
                   "ME" =23, "MI" =24, "MN" =25, "MO" =26, "MS" =27, "MT" =28, "NC" =29, "ND" =30,
                   "NE" =31, "NH" =32, "NJ" =33, "NM" =34, "NV" =35, "NY" =36, "OH" =37, "OK" =38, 
                   "OR" =39, "PA" =40, "PR" =41, "RI" =42, "SC" =43, "SD" =44, "TN" =45, "TX" =46,
                   "UT" =47, "VA" =48, "VI" =49, "VT" =50, "WA" =51, "WI" =52, "WV" =53, "WY" =54)
       #check validity of state, print best hospital
       if (state %in% names(statedict)){
           selected <- bystate[statedict[state]]
           print(selected[[1]][[1]][[1]])
       }
       else { stop("invalid state") }
   }
   else { stop("invalid outcome") }
}
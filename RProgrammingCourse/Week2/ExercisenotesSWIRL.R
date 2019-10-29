## Random Walk Loop

z <- 5

while(z >= 3 && z <= 10){
  print(z)
  coin <- rbinom(1,1,0.5)
  
  if(coin == 1){ ## random walk
          z <- z + 1
  }else {
    z <- z - 1
  }
}

# which(), any(), all() functions <- take logical vectors as their arguments
ints <- sample(10) #random sample of 10 without replacement, returns vector of 1-10 in random order
which(ints >= 2) #which are greater thanor equal to 2. returns vector of INDEX where x>=2 gives TRUE
any(ints < 0) #are any of the 10 negative numbers?
all(ints>0) # are all greater than 0?

#functions: functions within functions

evaluate <- function(func, dat){
       func(dat)
} #this takes a function: func as an argument, and some data, dat, and performs
  #the function on the data.

evaluate(function(x){x[1]},c(8,4,0)) #this defines a function and passes as the
                                     #it as the func argument. This function
                                     #returns the first index of the vector.



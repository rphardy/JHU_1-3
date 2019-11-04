## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  matrixinv <- NULL
  set <- function(y) {
    x <<- y
    matrixinv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) matrixinv <<- inverse
  getinverse <- function() matrixinv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  matrixinv <- x$getinverse()
  if(!is.null(matrixinv)) {
    message("getting cached data")
    return(matrixinv)
  }
  data <- x$get()
  matrixinv <- solve(data, ...)
  x$setinverse(matrixinv)
  matrixinv
}

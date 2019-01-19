

## x<- rbind(c(1,2), c(3,4))
## m<- makeCacheMatrix(x)
## cacheSolve(m)
## function to create a matrix to cache it's inverse

makeCacheMatrix <- function(x=matrix()){
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function(){
    x
  }
  setinverse <- function(inverse){
    i <<- inverse
  }
  getinverse <- function(){
    i
  }
  list(set= set, get= get, setinverse= setinverse, getinverse= getinverse)
}
## to calculate the inverse of the function , 
## if the inverse is already calculated, it it taken from cache
## otherwise the inverse is calculated and shown

cacheSolve <- function(x){
  i <- x$getinverse()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i<- solve(data)
  x$setinverse(i)
  i
}

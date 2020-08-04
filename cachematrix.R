## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL      #we want the default value of inverse to be NULL
  set<-function(y){
    x<<-y
    m<<-NULL      #Once we set another matrix it can override the orginal matrix
  }
  get<-function(){
    x
  }
  setinverse<-function(inverse){
    m<<-inverse
  }
  getinverse<-function(){
    m
  }
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}



cacheSolve <- function(x, ...) {
  m<-x$getinverse()
  if (! is.null(m)){ #check if the matrix int the getINv() is not NULL
    print("getting cached matrix inversion")
    m
  }
  data<-x$get()
  m<-solve(data)
  x$setinverse(m,...)#cache the inverse matrix 
  m 
  ## Return a matrix that is the inverse of 'x'
}
## Put comments here that give an overall description of what your
## functions do

## Assignment: Caching the Inverse of a Matrix

## Matrix inversion is usually a costly computation and there 
## may be some benefit to caching the inverse of a matrix to memory rather 
## than compute it repeatedly.
## The assignment is to write a pair of functions that cache the 
## inverse of a matrix.

## Write the following functions: makeCacheMatrix, cacheSolve
  

## Write some comments describing makeCacheMatrix, cacheSolve

## makeCacheMatrix : 
## This function creates a special "matrix" object with cacheable inverse 
## of said matrix

makeCacheMatrix <- function(X = matrix()) 
## makeCacheMatrix will be used to set up a square matrix with custom 
## parameters
{
  
  inverse <- NULL
  
## Sets value of object "inverse" to NULL if cacheSolve hasn't been run
  
  set <- function(Y){
    X <<- Y 
##  caches matrix for cacheSolve to check against for change

    inverse <<- NULL
##  sets the value of inverse from cacheSolve to NULL
  }
  
get <- function() X

setInverse <- function(Inverse) inverse <<- Inverse

getInverse <- function() inverse

list(set = get, get = get, setInverse = setInverse, getInverse = getInverse)

## List for functions

}


## cacheSolve:

## This function computes the inverse of the "matrix" 
## produced via makeCacheMatrix above. This gets the user by the default
## "NULL" result when trying to use $getInverse by computing inverse of 
## the inputted matrix. After this, $getInverse will function properly.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cacheSolve should retrieve the inverse from the cache.



cacheSolve <- function(X, ...) {
inverse <- X$getInverse() 
## Draws inverse from cache if it has been calculated w/ cacheSolve

if(!is.null(inverse)) {
  
## Determine if cacheSolve has already been run, if so, displays message
## and draws matrix from cache
  message("Fetching cached matrix!")
  
  return(inverse)
}

  custmatr <- X$get()
## custmatr = "Custom Matrix" 
  
  
  inverse <- solve(custmatr, ...)
## This will compute the inverse of the user's custom matrix
  X$setInverse(inverse)
## run the setinverse function on the inverse to cache the inverse
  inverse
## returns inverse
}





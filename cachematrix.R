## Put comments here that give an overall description of what your
## functions do


##This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {

}



##This function computes the inverse of the special "matrix"
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}




m <-matrix(rnorm(100), 10, 10)
m
mi<-solve(m)
mi

(m<-matrix(rnorm(4), 2, 2))
solve(m)
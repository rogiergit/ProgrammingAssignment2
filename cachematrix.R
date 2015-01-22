## Put comments here that give an overall description of what your
## functions do


# This function creates a matrix object that can cache its inverse.
makeCacheMatrix <- function(m = matrix() ){
        
        #m contains the matrix
        
        # Variable for the inverse matrix of m which we set at NULL as default
        mi <- NULL 
        
        # variable for the cached matrix from a previous call to the reverse function
        mp <- NULL
        
        print(environment())
        evn <- environment()
        print(parent.env(evn))
        
        # function to set the matrix m
        set <- function(y) {
                # assign a value to an object in an environment that is different from the current environment
                # set y as the matrix m
                m <<- y
        }
        
        # function to get the matrix from m
        get <- function() m
        
        # function to cache the matrix m that was send in a previous call to the inverse function cacheSolve
        # store it in variable mp (p for previous)
        set_m_previous <- function(m_previous) mp <<- m_previous 
        
        # get the matrix from a previous call
        get_m_previous <- function() mp
        
        # store the inverse matrix mi in m
        setinverse <- function(inverse) mi <<- inverse
        
        # get the inverse matrix m
        getinverse <- function() mi
        
        # create an object (list) for matrix m with all functions
        list(set = set, get = get, setinverse = setinverse, 
             getinverse = getinverse, set_m_previous=set_m_previous, 
             get_m_previous=get_m_previous)
}

# This function computes the inverse of the matrix
cacheSolve <- function (m, ... ) {
        
        # get the cached inverse matrix for m if there is one
        mi <- m$getinverse()
        
        # get the cached matrix from a previous call if there is one
        mp <- m$get_m_previous()

        # get the matrix that we have to inverse
        data<-m$get()
        
        # Check if there the cached inverse matrix is not empty
        # And check if the received matrix did not change
        # since the last call for the inverse
        if(length(mi)>0 && data ==  mp) {
                message("input matrix did not change, getting cached data")
                return(mi)
        }
        
        #inverse the matrix and cache it
        mi<- solve(data,...)
        m$setinverse(mi)
        
        m$set_m_previous(data) #store the matrix that was used to get the inverse
        
        #output the inverse matrix
        mi
}

#CHECK TO SEE IF IT's WORKING

# Create a matrix
a<-matrix(1:4,2,2)
a

# Create the cached matrix mat using a
mat<-makeCacheMatrix(a)
# Show the stored matrix
mat$get()
# Invert the matrix using the solve function
cacheSolve(mat)

# Run it again to see it is getting the caches result
cacheSolve(mat)

# Create a different matrix
b<-matrix(2:5, 2,2)
b
# Store the new matrix in mat
mat$set(b)
# Check to see it is stored
mat$get()

# Run the Solve function to get the inverse, the matrix has changes to it will re-calculate
cacheSolve(mat)

# Run Solve again to see that it is getting the cached result
cacheSolve(mat)

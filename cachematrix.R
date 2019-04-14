## Put comments here that give an overall description of what your
## functions do

## makes a cacheamtrix with getters and setters

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y){
        x <<-y # Set x as matrix y
        inv <<- NULL  # This clears any cached data!
    }
    get <- function() x  # no need curly cause fuck r
    setinv <- function(inverse_mat) inv <<- inverse_mat
    getinv <- function() inv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## checks the cache matrix object for existene of inv
# if none exist then calculates inverse with solve()

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if(!is.null(inv)){
        message('getting cached data')
        return(inv)
    }
    data_mat <- x$get()
    inv <- solve(data_mat)
    x$setinv(inv)
    inv
}


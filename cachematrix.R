## Calculate inverted matrix with caching

## Create object containing original and inverted matrixes
makeCacheMatrix <- function(orig = matrix()) {
  inv <- NULL
  set <- function(y) {
    orig <<- y
    inv <<- NULL
  }
  get <- function() orig
  setinv <- function(i) inv <<- i
  getinv <- function() inv

  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

## Calculate inverted matrix if needed. Return it.
cacheSolve <- function(x, ...) {
  if (is.null(x$getinv()))
    x$setinv(solve(x$get()))

  x$getinv()
}

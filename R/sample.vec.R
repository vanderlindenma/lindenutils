#' Samples n elements from vector x even if x is size 1 (https://stackoverflow.com/questions/13990125/sample-from-vector-of-varying-length-including-1)
#' @name sample.vec
#' @usage sample.vec(x,n)
#' @param x vector to sample from
#' @param size a non-negative integer giving the number of items to choose.
#' @param replace	should sampling be with replacement? (default=FALSE)
#' @param prob a vector of probability weights for obtaining the elements of the vector being sampled.
#' @param useHash	logical indicating if the hash-version of the algorithm should be used. Can only be used for replace = FALSE, prob = NULL, and size <= n/2, and really should be used for large n, as useHash=FALSE will use memory proportional to n.
#' @export
sample.vec <- function(x, ...) x[sample(length(x), ...)]


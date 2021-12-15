#' Element-wise mean of two vectors a and b
#' @description Element-wise mean of two vectors a and b (https://stackoverflow.com/questions/13990125/sample-from-vector-of-varying-length-including-1)
#' @name pw_mean
#' @usage pw_mean(a,b, na.rm = TRUE)
#' @param a,b two vectors
#' @param na.rm logical indicating whether \code{NA} values should be ignored when computing means
#' @export
pw_mean <- function(a,b, na.rm = F){rowMeans(cbind(a, b), na.rm = na.rm)}

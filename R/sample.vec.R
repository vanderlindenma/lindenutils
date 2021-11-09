# https://stackoverflow.com/questions/13990125/sample-from-vector-of-varying-length-including-1
# QQQQ: https://stackoverflow.com/questions/13990125/sample-from-vector-of-varying-length-including-1
#
# I have a vector with varying length, which can sometimes be of length 1.
#
# I would like to sample from this vector such that if its length is 1 it always samples that 1 number.
#
# sample() won't do this because it samples from 1 to the digit when sample size is 1.
#
# AAAA
# This is a documented feature:
#
#     If x has length 1, is numeric (in the sense of is.numeric) and x >= 1, sampling via sample takes place from 1:x. Note that this convenience feature may lead to undesired behaviour when x is of varying length in calls such as sample(x).
#
# An alternative is to write your own function to avoid the feature:
#
# sample.vec <- function(x, ...) x[sample(length(x), ...)]
# sample.vec(10)
# # [1] 10
# sample.vec(10, 3, replace = TRUE)
# # [1] 10 10 10
#
# Some functions with similar behavior are listed under seq vs seq_along. When will using seq cause unintended results?

sample.vec <- function(x, ...) x[sample(length(x), ...)]

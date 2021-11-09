# https://stackoverflow.com/questions/24845909/generate-n-random-integers-that-sum-to-m-in-r
# QQQQ: Generate N random integers that sum to M in R
# I would like to generate N random positive integers that sum to M. I would like the random positive integers to be selected around a fairly normal distribution whose mean is M/N, with a small standard deviation (is it possible to set this as a constraint?).
#
# Finally, how would you generalize the answer to generate N random positive numbers (not just integers)?
#
#   I found other relevant questions, but couldn't determine how to apply their answers to this context: https://stats.stackexchange.com/questions/59096/generate-three-random-numbers-that-sum-to-1-in-r
#
# Generate 3 random number that sum to 1 in R
#
# R - random approximate normal distribution of integers with predefined total
# AAAA
# Normalize.
#
# rand_vect <- function(N, M, sd = 1, pos.only = TRUE) {
#   vec <- rnorm(N, M/N, sd)
#   if (abs(sum(vec)) < 0.01) vec <- vec + 1
#   vec <- round(vec / sum(vec) * M)
#   deviation <- M - sum(vec)
#   for (. in seq_len(abs(deviation))) {
#     vec[i] <- vec[i <- sample(N, 1)] + sign(deviation)
#   }
#   if (pos.only) while (any(vec < 0)) {
#     negs <- vec < 0
#     pos  <- vec > 0
#     vec[negs][i] <- vec[negs][i <- sample(sum(negs), 1)] + 1
#     vec[pos][i]  <- vec[pos ][i <- sample(sum(pos ), 1)] - 1
#   }
#   vec
# }
#
# For a continuous version, simply use:
#
# rand_vect_cont <- function(N, M, sd = 1) {
#   vec <- rnorm(N, M/N, sd)
#   vec / sum(vec) * M
# }
#
# Examples
#
# rand_vect(3, 50)
# # [1] 17 16 17
#
# rand_vect(10, 10, pos.only = FALSE)
# # [1]  0  2  3  2  0  0 -1  2  1  1
#
# rand_vect(10, 5, pos.only = TRUE)
# # [1] 0 0 0 0 2 0 0 1 2 0
#
# rand_vect_cont(3, 10)
# # [1] 2.832636 3.722558 3.444806
#
# rand_vect(10, -1, pos.only = FALSE)
# # [1] -1 -1  1 -2  2  1  1  0 -1 -1


rand_vect <- function(N, M, sd = 1, pos.only = TRUE) {
  vec <- rnorm(N, M/N, sd)
  if (abs(sum(vec)) < 0.01) vec <- vec + 1
  vec <- round(vec / sum(vec) * M)
  deviation <- M - sum(vec)
  for (. in seq_len(abs(deviation))) {
    vec[i] <- vec[i <- sample(N, 1)] + sign(deviation)
  }
  if (pos.only) while (any(vec < 0)) {
    negs <- vec < 0
    pos  <- vec > 0
    vec[negs][i] <- vec[negs][i <- sample(sum(negs), 1)] + 1
    vec[pos][i]  <- vec[pos ][i <- sample(sum(pos ), 1)] - 1
  }
  return(vec)
}

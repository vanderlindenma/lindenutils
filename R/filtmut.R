#' Exclusively mutate rows to which filter applies
#'
#' @description Mutate rows of \code{df} for which string \code{filt} applies, with mutation described by string \code{mutation} (https://stackoverflow.com/questions/69922602/using-mutate-in-custom-function-with-mutation-condition-as-argument/69923793#69923793)
#' @name filtmut
#' @param df A dataframe
#' @param filt A string describing the filter condition
#' @param mut A string describing the mutation to perform on rows to which the filter condition applies
#' @return A dataframe where mutate \code{mut} has been applied exclusively to rows for which \code{filt} applies
#' @examples filtmut(mtcars, "cyl == 6", "mpg = 20*mpg")
#'            mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#' Mazda RX4           420.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
#' Mazda RX4 Wag       420.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
#' Hornet 4 Drive      428.0   6 258.0 110 3.08 3.215 19.44  1  0    3    1
#' Valiant             362.0   6 225.0 105 2.76 3.460 20.22  1  0    3    1
#' Merc 280            384.0   6 167.6 123 3.92 3.440 18.30  1  0    4    4
#' Merc 280C           356.0   6 167.6 123 3.92 3.440 18.90  1  0    4    4
#' Ferrari Dino        394.0   6 145.0 175 3.62 2.770 15.50  0  1    5    6
#' Datsun 710           22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
#' Hornet Sportabout    18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
#' Duster 360           14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
#' ...
#' @usage filtmut(df, filt, mut)
#' @export
filtmut <- function(df,
                        filt,
                        mut){

  xx <- word(mut, 1)

  sub <- df %>%
    filter(eval(parse(text = filt))) %>%
    mutate("{xx}" := eval(parse(text = mut)))

  remain <- df %>%
    filter(eval(parse(
                text = paste0("!(",filt,")")
                ))
           )

  return(rbind(sub, remain))
}







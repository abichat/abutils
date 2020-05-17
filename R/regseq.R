#' Create regular sequence of fixed length
#'
#' @param seq The sequence to complete.
#' @param fill The padding character.
#' @param prefix Prefix string.
#' @param suffix Suffix string..
#'
#' @return A sequence of
#' @export
#'
#' @importFrom stringr str_length str_pad
#'
#' @examples
#' create_reg_seq(c(8:12, 98:102), prefix = "file", suffix = ".txt")
create_reg_seq <- function(seq, fill = "0", prefix = "", suffix = "") {
  nmax <- max(str_length(seq))
  seq <- str_pad(seq, width = nmax, pad = fill)
  paste0(prefix, seq, suffix)
}

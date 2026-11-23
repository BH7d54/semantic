#' semantic: calculates sentiment ratio
#'
#' @description
#' The semantic package identifies positive and negative words
#' in a text using predefined word lists. It calculates the
#' number of positive and negative words and their ratio. The text is classified
#' as positive if the ratio > 0.5,negative if the ratio < 0.5, and neutral if
#' the ratio = 0.5.
#'
#' @details
#' The package includes 3 main functions:
#' - `preprocess()`:  Converts a text file into words.
#' - `compare()`: Compares words from the text file with sentiment words from
#' predefined dictionaries
#' - `sentiment_ratio()`: Calculates the sentiment ratio, based on n of positive
#'  words / total n
#'
#' @section Example of positive and negative dictionaries:
#' @examples
#' sentiment_ratio("bran.txt")
#'
#' positive_words <- c(
#'   "happy", "joy", "love", "good", "great",
#'   "excellent", "wonderful", "amazing", "enjoy",
#'   "satisf*", "excit*", "hope*", "summer"
#' )
#'
#' negative_words <- c(
#'   "sad", "bad", "terrible", "hate", "awful",
#'   "angry", "disappoint*", "depress*", "nause*",
#'   "pain*", "stress*", "worr*", "cold", "nerv*"
#' )
#' @docType package
#' @name semantic
NULL

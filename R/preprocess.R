
#' Preprocess text
#'
#' Reads a text file, converts all text to lowercase,
#' removes punctuation and separates the text into words.
#'
#' @param file Path to the text file.
#'
#' @return A character vector containing individual words.
#'
#' @examples
#' # words <- preprocess("bran.txt")
#'
#' @export

preprocess <- function(file) {

  # Read the text file
  novel <- read.delim(
    file = file,
    header = FALSE,
    stringsAsFactors = FALSE
  )

  # Convert the data frame into a character vector
  text <- unlist(novel, use.names = FALSE)

  # Remove missing values
  text <- text[!is.na(text)]

  # Convert all letters to lowercase
  text <- tolower(text)

  # Remove punctuation
  text <- gsub("[[:punct:]]", " ", text)

  # Split the text into individual words
  words <- unlist(strsplit(text, "\\s+"))

  # Remove empty elements
  words <- words[words != ""]

  # Return the words
  return(words)
}

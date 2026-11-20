
#' Compare novel words with sentiment words
#'
#' Identifies positive or negative words in a text.
#' An asterisk can be used as a wildcard:
#' at the end for a prefix match, or at the
#' beginning for a suffix match.
#'
#' @param text_words Character vector containing diary words.
#' @param sentiment_words Character vector containing
#' sentiment words, optionally with asterisks.
#'
#' @return A character vector of matching novel words.
#'
#' @examples
#' compare(
#'   c("happy", "happiness", "sad"),
#'   c("happ*", "sad")
#' )
#'
#' @export

compare <- function(text_words, sentiment_words) {

  # Create an empty vector for the matches
  matches <- character()

  # Loop through every word in the diary
  for (word in text_words) {

    # Check every sentiment word
    for (pattern in sentiment_words) {

      # Check if the pattern ends with *
      if (endsWith(pattern, "*")) {

        # Remove the asterisk
        prefix <- substr(
          pattern, 1, nchar(pattern) - 1
        )

        # Check if the diary word starts with the prefix
        if (startsWith(word, prefix)) {
          matches <- c(matches, word)
          break
        }

        # Check if the pattern starts with *
      } else if (startsWith(pattern, "*")) {

        # Remove the asterisk
        suffix <- substr(
          pattern, 2, nchar(pattern)
        )

        # Check if the diary word ends with the suffix
        if (endsWith(word, suffix)) {
          matches <- c(matches, word)
          break
        }

        # Otherwise, compare exact words
      } else {

        if (word == pattern) {
          matches <- c(matches, word)
          break
        }
      }
    }
  }

  return(matches)
}

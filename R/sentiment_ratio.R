
#' Calculate the sentiment ratio of a diary
#'
#' Reads and preprocesses a diary, identifies positive
#' and negative words, and calculates a sentiment ratio.
#'
#' @param file Path to the novel text file.
#'
#' @return A data frame containing the number of positive
#' words, negative words, sentiment ratio and classification
#'
#' @examples
#' sentiment_ratio("bran.txt")
#'
#' @export

sentiment_ratio <- function(file) {

  # Step 1: Preprocess the diary
  words <- preprocess(file)

  # Step 2: Identify positive words
  positive_matches <- compare(
    words,
    positive_words
  )

  # Step 3: Identify negative words
  negative_matches <- compare(
    words,
    negative_words
  )

  # Step 4: Count positive and negative words
  positive_count <- length(positive_matches)
  negative_count <- length(negative_matches)

  # Step 5: Calculate sentiment ratio
  total_matches <- positive_count + negative_count

  if (total_matches == 0) {
    ratio <- NA_real_
  } else {
    ratio <- positive_count / total_matches
  }

  if (is.na(ratio)) {
    classification <- "Neutral"
  } else if (ratio > 0.5) {
    classification <- "Positive"
  } else if (ratio < 0.5) {
    classification <- "Negative"
  } else {
    classification <- "Neutral"
  }

  results <- data.frame(
    positive_words = positive_count,
    negative_words = negative_count,
    sentiment_ratio = ratio,
    classification = classification
  )

  return(results)
}

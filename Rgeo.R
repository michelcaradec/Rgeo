load("./data/codepostal.RData")


#' Détermine la longitude/latitude en fonction d'un code postal.
#'
#' @param codepostal code postal
#' @param strict géolocalisation stricte du code postal
#' @return data frame avec les colonnes longitude et latitude.
#' @examples
#' source("../../Rgeo/Rgeo.R", chdir = T)
#' get_coordinates("35000")
#' get_coordinates(c("22000", "29000", "35000", "56000"))
get_coordinates <- function(codepostal, strict = T) {
  df <- .codepostal[match(codepostal, .codepostal$code_postal), c("longitude", "latitude")]
  
  if (!strict) {
    # Tentative avec code postal "<dept>000"
    failed <- which(is.na(df$longitude))
    if (length(failed) > 0) {
      cp_base <- paste0(substr(codepostal[failed], 1, 2), "000")
      df[failed, c("longitude", "latitude")] <- get_coordinates(cp_base, strict = T)
    }
  }
  
  return(df)
}


demo <- function() {
  sample <- data.frame(
    cp = c("22000", "29000", "35000", "35999", "56000", "56999")
  )
  
  sample[, c("longitude", "latitude")] <- get_coordinates(sample$cp)
  sample[, c("longitude", "latitude")] <- get_coordinates(sample$cp, strict = F)
}

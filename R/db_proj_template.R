
#' Constructor for S3 Class 'db_proj_template'
#'
#' @return S3Class 
#' @export
#'
#' @examples
#' new_db_proj_template()
new_db_proj_template <- function() {
  
  rs <- list(
    data = new.env(), 
    meta = list()
  )
  
  class(rs) <- c(setdiff('db_proj_template', class(rs)), class(rs))
  
  return(rs)
  
}

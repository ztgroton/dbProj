
#' Constructor for S3 Class 'db_proj_template'
#' 
#' @return S3Class 
#' @export
#'
#' @examples
#' \dontrun{
#' new_db_proj_template()
#' }
new_db_proj_template <- function() {
  
  # Initialize Empty S3 Object
  rs <- list(
    data = new.env(), 
    meta = new.env()
  )
  
  # Set Class
  class(rs) <- c(setdiff('db_proj_template', class(rs)), class(rs))
  
  # Return S3 Object
  return(rs)
  
} 


#' Validate that S3 Object is Properly Formatted
#'
#' @param obj S3 Object - R Object to be validated against desired format
#' @param bool TRUE/FALSE - Optionally specify if input 'obj' or logical TRUE/FALSE
#'
#' @return R Object
#' @export
#'
#' @examples
#' \dontrun{
#' validate_db_proj_template(obj, TRUE)
#' validate_db_proj_template(obj, FALSE)
#' }
validate_db_proj_template <- function(obj, bool) {
  
  # Validate Inputs
  if (missing(obj)) {stop("`obj` is missing in call to `validate_db_proj_template`")}
  if (missing(bool)) {bool <- FALSE} 
  
  # Initialize Empty Character Vector for Error Messages
  err <- vector(mode = 'character')
  
  # Validate Input Expectations
  
  # * `obj`
  if (!isTRUE(inherits(obj, 'db_proj_template'))) {
    msg <- "`obj` must inherit from 'db_proj_template'"
    err <- c(msg, err)
  }
  
  # * `bool` 
  if (!isTRUE(identical(bool, TRUE)) && !isTRUE(identical(bool, FALSE))) {
    msg <- "`bool` must be identical with TRUE/FALSE"
    err <- c(msg, err)
  }
  
  # Conditionally Return Error Messages (if any at this point in execution)
  if (!isTRUE(length(err) == 0)) {return(err)}
  
  # ADD CUSTOM INPUT VALIDATIONS HERE (USE SAME TEMPLATE AS `obj` and `bool`)
  
  # Final Output
  if (!isTRUE(bool)) {
      
      if (!isTRUE(length(err) == 0)) {
          return(obj)
      } else {
          return(err)
      }
      
  } else {
      
      if (!isTRUE(length(err) == 0)) {
          return(TRUE)
      } else {
          return(FALSE)
      }
      
  }
  
} 


#' S3 Class Helper Function for 'db_proj_template'
#'
#' @return S3 Object
#' @export
#'
#' @examples
#' \dontrun{
#' db_proj_template()
#' }
db_proj_template <- function() {
  
  # Initialize Blank Template
  temp <- new_db_proj_template()
  
  # Setup Template Internal Data
  setup_db_proj_template(temp)
  
  # Validate Template
  validate_db_proj_template(temp)
  
}

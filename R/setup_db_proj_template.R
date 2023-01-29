
#' Initialize Metadata for S3 Object of class 'db_proj_template'
#'
#' @param obj S3 Object
#' @param type character
#'
#' @return NULL
#'
#' @examples
#' \dontrun{
#' setup_db_proj_metadata(template, 'mssql')
#' }
setup_db_proj_metadata <- function(obj, type) {
  
  # Validate Inputs
  if (missing(obj)) {stop("`obj` is missing in call to `setup_db_proj_metadata`")}
  if (missing(type)) {stop("`type` is missing in call to `setup_db_proj_metadata`")} 
  
  # Validate Input Expectations 
  
  # * `obj`
  if (!isTRUE(inherits(obj, 'db_proj_template'))) {
    stop("`obj` must inherit from 'db_proj_template' in call to `setup_db_proj_metadata`")
  }
  
  # * `type`
  if (!isTRUE(is.character(type)) || !isTRUE(length(type) == 1)) {
    stop("`type` must be a scalar character in call to `setup_db_proj_metadata`")
  }
  
}

#' Initialize Data for S3 Object of class 'db_proj_template'
#'
#' @param obj S3 Object
#' @param type character
#'
#' @return NULL
#'
#' @examples
#' \dontrun{
#' setup_db_proj_data(template, 'mssql')
#' }
setup_db_proj_data <- function(obj, type) {
  
  # Validate Inputs
  if (missing(obj)) {stop("`obj` is missing in call to `setup_db_proj_data`")}
  if (missing(type)) {stop("`type` is missing in call to `setup_db_proj_data`")} 
  
  # Validate Input Expectations 
  
  # * `obj`
  if (!isTRUE(inherits(obj, 'db_proj_template'))) {
    stop("`obj` must inherit from 'db_proj_template' in call to `setup_db_proj_data`")
  }
  
  # * `type`
  if (!isTRUE(is.character(type)) || !isTRUE(length(type) == 1)) {
    stop("`type` must be a scalar character in call to `setup_db_proj_data`")
  }
  
}

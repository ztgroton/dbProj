
#' Setup Internal Data for S3 Object of class 'db_proj_template'
#'
#' @param obj S3 Object
#'
#' @return R Object
#'
#' @examples
#' \dontrun{
#' setup_db_proj_template(template)
#' }
setup_db_proj_template <- function(obj) {
  
  # Validate Inputs 
  if (missing(obj)) {stop("`obj` is missing in call to `setup_db_proj_template`")}
  
  # Validate Input Expectations 
  
  # * `obj`
  if (!isTRUE(inherits(obj, 'db_proj_template'))) {
    stop("`obj` must inherit from 'db_proj_template' in call to `setup_db_proj_template`")
  }
  
  # Initialize 'dm_template'
  dm_template <- dm::dm(db_proj_tables$tbl_def)
  
  return(dm_template)
  
}

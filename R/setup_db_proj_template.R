
#' Setup Internal Data for S3 Object of class 'db_proj_template'
#'
#' @param obj S3 Object
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
  
  # Initialize 'dm_template' with table data
  dm_template <- do.call(what = dm::dm, args = db_proj_tables$tbl_def)
  
  # Add Primary Key Constraints to 'dm_template'
  pk_glue <- "dm_template <- dm::dm_add_pk(dm = dm_template, table = {tbl}, columns = c({col}))"
  
  for (x in db_proj_tables$primary_keys) {
    x_expr <- glue::glue(
      pk_glue, 
      tbl = x$tbl, 
      col = paste0(x$column, collapse = ',')
    )
    eval(parse(text = x_expr))
  }
  
  # Add Foreign Key Constraints to 'dm_template'
  fk_glue <- "dm_template <- dm::dm_add_fk(dm = dm_template, table = {c_tbl}, columns = c({c_col}), ref_table = {p_tbl}, ref_columns = c({p_col}))"
  
  for (x in db_proj_tables$foreign_keys) {
    x_expr <- glue::glue(
      fk_glue, 
      c_tbl = x$child_tbl, 
      c_col = paste0(x$child_column, collapse = ','), 
      p_tbl = x$parent_tbl, 
      p_col = paste0(x$parent_column, collapse = ',')
    )
    eval(parse(text = x_expr))
  }
  
  # Insert 'dm_template' into 'obj$meta' environment
  obj$meta$dm <- dm_template
  
}

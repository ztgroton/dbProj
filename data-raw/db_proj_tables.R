## code to prepare `db_proj_tables` dataset goes here

# * conn_type
conn_type <- data.frame(
  id = vector('integer'), 
  name = vector('character'), 
  stringsAsFactors = FALSE
)

# * field_type 
field_type <- data.frame(
  id = vector('integer'), 
  name = vector('character'), 
  stringsAsFactors = FALSE
)

# * default_type_map 
default_type_map <- data.frame(
  conn_type_id = vector('integer'), 
  field_type_id = vector('integer'), 
  sql_type = vector('character'), 
  r_order = vector('integer'), 
  stringsAsFactors = FALSE
)

# * conn 
conn <- data.frame(
  id = vector('integer'), 
  conn_type_id = vector('integer'), 
  name = vector('character'), 
  stringsAsFactors = FALSE
)

# * conn_param 
conn_param <- data.frame(
  conn_id = vector('integer'), 
  param = vector('character'), 
  value = vector('character'), 
  stringsAsFactors = FALSE
)

# * sch 
sch <- data.frame(
  id = vector('integer'), 
  conn_id = vector('integer'), 
  name = vector('character'), 
  stringsAsFactors = FALSE
)

# * tab 
tab <- data.frame(
  id = vector('integer'), 
  sch_id = vector('integer'), 
  name = vector('character'), 
  is_qry = vector('logical'), 
  def = vector('character'), 
  pk_name = vector('character'), 
  stringsAsFactors = FALSE
)

# * tab_col 
tab_col <- data.frame(
  tab_id = vector('integer'), 
  col_id = vector('integer'), 
  name = vector('character'), 
  stringsAsFactors = FALSE
)

# * pk_col 
pk_col <- data.frame(
  id = vector('integer'), 
  tab_id = vector('integer'), 
  col_id = vector('integer'), 
  stringsAsFactors = FALSE
)

# * fk 
fk <- data.frame(
  id = vector('integer'), 
  tab_id = vector('integer'), 
  name = vector('character'), 
  stringsAsFactors = FALSE
)

# * fk_col 
fk_col <- data.frame(
  parent_tab_id = vector('integer'), 
  parent_col_id = vector('integer'), 
  child_tab_id = vector('integer'), 
  child_col_id = vector('integer'), 
  fk_id = vector('integer'), 
  stringsAsFactors = FALSE
)

# Define Primary Keys for Tables
primary_keys <- list(
  list(tbl = 'conn_type', column = c('id')), 
  list(tbl = 'field_type', column = c('id')), 
  list(tbl = 'default_type_map', column = c('conn_type_id', 'field_type_id', 'r_order')), 
  list(tbl = 'conn', column = c('id')), 
  list(tbl = 'conn_param', column = c('conn_id', 'param')), 
  list(tbl = 'sch', column = c('id')), 
  list(tbl = 'tab', column = c('id')), 
  list(tbl = 'tab_col', column = c('tab_id', 'col_id')), 
  list(tbl = 'pk_col', column = c('id')), 
  list(tbl = 'fk', column = c('id')), 
  list(tbl = 'fk_col', column = c('parent_tab_id', 'parent_col_id', 'child_tab_id', 'child_col_id'))
)

# Define Foreign Keys between Tables
foreign_keys <- list(
  
  list(child_tbl = 'default_type_map', child_column = 'conn_type_id', parent_tbl = 'conn_type', parent_column = 'id'), 
  list(child_tbl = 'default_type_map', child_column = 'field_type_id', parent_tbl = 'field_type', parent_column = 'id'), 
  
  list(child_tbl = 'conn', child_column = 'conn_type_id', parent_tbl = 'conn_type', parent_column = 'id'),
  
  list(child_tbl = 'conn_param', child_column = 'conn_id', parent_tbl = 'conn', parent_column = 'id'),
  
  list(child_tbl = 'sch', child_column = 'conn_id', parent_tbl = 'conn', parent_column = 'id'),
  
  list(child_tbl = 'tab', child_column = 'sch_id', parent_tbl = 'sch', parent_column = 'id'),
  
  list(child_tbl = 'tab_col', child_column = 'tab_id', parent_tbl = 'tab', parent_column = 'id'),
  
  list(child_tbl = 'pk_col', child_column = c('tab_id', 'col_id'), parent_tbl = 'tab_col', parent_column = c('tab_id', 'col_id')),
  
  list(child_tbl = 'fk', child_column = 'tab_id', parent_tbl = 'tab', parent_column = 'id'),
  
  list(child_tbl = 'fk_col', child_column = c('parent_tab_id', 'parent_col_id'), parent_tbl = 'tab_col', parent_column = c('tab_id', 'col_id')),
  list(child_tbl = 'fk_col', child_column = c('child_tab_id', 'child_col_id'), parent_tbl = 'tab_col', parent_column = c('tab_id', 'col_id')),
  list(child_tbl = 'fk_col', child_column = c('fk_id', 'parent_tab_id'), parent_tbl = 'fk', parent_column = c('id', 'tab_id'))
  
)

# Define Table Constraints 
constraints <- list(
  
  list(tbl = 'conn_type', type = 'COL_UNIQUE', column = c('name')), 
  
  list(tbl = 'field_type', type = 'COL_UNIQUE', column = c('name')), 
  
  list(tbl = 'default_type_map', type = 'COL_CHECK', column = 'conn_type_id', condition = 'conn_type_id > 0'), 
  list(tbl = 'default_type_map', type = 'COL_CHECK', column = 'field_type_id', condition = 'field_type_id > 0'), 
  list(tbl = 'default_type_map', type = 'COL_CHECK', column = 'r_order', condition = 'r_order > 0'), 
  
  list(tbl = 'conn', type = 'COL_UNIQUE', column = 'name'), 
  
  list(tbl = 'pk_col', type = 'COL_UNIQUE', column = c('tab_id', 'col_id')), 
  
  list(tbl = 'fk', type = 'COL_UNIQUE', column = c('id', 'tab_id')),
  list(tbl = 'fk', type = 'COL_UNIQUE', column = c('tab_id', 'name'))
  
)


# Bind Tables into list 'db_proj_tables' 
db_proj_tables <- list(
  tbl_def = list(
    conn_type = conn_type, 
    field_type = field_type, 
    default_type_map = default_type_map, 
    conn = conn, 
    conn_param = conn_param, 
    sch = sch, 
    tab = tab, 
    tab_col = tab_col, 
    pk_col = pk_col, 
    fk = fk, 
    fk_col = fk_col
  ), 
  primary_keys = primary_keys, 
  foreign_keys = foreign_keys, 
  constraints = constraints
)

# Generate Internal Dataset
usethis::use_data(db_proj_tables, internal = TRUE)

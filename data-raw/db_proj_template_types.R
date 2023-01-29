## code to prepare `db_proj_template_types` dataset goes here

db_proj_template_types <- c('mssql', 'psql', 'gsql')

usethis::use_data(db_proj_template_types, overwrite = TRUE)

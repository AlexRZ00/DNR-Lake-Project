# Define location of functions
functions_dir <- file.path(dirname(file.path(app_dir)), "Functions")

# Load in function scripts
function_scripts <- list.files(functions_dir, full.names = TRUE)

# Source all of the function scripts
lapply(X = function_scripts, FUN = source)

# Load in data
alllakes_data <- fread(file.path(data_dir,"950_hab.csv"))
column_definitions <- fread(file.path(mappings_dir, "column_definitions.csv"))

#Define Variables for each Zone
zone_measurements <- list(
  "rbz" = column_definitions[Zone == "rbz",.(Formatted_Name)],
  "bz" = column_definitions[Zone == "bz",.(Formatted_Name)],
  "lz" = column_definitions[Zone == "lz",.(Formatted_Name)]
)

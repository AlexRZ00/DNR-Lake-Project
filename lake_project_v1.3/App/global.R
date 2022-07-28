# Define location of functions
functions_dir <- file.path(dirname(file.path(app_dir)), "Functions")

# Load in function scripts
function_scripts <- list.files(functions_dir, full.names = TRUE)

# Source all of the function scripts
lapply(X = function_scripts, FUN = source)

# Load in data
alllakes_data <- fread(file.path(data_dir,"950_hab.csv"))
name_mapping <- fread(file.path(mappings_dir, "NameMapping.csv"))

#Define Variables for each Zone
zone_measurements <- list(
  "rbz" = name_mapping[Zone == "rbz",.(Formatted_Name)],
  "bz" = name_mapping[Zone == "bz",.(Formatted_Name)],
  "lz" = name_mapping[Zone == "lz",.(Formatted_Name)]
)

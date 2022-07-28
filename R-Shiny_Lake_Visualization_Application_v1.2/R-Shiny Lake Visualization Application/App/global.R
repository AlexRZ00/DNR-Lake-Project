# Define location of functions
functions_dir <- file.path(dirname(file.path(app_dir)), "Functions")

# Load in function scripts
function_scripts <- list.files(functions_dir, full.names = TRUE)

# Source all of the function scripts
lapply(X = function_scripts, FUN = source)

# Load in data
alllakes_data <- fread(file.path(data_dir,"950_hab.csv"))

#Define Variables for each Zone
zone_measurements <- list(
  "rbz" = c(
    "Canopy % Coverage","SHRUB_PRESENCE","HERB_PRESENCE","SHRUB_HERB_PCT","IMPERVIOUS_PCT","MANI_LAWN_PCT","AG_PCT","OTHER_PCT"
  ),
  "bz" = c(
    "VERTICAL_WALL_LEN","RIPRAP_LEN","EROSION_CNTRL_LEN","ART_BEACH_LEN","GREAT_ERO_LEN","LESS_ERO_LEN"
  ),
  "lz" = c(
    "PIERS_CNT","BOAT_LIFT_CNT","SWIM_RAFT_CNT","BOATHOUSE_CNT","MARINAS_CNT","STRUCTURE_OTHER_CNT"
  )
)

# Load libraries
suppressWarnings(library(shiny))
suppressWarnings(library(shinyWidgets))
suppressWarnings(library(shinythemes))
suppressWarnings(library(data.table))
suppressWarnings(library(ggplot2))
suppressWarnings(library(stringr))
suppressWarnings(library(RColorBrewer))

#suppressWarnings(library(plotly))
#suppressWarnings(library(leaflet))

# Save app directory
app_dir <- dirname(rstudioapi::getActiveDocumentContext()$path)
data_dir <- file.path(dirname(app_dir), "Data")
guide_dir <- file.path(dirname(app_dir), "Guide")
mappings_dir <- file.path(dirname(app_dir), "Mappings")

# Run the application 
runApp(
  appDir = file.path(app_dir)
) 

#Final Changes to consider: change names to lowercase and underscore for spaces 
#(and in mappings file)
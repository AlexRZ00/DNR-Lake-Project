#Decode Data Values
data_decode <- function(dt, column_definitions){
  #Using lapply to change column type from integer to string
  pres_vars <-column_definitions[var_type == 'presence', .(Code_Name)]$Code_Name
  dt[,(pres_vars):= lapply(X = .SD, FUN = as.character), .SDcols = pres_vars]
  
  #Definitions to replace columns with readable labels
  dt[shrub_presence == 'N',shrub_presence :='Absent']
  dt[shrub_presence == 'Y',shrub_presence :='Present']
  dt[herbaceous_presence == 'N',herbaceous_presence :='Absent']
  dt[herbaceous_presence == 'Y',herbaceous_presence :='Present']
  dt[point_source_pres == 0,point_source_pres := 'Absent']
  dt[point_source_pres == 1,point_source_pres :='Outside Zone']
  dt[point_source_pres == 2,point_source_pres :='Inside Zone']
  dt[channel_flow_pres == 0,channel_flow_pres := 'Absent']
  dt[channel_flow_pres == 1,channel_flow_pres :='Outside Zone']
  dt[channel_flow_pres == 2,channel_flow_pres :='Inside Zone']
  dt[stair_lake_pres == 0,stair_lake_pres := 'Absent']
  dt[stair_lake_pres == 1,stair_lake_pres :='Outside Zone']
  dt[stair_lake_pres == 2,stair_lake_pres :='Inside Zone']
  dt[lawn_lake_pres == 0,lawn_lake_pres := 'Absent']
  dt[lawn_lake_pres == 1,lawn_lake_pres :='Outside Zone']
  dt[lawn_lake_pres == 2,lawn_lake_pres :='Inside Zone']
  #dt[bare_soil_pres == 0,bare_soil_pres := 'Absent']
  #dt[bare_soil_pres == 1,bare_soil_pres :='Outside Zone']
  #dt[bare_soil_pres == 2,bare_soil_pres :='Inside Zone']
  dt[sand_dep_pres == 0,sand_dep_pres := 'Absent']
  dt[sand_dep_pres == 1,sand_dep_pres :='Outside Zone']
  dt[sand_dep_pres == 2,sand_dep_pres :='Inside Zone']
  dt[other_runoff_pres == 0,other_runoff_pres := 'Absent']
  dt[other_runoff_pres == 1,other_runoff_pres :='Outside Zone']
  dt[other_runoff_pres == 2,other_runoff_pres :='Inside Zone']
  dt[emergent_veg_pres == 0,emergent_veg_pres := 'Absent']
  dt[emergent_veg_pres == 1,emergent_veg_pres :='Present']
  dt[floating_veg_pres == 0,floating_veg_pres := 'Absent']
  dt[floating_veg_pres == 1,floating_veg_pres :='Present']
  dt[plant_removal_pres == 0,plant_removal_pres := 'Absent']
  dt[plant_removal_pres == 1,plant_removal_pres :='Present']
  dt[float_emerg_pres == 0,float_emerg_pres := 'Absent']
  dt[float_emerg_pres == 1,float_emerg_pres :='Present']
  dt[exposed_canopy_pres == 0,exposed_canopy_pres := 'Absent']
  dt[exposed_canopy_pres == 1,exposed_canopy_pres :='Present']
  dt[exposed_shrub_pres == 0,exposed_shrub_pres := 'Absent']
  dt[exposed_shrub_pres == 1,exposed_shrub_pres :='Present']
  dt[exposed_herb_pres == 0,exposed_herb_pres := 'Absent']
  dt[exposed_herb_pres == 1,exposed_herb_pres :='Present']
  dt[exposed_mow_pres == 0,exposed_mow_pres := 'Absent']
  dt[exposed_mow_pres == 1,exposed_mow_pres :='Present']
  dt[exposed_till_pres == 0,exposed_till_pres := 'Absent']
  dt[exposed_till_pres == 1,exposed_till_pres :='Present']
}


#Plot Type Selection Function
create_plot <- function(data, xvar, measurement,var_type){
  lakes <- factor(data$lake_name)
  color_palette <- "Greens"
  if (var_type == "continuous"){
    #calculate mean measurement
    median_calc <- median(data[,.SD,.SDcols = xvar][[1]], na.rm = TRUE)
    
    ggplot(data = data, aes_string(x = xvar)) +
      geom_histogram(
        stat = "count", 
        colour = "black", 
        position = "dodge",
        fill = brewer.pal(7, color_palette)[5]
      ) +
      xlab(label = measurement) +
      ylab(label = 'Property Count') +
      theme_light()+
      geom_vline(
        xintercept = median_calc, 
        linetype = "twodash", 
        color = brewer.pal(7, color_palette)[7]
      ) +
      geom_text(
        mapping = aes(
          x = median_calc,
          y = 0,
          label = paste0("Median: ", median_calc),
          hjust = -0.2,
          vjust = -50
        )
      )
    
    
  }else if (var_type == "presence"){
      #average line to calculate input measurement
    ggplot(data = data, aes_string(x = xvar, fill = lakes)) +
      geom_bar(stat = "count", colour = "black", position = "dodge") +
      xlab(label = measurement) +
      ylab(label = 'Property Count') +
      scale_fill_brewer(palette = color_palette)+
      guides(
        fill = guide_legend(title = 'Selected Lakes')
      ) +
      theme_light()
  }
  #Use ggplot2::luv_colors to view color options
  
}

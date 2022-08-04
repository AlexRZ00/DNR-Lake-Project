#Decode Data Values
data_decode <- function(dt){
  dt[shrub_presence == 'N',shrub_presence :='No']
  dt[shrub_presence == 'Y',shrub_presence :='Yes']
  dt[herbaceous_presence == 'N',herbaceous_presence :='No']
  dt[herbaceous_presence == 'Y',herbaceous_presence :='Yes']
  dt[point_source_pres == 0,point_source_pres := 'No']
  dt[point_source_pres == 1,point_source_pres :='Yes']
  dt[channel_flow_pres == 0,channel_flow_pres := 'No']
  dt[channel_flow_pres == 1,channel_flow_pres :='Yes']
  dt[lawn_lake_pres == 0,lawn_lake_pres := 'No']
  dt[lawn_lake_pres == 1,lawn_lake_pres :='Yes']
  dt[sand_dep_pres == 0,lawn_lake_pres := 'No']
  dt[sand_dep_pres == 1,sand_dep_pres :='Yes']
  dt[other_runoff_pres == 0,other_runoff_pres := 'No']
  dt[other_runoff_pres == 1,other_runoff_pres :='Yes']
  dt[emergent_veg_pres == 0,emergent_veg_pres := 'No']
  dt[emergent_veg_pres == 1,emergent_veg_pres :='Yes']
  dt[floating_veg_pres == 0,floating_veg_pres := 'No']
  dt[floating_veg_pres == 1,floating_veg_pres :='Yes']
  dt[plant_removal_pres == 0,plant_removal_pres := 'No']
  dt[plant_removal_pres == 1,plant_removal_pres :='Yes']
  dt[float_emerg_pres == 0,float_emerg_pres := 'No']
  dt[float_emerg_pres == 1,float_emerg_pres :='Yes']
  dt[exposed_canopy_pres == 0,exposed_canopy_pres := 'No']
  dt[exposed_canopy_pres == 1,exposed_canopy_pres :='Yes']
  dt[exposed_shrub_pres == 0,exposed_shrub_pres := 'No']
  dt[exposed_shrub_pres == 1,exposed_shrub_pres :='Yes']
  dt[exposed_herb_pres == 0,exposed_herb_pres := 'No']
  dt[exposed_herb_pres == 1,exposed_herb_pres :='Yes']
  dt[exposed_mow_pres == 0,exposed_mow_pres := 'No']
  dt[exposed_mow_pres == 1,exposed_mow_pres :='Yes']
  dt[exposed_till_pres == 0,exposed_till_pres := 'No']
  dt[exposed_till_pres == 1,exposed_till_pres :='Yes']
}

#fill out above codes for each presence variable

#Plot Type Selection Function
create_plot <- function(data, xvar, measurement,var_type){
  #Use ggplot2::luv_colors to view color options
  if (var_type == "continuous"){
    ggplot(data = data, aes_string(x = xvar)) +
      geom_histogram(aes(y=..count..), colour="black", fill="cyan4") +
      xlab(label = measurement) +
      ylab(label = 'Property Count') +
      #theme_dark()+
      theme(
        axis.title.x = element_text(measurement),
        axis.title.y = element_text('Property Count'),
        axis.text = element_text(size = 12)
      )
    #ggplot(data = data, aes_string(x = xvar)) +
    #  geom_histogram(aes(y=..density..), colour="black", fill="cyan4") +
    #  geom_density(alpha=.2, fill="#FF6666") +
    #  xlab(label = measurement) +
    #  ylab(label = 'Distribution')
    #inquire about count plot vs density plot (where "property count" is changed to Distribution)
  }else if (var_type == "presence"){
    ggplot(data = data, aes(x = xvar)) +
      geom_bar(stat = "count", colour="black", fill="cyan4") +
      xlab(label = measurement) +
      ylab(label = 'Property Count')
    
    #determine graph type for presence; 
    #check ggplot2::scale_x_discrete()
  }
   #switch(var_type,
   #  "presence" = {ggplot goes here},
   #  "continuous" = {ggplot goes here}
   #)

  
}

#Decode Data Values
#data_decode <- function(dt){
#  dt[shrub_presence == 'N',shrub_presence :='No']
##  dt[shrub_presence == 'Y',shrub_presence :='Yes']
##  dt[shrub_presence == 'N',shrub_presence :='No']
##  dt[shrub_presence == 'N',shrub_presence :='No']
##  return(dt)
#  
#}

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
    #ggplot(data = data, aes_string(x = xvar)) +
    #  geom_histogram(aes(y=..count..), colour="black", fill="cyan4") +
    #  xlab(label = measurement) +
    #  ylab(label = 'Property Count')
    
    #determine graph type for presence; 
    #check ggplot2::scale_x_discrete()
  }
   #switch(var_type,
   #  "presence" = {ggplot goes here},
   #  "continuous" = {ggplot goes here}
   #)

  
}

server <- function(input, output, session){
  
  # Define values to be used in app
  values <- reactiveValues(
    dt = alllakes_data,
    measurement_rbz = NULL,
    measurement_bz = NULL,
    measurement_lz = NULL
  )
  
  #Altering Data set (Renaming and Decoding)
  observe({
    values$dt <- nameadjusting(values$dt)
    values$dt <- data_decode(values$dt) #does not do anything, update function
  })
  
  # Filter parcel IDs based on which lake is selected
  observe({
    updateSelectInput(
      inputId = "parcel_id",
      choices = unique(values$dt[`Lake Name`==input$lake_name, .(`Parcel ID`)])
    )
  })
  
  #Input Plot Function for Riparian Buffer Zone Individual
  output$plot_rbz <- renderPlot(expr = {
    
    ggplot(data = values$dt[`Parcel ID`== input$parcel_id], aes(x="Parcel ID", y=input$measurement_rbz)) +
      geom_point()+
      geom_hline(yintercept=mean(values$dt[,.SD,.SDcols=input$measurement_rbz],color='red'))
  #the I terms defines the rows, the J term (.SD) selects the columns,the K term.SDcols informs which columns to supply
    
  })
#  
#  #Input Plot Function for Bank Zone Individual
#  output$plot_bz <- renderPlot(expr = {
#    
#    ggplot(data = values$dt[`Parcel ID`== input$parcel_id], aes(x="Parcel ID", y=input$measurement_bz)) +
#      geom_point()+
#      geom_hline(yintercept=mean(values$dt[,.SD,.SDcols=input$measurement_bz],color='red'))
#    
#  })
#  
#  #Input Plot Function for Littoral Zone Individual
#  output$plot_lz <- renderPlot(expr = {
#    
#    ggplot(data = values$dt[`Parcel ID`== input$parcel_id], aes(x="Parcel ID", y=input$measurement_lz)) +
#      geom_point()+
#      geom_hline(yintercept=mean(values$dt[,.SD,.SDcols=input$measurement_lz],color='red'))
#    
#  })
  
  #Input Plot Function for Riparian Buffer Zone Overall
  output$plot_rbz_overall <- renderPlot({
    
    ggplot(values$dt[`Lake Name`== input$lake_name_overall], aes_string(x = values$measurement_rbz_overall)) +
      geom_histogram(aes(y=..density..), colour="black", fill="white")+
      geom_density(alpha=.2, fill="#FF6666") 
  })
  
#  #Input Plot Function for Bank Zone Overall
#  output$plot_bz_overall <- renderPlot(expr = {
#    
#    ggplot(data = values$dt[`Parcel ID`== input$parcel_id], aes(x="Parcel ID", y=input$measurement_bz_overall)) +
#      geom_point()+
#      geom_hline(yintercept=mean(values$dt[,.SD,.SDcols=input$measurement_bz_overall],color='red'))
#    
#  })
#
#  #Input Plot Function for Littoral Zone Overall
#  output$plot_lz_overall <- renderPlot(expr = {
#    
#    ggplot(data = values$dt[`Parcel ID`== input$parcel_id], aes(x="Parcel ID", y=input$measurement_lz_overall)) +
#      geom_point()+
#      geom_hline(yintercept=mean(values$dt[,.SD,.SDcols=input$measurement_lz_overall],color='red'))
#    
#  })

  
  
  
  
  
  
  
  
  
  
  # Kill the app when the window gets closed
  session$onSessionEnded(function(){stopApp()})
  
}

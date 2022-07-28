server <- function(input, output, session){

    # Define values to be used in app
    values <- reactiveValues(
        dt = alllakes_data,
        measurement_rbz = NULL,
        measurement_bz = NULL,
        measurement_lz = NULL,
        name_mapping = name_mapping
    )

    #Altering Data set (Renaming and Decoding)
    observe({
        values$dt <- setnames(values$dt, name_mapping$Default_Name, name_mapping$Code_Name)
        values$dt <- data_decode(values$dt) #does not do anything, update function
    })

    # Filter parcel IDs based on which lake is selected
    observe({
        updateSelectInput(
            inputId = "parcel_id",
            choices = unique(values$dt[lake_name == input$lake_name, .(parcel_id)])
        )
    })

    # Update the variable options depending on which tab is selected
    observe({
        switch(
            input$tabs_overall,
            "Riparian Buffer Zone" = {tab_num <- 1},
            "Bank Zone" = {tab_num <- 2},
            "Littoral Zone" = {tab_num <- 3}
        )

        updateSelectInput(
            inputId = "measurement",
            choices = c(zone_measurements[[tab_num]],'')
            #selected = ''
        )
    })
    
    filterdata <- reactive({
      values$dt[lake_name== input$lake_name_overall] 
    })
    
    #Input Plot Function
    output$plot <- renderPlot({ 
      column <- name_mapping[Formatted_Name == input$measurement,.(Code_Name)]$Code_Name
      #Use ggplot2::luv_colors to view color options
      ggplot(filterdata(), aes_string(x = column)) +
        geom_histogram(aes(y=..count..), colour="black", fill="cyan4")+
        geom_density(alpha=.2, fill="#FF6666") +
        geom_label()
    })





    # Kill the app when the window gets closed
    session$onSessionEnded(function(){stopApp()})

}

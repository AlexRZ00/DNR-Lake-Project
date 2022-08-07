server <- function(input, output, session){

    # Define values to be used in app
    values <- reactiveValues(
        dt = alllakes_data,
        measurement_rbz = NULL,
        measurement_bz = NULL,
        measurement_lz = NULL,
        column_definitions = column_definitions
    )

    #Altering Data set (Renaming and Decoding)
    observe({
      values$dt <- setnames(
        x = values$dt, 
        old = column_definitions$Default_Name, 
        new = column_definitions$Code_Name,
        skip_absent = TRUE
      )
      values$dt <- data_decode(values$dt, column_definitions)
    })

    # Filter parcel IDs based on which lake is selected
    observe({
        updateSelectInput(
            inputId = "parcel_id",
            choices = unique(values$dt[lake_name %in% input$lake_name, .(parcel_id)])
        )
    })

    # Update the variable options depending on which tab is selected
    observe({
        switch(
            input$tabs_overall,
            "Riparian Buffer Zone" = {tab_num <- "rbz"},
            "Bank Zone" = {tab_num <- "bz"},
            "Littoral Zone" = {tab_num <- "lz"},
            tab_num <- "rbz"
        )

        updateSelectInput(
            inputId = "measurement",
            choices = c(zone_measurements[[tab_num]],'')
            #selected = ''
        )
    })
    
    filterdata <- reactive({
      values$dt[lake_name %in% input$lake_name_overall] 
    })
    
    #Input Plot Function
    output$plot <- renderPlot({ 
      xvar <- column_definitions[Formatted_Name == input$measurement,.(Code_Name)]$Code_Name
      var_type <- column_definitions[Formatted_Name == input$measurement, .(var_type)]
      
      #passing column_definitions, input$measurement, and filterdata() into the create_plot function (in functions file)
      create_plot(
        data = filterdata(),
        xvar = xvar,
        measurement = input$measurement,
        var_type = var_type
      )
      
      
      ##Use ggplot2::luv_colors to view color options
      #ggplot(filterdata(), aes_string(x = column)) +
      #  geom_histogram(aes(y=..count..), colour="black", fill="cyan4")+
      #  geom_density(alpha=.2, fill="#FF6666") +
      #  xlab(label = input$measurement) +
      #  ylab(label = 'Property Count')
    })


#..density..*(nrow(filterdata())) return to idea 


    # Kill the app when the window gets closed
    session$onSessionEnded(function(){stopApp()})

}

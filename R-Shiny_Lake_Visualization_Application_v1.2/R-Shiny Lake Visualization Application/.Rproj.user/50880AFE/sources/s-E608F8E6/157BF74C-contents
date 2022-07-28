# Define UI for application that draws a histogram
ui <- navbarPage(
  "Lake Data Visualization",
  collapsible = TRUE,
  inverse = TRUE, 
  theme = shinytheme("spacelab"),
  
  tabPanel(
    "Guide",
    includeHTML(file.path(guide_dir, "Guide.Rhtml"))
    
  ), # End tabPanel() for Guide
  
  tabPanel(
    "Individual Lake Parcel Statistics",
    fluidPage(
      
      sidebarLayout(
        fluid = TRUE,
        
        sidebarPanel = sidebarPanel(
          # Total width must be 12 or less
          width = 4,
          
          selectInput(
            inputId = "lake_name",
            label = "Choose your lake",
            choices = c(unique(alllakes_data$LAKE_NAME),""),
            selected = ""
          ),
          
          conditionalPanel(
            condition = "input.lake_name !== ''",
            
            selectInput(
              inputId = "parcel_id",
              label = "Choose Parcel ID",
              choices = ""
            )
          ) # End conditionalPanel()
        ), # End sidebarPanel()
        
        mainPanel = mainPanel(
          # Width must be 12 - sidebarPanel() width
          width = 8,
          
          tabsetPanel(
            tabPanel(
              "Riparian Buffer Zone",
              
              br(),
              
              selectInput(
                inputId = "measurement_rbz",
                label = "Choose a Measurement",
                choices = zone_measurements$rbz
              ),
              
              br(),
              
              plotOutput(
                outputId = "plot_rbz",
                height = "600px"
              )
            ), # End tabPanel() for Bank Zone
            
            tabPanel(
              "Bank Zone",
              
              br(),
              
              selectInput(
                inputId = "measurement_bz",
                label = "Choose a Measurement",
                choices = zone_measurements$bz
              ),
              
              br()#,
              
              #plotOutput(
              #  outputId = "plot_bz",
              #  height = "600px"
              #)
            ), # End tabPanel() for Littoral Zone
            
            tabPanel(
              "Littoral Zone",
              
              br(),
              
              selectInput(
                inputId = "measurement_lz",
                label = "Choose a Measurement",
                choices = zone_measurements$lz
              ),
              
              br()
              
              #plotOutput(
              #  outputId = "plot_lz",
              #  height = "600px"
              #)
            ) # End tabPanel() for Riparian Buffer Zone
          ) # End tabsetPanel()
        ) # End mainPanel()
      ) # End sidebarLayout()
    ) # End fluidpage()
  ), # End tabPanel() for Individual Lake Parcel Statistics
  
  tabPanel(
    "Overall Lake Statistics",
    fluidPage(
      
      sidebarLayout(
        fluid = TRUE,
        
        sidebarPanel = sidebarPanel(
          # Total width must be 12 or less
          width = 4,
          
          selectInput(
            inputId = "lake_name_overall",
            label = "Choose your lake",
            choices = c(unique(alllakes_data$LAKE_NAME),""),
            selected = ""
          )
        ), # End sidebarPanel()
        
        mainPanel = mainPanel(
          # Width must be 12 - sidebarPanel() width
          width = 8,
          
          tabsetPanel(
            tabPanel(
              "Riparian Buffer Zone",
              
              br(),
              
              selectInput(
                inputId = "measurement_rbz_overall",
                label = "Choose a Measurement",
                choices = c(zone_measurements$rbz,''),
                selected = ''
              ),
              
              br(),
              
              conditionalPanel(
                condition = "input.measurement_rbz_overall !== '' & input.lake_name_overall !== ''",
                plotOutput(
                  outputId = "plot_rbz_overall",
                  height = "600px"
                )  
              )
            ), # End tabPanel() for Riparian Buffer Zone
            
            tabPanel(
              "Bank Zone",
              
              br(),
              
              selectInput(
                inputId = "measurement_bz_overall",
                label = "Choose a Measurement",
                choices = zone_measurements$bz
              ),
              
              br()#,
              
              #plotOutput(
              #  outputId = "plot_bz_overall",
              #  height = "600px"
              #)
            ), # End tabPanel() for Bank Zone
            
            tabPanel(
              "Littoral Zone",
              
              br(),
              
              selectInput(
                inputId = "measurement_lz_overall",
                label = "Choose a Measurement",
                choices = zone_measurements$lz
              ),
              
              br()
              
              #plotOutput(
              #  outputId = "plot_lz_overall",
              #  height = "600px"
              #)
            ) # End tabPanel() for Littoral Zone
          ) # End tabsetPanel()
        ) # End mainPanel()
      ) # End sidebarLayout()
    ) # End fluidpage()
  ) # End tabPanel() for Overall Lake Papoose statistics
) # End navbarPage()

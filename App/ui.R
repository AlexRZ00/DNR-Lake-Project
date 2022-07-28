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
                            "Riparian Buffer Zone"
                        ), # End tabPanel() for Riparian Buffer Zone

                        tabPanel(
                            "Bank Zone"
                        ), # End tabPanel() for Bank Zone

                        tabPanel(
                            "Littoral Zone"
                        )#, # End tabPanel() for Littoral Zone

                        #footer = plotOutput(
                        #    outputId = "plot_rbz",
                        #    height = "600px"
                        #) # End plotOutput()
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
                        selected = ''
                    ),

                    selectInput(
                        inputId = "measurement",
                        label = "Choose a Measurement",
                        choices = '',
                    )
                ), # End sidebarPanel()

                mainPanel = mainPanel(
                    # Width must be 12 - sidebarPanel() width
                    width = 8,

                    tabsetPanel(
                        # Default tab to select
                        selected = "Riparian Buffer Zone",
                        id = "tabs_overall",

                        tabPanel(
                            "Riparian Buffer Zone",
                            id = "rbz_tab_overall"
                        ), # End tabPanel() for Riparian Buffer Zone

                        tabPanel(
                            "Bank Zone",
                            id = "bz_tab_overall"
                        ), # End tabPanel() for Bank Zone

                        tabPanel(
                            "Littoral Zone",
                            id = "lz_tab_overall"
                        ), # End tabPanel() for Littoral Zone

                        br(),

                        footer = conditionalPanel(
                            condition = "input.measurement !== '' & input.lake_name_overall !== ''",

                            plotOutput(
                                outputId = "plot",
                                height = "600px"
                            )
                        ) # End conditionalPanel for plot
                    ) # End tabsetPanel()
                ) # End mainPanel()
            ) # End sidebarLayout()
        ) # End fluidpage()
    ) # End tabPanel() for Overall Lake Papoose statistics
) # End navbarPage()

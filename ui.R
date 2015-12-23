###########################################################
## Tom's Samsel sample Shiny App
## Dublin 20 Dec 2015
###########################################################
## ui
###########################################################

ShinyUI <- fluidPage(
        titlePanel('Simulation illustrating sampling distributions and the Central Limit Theorem using normal distribution.'),
        sidebarPanel(
                helpText('Using sliders and input fields, please specify distributions mean, standard deviation, number of observations and number of replications for simulation purposes.'),
                sliderInput("mean", label="Mean", -10, 10, 0, step = 1),
                sliderInput("sd", label="Standard deviation", 0.1, 5, 1, step=0.1),
                numericInput("noo", "Number of observations", 100),
                numericInput("nor", "Number of replications", 100),
                actionButton("plot_it","Create the plots")
                ), # end sidebarPanel
        mainPanel(
                # Use CSS to control the background color of the entire page
                tags$head(
                        tags$style("body {background-color: #9999aa; }")
                ),
                plotOutput("my_output")
        )
)# end mainPanel
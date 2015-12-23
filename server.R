##############################################################
## server
##############################################################

library(shiny)
shinyServer(function(input, output) {
        # lets prepare a container for reactive variables
        container <- reactiveValues(samples=NULL, sums=NULL, means=NULL, vars=NULL)
        
        # using input variables generate matrix of random normals, then calculate
        # sums, means and variances
        observeEvent(input$plot_it, {
                my_matrix <- matrix(rnorm(input$noo*input$nor, input$mean, input$sd),input$nor)
                
                container$samples <- as.numeric(my_matrix[1,])
                container$sums <- as.numeric(apply(my_matrix,1,sum))
                container$means <- as.numeric(apply(my_matrix,1,mean))
                container$vars <- as.numeric(apply(my_matrix,1,var))
        })
        
        # when button pressed plot generated data
        output$my_output <- renderPlot({
                if (input$plot_it) {
                        # Create a 2x2 plot area & leave a big space (5) at the top for title
                        par(mfrow=c(2,2), oma=c(0,0,5,0))
                        hist(container$samples, main="Distribution of One Sample",
                             ylab="Frequency",col=1)
                        hist(container$sums, main="Sampling Distribution of the Sum",
                             ylab="Frequency",col=2)
                        hist(container$means, main="Sampling Distribution of the Mean",
                             ylab="Frequency",col=3)
                        hist(container$vars, main="Sampling Distribution of the Variance",
                             ylab="Frequency",col=4)
                        mtext("Simulation Results", outer=TRUE, cex=3)
                }
        }, height=500, width=800)
}
)
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    # Generate X from appropriate random distribution
    X <- reactive({
    if(input$Dist1 == "Normal"){
        X <- rnorm(input$n)
    } else if(input$Dist1 == "Uniform"){
        X <- runif(input$n)
    } else if(input$Dist1 == "Poisson"){
        rpois(input$n, lambda = 1)    
    } else if(input$Dist1 == "Exponential"){
        rexp(input$n)  
    } else if(input$Dist1 == "Log-Normal"){
        rlnorm(input$n)  
    } else if(input$Dist1 == "Cauchy"){
        rcauchy(input$n)  
    }
    })
    
    # Generate Y from appropriate random distribution
    Y <- reactive({if(input$Dist2 == "Normal"){
        Y <- rnorm(input$n)
    } else if(input$Dist2 == "Uniform"){
        Y <- runif(input$n)
    } else if(input$Dist2 == "Poisson"){
        rpois(input$n, lambda = 1)    
    } else if(input$Dist2 == "Exponential"){
        rexp(input$n)  
    } else if(input$Dist2 == "Log-Normal"){
        rlnorm(input$n)  
    } else if(input$Dist2 == "Cauchy"){
        rcauchy(input$n)  
    }
    })
    
    # Outputs
    output$Corr <- renderText({
        cor(X(),Y(),method = "pearson")
    })
    
    output$pval <- renderText({
        cor.test(X(),Y(),method = "pearson")$p.value
    })
    
    # Plot
    output$plot1 <- renderPlot({
        plot(X(),Y(),xlab = "X", ylab = "Y", col = "black")
        if(input$show_line) {
            abline(lm(Y() ~ X()))
        }
    })
})

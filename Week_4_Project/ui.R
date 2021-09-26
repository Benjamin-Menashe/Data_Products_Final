library(shiny)

shinyUI(fluidPage(

    # Application title
    titlePanel("Spurious Correlations Producer"),

    # Sidebar with information
    sidebarLayout(
        sidebarPanel(
            h1("Settings"),
            # picking the size
            numericInput("n", "Pick size n", value = 100, min = 2, max = 5000, step = 1),
            # picking the X distribution
            selectInput("Dist1","Select a distribution for X",c("Normal","Uniform","Poisson","Exponential","Log-Normal","Cauchy"), multiple = FALSE),
            # picking the Y distribution
            selectInput("Dist2","Select a distribution for Y",c("Normal","Uniform","Poisson","Exponential","Log-Normal","Cauchy"), multiple = FALSE),
            # optional correlation line plotted
            checkboxInput("show_line", h5("Show/Hide Correlation Line")) 
        ),

        # Main Panel
        mainPanel(
            h3("Correlation Graph"),
            plotOutput("plot1"),
            h4("The Pearson's R correlation value is:"),
            textOutput("Corr"),
            h4("With a p-value of:"),
            textOutput("pval")
        )
    )
))

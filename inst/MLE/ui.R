shinyUI(

  fluidPage(title="mle",

  titlePanel("Maximum Likelihood Estimation (MLE) of
             Person Location in Rasch Model given Item Difficulty"),

  sidebarPanel(width=4,
     sliderInput("r", label = "Raw Score (r)",
                 min = 0, max = 5, value = 2, step = 1),
     sliderInput("t_0", label = "Starting Value",
                 min = -2, max = 2, value = 0, step = 0.5),
     sliderInput("iter", label = "Iteration",
                 min = 1, max = 5, value = 1, step = 1),
     strong("Note:"),
     p("Respondent's raw score are assumed to come from
       following patterns: r=0, patt=00000; r=1, patt=10000;
       r=2, patt=11000; r=3, patt=11100; r=4, patt=11110;
       and r=5, patt=11111. Item difficulties for five item instrument are assumed
       to be known (-1.90, -0.60, -0.25, 0.30, 0.45) and are provided
       in de Ayala (2009, p.22). This app replicates person locations
       in Table 2.2 in de Ayala (2009, p.28)"
     )
    ),

    mainPanel(
        plotOutput(outputId="MLEIRT_plot", height="500px"),
        verbatimTextOutput("iterinfo")
    )

))

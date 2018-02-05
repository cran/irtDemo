shinyUI(bootstrapPage(

  titlePanel("EAP and MAP Person Ability Estimation in Rasch Model"),

  inputPanel(
      sliderInput("r", label = "Raw Score (r)",
                  min = 0, max = 5, value = 2, step = 1),
      sliderInput("quad", label = "Quadrature Points",
                  min = 10, max = 100, value = 10, step = 10),
      sliderInput("mean",
                  label="Prior Mean",
                  min=-2, max=2, value=0, step=0.1),
      sliderInput("sd",
                   label="Prior SD",
                   min=0.1, max=2, value=1, step=0.1),
      sliderInput("skew", label = "Prior Skewness",
                  min = .5, max = 2, value = 1, step = .1)
  ),

  helpText("Respondent's raw score are assumed to come from
             following patterns: r=0, patt=00000; r=1, patt=10000;
             r=2, patt=11000; r=3, patt=11100; r=4, patt=11110;
             and r=5, patt=11111."),

  helpText("Note: Default values replicate the analysis by de Ayala (2009, p. 79)
           where difficulty parameters for Item 1-5 are fixed at -2.155, -.245, .206, .984, and 1.211."),

    tabsetPanel(
        tabPanel("Seperate",
          dashboardBody(
            fluidRow(
              column(width=6,
                     box(plotOutput("Prior_plot"))),
              column(width=6,
                     box(plotOutput("TraceLines_plot"))),
              column(width=6,
                     box(plotOutput("Likelihood_plot"))),
              column(width=6,
                     box(plotOutput("Posterior_plot")))
                )
              )
            ),

        tabPanel("Combined", plotOutput(outputId="Combined_plot",width="100%", height="600px"))
              )
        )
    )

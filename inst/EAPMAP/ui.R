shinyUI(

  fluidPage(title="eapmap",

  titlePanel("EAP and MAP Person Ability Estimation in Rasch Model"),

  sidebarPanel(width=3,
      sliderInput("r", label = "Raw Score (r)",
                  min = 0, max = 5, value = 2, step = 1),
      sliderInput("quad", label = "Quadrature Points",
                  min = 10, max = 100, value = 41, step = 10),
      sliderInput("mean",
                  label="Prior Mean",
                  min=-2, max=2, value=0, step=0.1),
      sliderInput("sd",
                   label="Prior SD",
                   min=0.1, max=2, value=1, step=0.1),
      sliderInput("skew", label = "Prior Skewness",
                  min = .5, max = 2, value = 1, step = .1)
  ),

  mainPanel(
    tabsetPanel(
        tabPanel("Seperate",
                splitLayout(
                   cellWidths = 450,
                   plotOutput("Prior_plot"),
                   plotOutput("TraceLines_plot")
                ),
                splitLayout(
                  cellWidths = 450,
                  plotOutput("Likelihood_plot"),
                  plotOutput("Posterior_plot")
                ),
                helpText("Note: Respondent's raw score are assumed to come from following patterns: r=0, patt=00000; r=1, patt=10000;
                         r=2, patt=11000; r=3, patt=11100; r=4, patt=11110;
                         and r=5, patt=11111.Default values replicate the analysis in de Ayala (2009, p. 79)
                         where difficulty parameters for Item 1-5 are fixed at -2.155, -.245, .206, .984, and 1.211."
                )
              ),

        tabPanel("Combined", plotOutput(outputId="Combined_plot",width="100%", height="600px"))
     )
   )
  )
)

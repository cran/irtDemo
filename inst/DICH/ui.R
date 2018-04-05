shinyUI(
  fluidPage(title="dich",

    titlePanel("Dichotomous IRT Models"),

    sidebarPanel(width=3,
                 selectInput("D", label = "Item Response Function",
                             list("Normal Ogive" = 1, "Logistic"=2), selected = 2),
        sliderInput("alpha", label = "Discrimination (a)",
                  min = -3, max = 3, value = 1, step = .5),
        sliderInput("delta", label = "Location (b)",
                  min = -3, max = 3, value = 0, step = .5),
        sliderInput("la", label = "Lower Asymptote (c)",
                    min = 0, max = 0.4, value = 0, step = .1),
        sliderInput("ua", label = "Upper Asymptote (d)",
                    min = .6, max = 1, value = 1, step = .1),
        selectInput("modprob", label = "Modeled Probability",
                    list("P(X=1|theta)" = 1, "P(X|theta)"=2), selected = 2)
      ),
  mainPanel(
    plotOutput(outputId="dich_plot", height="600px"),
    verbatimTextOutput(outputId="feedback")
  )
)
)

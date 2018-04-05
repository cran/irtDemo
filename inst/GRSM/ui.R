shinyUI(

  fluidPage(title="grsm",

  titlePanel("RSM (default) and GRSM"),

   sidebarPanel(width=3,
                selectInput("D", label = "Item Response Function",
                            list("Normal Ogive" = 1, "Logistic"=2), selected = 2),
        sliderInput("alpha", label = "Discrimination",
                  min = -3, max = 3, value = 1, step = .5),
        sliderInput("delta", label = "Difficulty",
                    min = -3, max = 3, value = 0, step = .5),
        sliderInput("tau1", label = "Threshold 1",
                  min = -3, max = 3, value = -1, step = .5),
        sliderInput("tau2", label = "Threshold 2",
                    min = -3, max = 3, value = -0.4, step = .5),
        sliderInput("tau3", label = "Threshold 3",
                    min = -3, max = 3, value = 0.4, step = .5),
        sliderInput("tau4", label = "Threshold 4",
                    min = -3, max = 3, value = 1, step = .5)
      ),
    mainPanel(
      plotOutput(outputId="grsm_plot", height="600px")
    )
  )
)

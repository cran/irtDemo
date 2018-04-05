shinyUI(
  fluidPage(title="gpcm",

  titlePanel("Rasch PCM (default) and 2PL GPCM"),

    sidebarPanel(width=3,
                 selectInput("D", label = "Item Response Function",
                             list("Normal Ogive" = 1, "Logistic"=2), selected = 2),
        sliderInput("alpha", label = "Discrimination",
                  min = -3, max = 3, value = 1, step = .5),
        sliderInput("delta1", label = "Step parameter 1",
                  min = -3, max = 3, value = -2, step = .5),
        sliderInput("delta2", label = "Step parameter 2",
                    min = -3, max = 3, value = -0.75, step = .5),
        sliderInput("delta3", label = "Step parameter 3",
                    min = -3, max = 3, value = 0.75, step = .5),
        sliderInput("delta4", label = "Step parameter 4",
                    min = -3, max = 3, value = 2, step = .5)
      ),

    mainPanel(
      plotOutput(outputId="gpcm_plot", height="600px")
    )
  )
)

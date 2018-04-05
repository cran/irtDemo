shinyUI(

  fluidPage(title="grm",

  titlePanel("Graded Response Model (Samejima, 1969)"),

    sidebarPanel(width=3,
                 selectInput("D", label = "Item Response Function",
                             list("Normal Ogive" = 1, "Logistic"=2), selected = 2),
        sliderInput("alpha", label = "Discrimination",
                  min = -3, max = 3, value = 1.5, step = .5),
        sliderInput("delta1", label = "Location 1",
                  min = -2.5, max = -1.5, value = -2, step = .1),
        sliderInput("delta2", label = "Location 2",
                    min = -1.25, max = -0.25, value = -0.75, step = .1),
        sliderInput("delta3", label = "Location 3",
                    min = 0, max = 1.25, value = 0.75, step = .1),
        sliderInput("delta4", label = "Location 4",
                    min = 1.5, max = 2.5, value = 2, step = .1)
      ),

    mainPanel(
      plotOutput(outputId="grm_plot",height="600px")
    )
  )
)

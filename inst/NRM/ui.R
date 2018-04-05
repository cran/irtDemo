shinyUI(

  fluidPage(title="nrm",

  titlePanel("Nominal Response Model (Bock, 1972)"),

    sidebarPanel(width=3,
        selectInput("D", label = "Item Response Function",
                  list("Normal Ogive" = 1, "Logistic"=2), selected = 2),
        sliderInput("alpha1", label = "Discrimination 1",
                  min = -3, max = 3, value = 0.5, step = .5),
        sliderInput("alpha2", label = "Discrimination 2",
                    min = -3, max = 3, value = 1, step = .5),
        sliderInput("alpha3", label = "Discrimination 3",
                    min = -3, max = 3, value = 1.5, step = .5),
        sliderInput("alpha4", label = "Discrimination 4",
                    min = -3, max = 3, value = 2, step = .5),
        sliderInput("delta1", label = "Location 1",
                    min = -3, max = 3, value = -1, step = .5),
        sliderInput("delta2", label = "Location 2",
                  min = -3, max = 3, value = -0.5, step = .5),
        sliderInput("delta3", label = "Location 3",
                    min = -3, max = 3, value = -0.5, step = .5),
        sliderInput("delta4", label = "Location 4",
                    min = -3, max = 3, value = 1, step = .5)
      ),
  mainPanel(
    plotOutput(outputId="nrm_plot", height="600px")
  )
  )
)

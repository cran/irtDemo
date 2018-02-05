shinyUI(

  bootstrapPage(

    titlePanel("Maximum Likelihood Estimation of Item
                     Guessing, Discrimination and Difficulty in 3PL Model"),

    inputPanel(
      sliderInput("guess", label = "Guessing",
                  min = 0.05, max = 0.6, value = 0.4, step = 0.05),
      sliderInput("alpha", label = "Discrimination",
                  min = -3, max = 3, value = 1, step = 0.15),
      sliderInput("delta", label = "Difficulty",
                  min = -3, max = 3, value = -0.5, step = 0.15),
      sliderInput("angle1", label = "Rotate Left-Right",
                  min = 0, max = 90, value = 30, step = 1),
      sliderInput("angle2", label = "Rotate Up-Down",
                  min = 0, max = 90, value = 30, step = 1)
    ),

    helpText("Note: The graph may take a minute to appear!"),

    plotOutput(outputId="est3PL_plot_all",width="100%", height="600px")
  )
)

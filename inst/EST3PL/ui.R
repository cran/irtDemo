shinyUI(

  fluidPage(title="mle3pl",

    titlePanel("Maximum Likelihood Estimation of Item Discrimination, Location and Lower Asymptote in 3PL Model"),

    sidebarPanel(width=3,
      sliderInput("guess", label = "Lower Asymptote",
                  min = 0.05, max = 0.6, value = 0.4, step = 0.05),
      sliderInput("alpha", label = "Discrimination",
                  min = -3, max = 3, value = 1, step = 0.15),
      sliderInput("delta", label = "Location",
                  min = -3, max = 3, value = -0.5, step = 0.15),
      actionButton(inputId="submit", label="Submit")
    ),
    mainPanel(
      inputPanel(
                   sliderInput("angle1", label = "Rotate Left-Right",
                               min = 0, max = 90, value = 30, step = 1),
                   sliderInput("angle2", label = "Rotate Up-Down",
                               min = 0, max = 90, value = 30, step = 1)
      ),
      helpText("Note: The graph may take a minute to update!"),
      plotOutput(outputId="est3PL_plot_all",width="100%", height="600px")
    )
  )
)

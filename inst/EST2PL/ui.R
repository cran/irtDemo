shinyUI(

  fluidPage(title="mle2pl",

    titlePanel("Maximum Likelihood Estimation of Item
                     Discrimination and Location in 2PL Model"),

    sidebarPanel(width=3,
      sliderInput("alpha", label = "Discrimination",
                  min = -3, max = 3, value = 1, step = 0.1),
      sliderInput("delta", label = "Location",
                  min = -3, max = 3, value = -0.5, step = 0.1),
      actionButton(inputId="submit", label="Submit")
    ),
    mainPanel(
      inputPanel(
        sliderInput("angle1", label = "Rotate Right-Left",
                    min = 0, max = 90, value = 30, step = 1),
        sliderInput("angle2", label = "Rotate Up-Down",
                    min = 0, max = 90, value = 30, step = 1)
      ),
      plotOutput(outputId="est2PL_plot",width="100%", height="600px"),
      helpText("Note: Values on the control panel are true values and
               projection of red dot corresponds to the intersection of
               discrimination and difficulty parameters that maximize the joint log-likelihood.")
    )
  )
)

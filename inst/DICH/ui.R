shinyUI(bootstrapPage(

  titlePanel("Dichotomous IRT Models"),

    inputPanel(
        selectInput("D", label = "Scaling Constant",
                  list("1" = 1, "1.702"=2), selected = 1),
        sliderInput("alpha", label = "Discrimination (a)",
                  min = -3, max = 3, value = 1, step = .5),
        sliderInput("delta", label = "Difficulty (b)",
                  min = -3, max = 3, value = 0, step = .5),
        sliderInput("la", label = "Guessing (c)",
                    min = 0, max = 0.4, value = 0, step = .1),
        sliderInput("ua", label = "Inattentiveness (d)",
                    min = .6, max = 1, value = 1, step = .1),
        selectInput("modprob", label = "Modeled Probability",
                    list("P(X=1|theta)" = 1, "P(X|theta)"=2), selected = 2)
      ),

    textOutput(outputId="feedback"),

    plotOutput(outputId="dich_plot",width="60%", height="500px")
  )
)

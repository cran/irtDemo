shinyUI(

  fluidPage(title="mirt",
      titlePanel(h1("Multidimensional Dichotomous Models")),
      titlePanel(h3("(Rasch, 1PL, 2PL, 3PL, and 4PL)")),
        sidebarPanel(width=3,
          selectInput("D", label = "Item Response Function",
                       list("Normal Ogive" = 1, "Logistic"=2), selected = 2),
          selectInput("comp", label = "Compensatory",
                      list("Yes" = 1, "No"=2), selected = 1),
          sliderInput("delta1", label = "Location 1",
                      min = -3, max = 3, value = 0, step = 0.1),
          sliderInput("delta2", label = "Location 2",
                      min = -3, max = 3, value = 0, step = 0.1),
          sliderInput("alpha1", label = "Discrimination 1",
                      min = -3, max = 3, value = 1, step = 0.1),
          sliderInput("alpha2", label = "Discrimination 2",
                      min = -3, max = 3, value = 1, step = 0.1),
          sliderInput("c", label = "Lower Asymptote",
                      min = 0, max = .4, value = 0, step = 0.1),
          sliderInput("d", label = "Upper Asymptote",
                      min = .6, max = 1, value = 1, step = 0.1),
          textInput("nametheta1", label="Name Dimension 1", "Math"),
          textInput("nametheta2", label="Name Dimension 2", "Reading")
        ),
        mainPanel(
          tabsetPanel(
            tabPanel("Item Response Surface",
                     inputPanel(
                       sliderInput("angle1", label = "Rotate Right-Left",
                                   min = 0, max = 90, value = 30, step = 1),
                       sliderInput("angle2", label = "Rotate Up-Down",
                                   min = 0, max = 90, value = 30, step = 1)
                     ),
                     plotOutput(outputId="M2PL_plot",width="650px", height="650px"),
                     verbatimTextOutput(outputId="parms1")),
            tabPanel("Contour Plot",
                     inputPanel(
                       sliderInput("nlevels", label = "N Contour Levels",
                                   min = 10, max = 100, value = 10, step = 1)
                     ),
                     plotOutput(outputId="cont_plot",width="650px", height="650px"),
                     verbatimTextOutput(outputId="parms2")),
            tabPanel("Information Plot",
                     inputPanel(
                       sliderInput("angle3", label = "Rotate Right-Left",
                                   min = 0, max = 90, value = 30, step = 1),
                       sliderInput("angle4", label = "Rotate Up-Down",
                                   min = 0, max = 90, value = 30, step = 1)
                     ),
                     plotOutput(outputId="info_plot",width="650px", height="650px"),
                     verbatimTextOutput(outputId="parms3"))
          )
        )
      )
   )

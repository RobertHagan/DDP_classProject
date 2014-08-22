library(shiny)
# Define UI for slider demo application
shinyUI(
  pageWithSidebar(    
#  Application title
  headerPanel("Compute Your Body Mass Index and its estimated impact on your expected normal lifespan"),
  
    sidebarPanel(
      # weight
      numericInput('weight', "Enter or select your current weight in lbs (150-400):", 150,
                  min=150, max=400, step = 1),
      
      # height in feet
      sliderInput('feet', "Please select your height in feet and inches   Feet:", 
                  min = 3, max = 7, value = 5, step = 1.0),
      
      # inches
      sliderInput('inches', "Inches:",
                  min = 0, max = 11, value = 5, step = 1.0),
      
      # age  collect the participants age to compute estimage years of life remaining
      numericInput('age', "Enter or select your current age in years:", 40,
                   min=15, max=100, step = 1) #,
#      submitButton('Calculate BMI')          
    ),
    mainPanel(
      h4('You indicated your weight in lbs as:'),
      verbatimTextOutput("weightout"),
      h4('and that you are'),
      verbatimTextOutput("feetout"),
      h4('feet and'),
      verbatimTextOutput("inchesout"),
      h4("inches tall.  Your indicated age in years is:"),
      verbatimTextOutput("ageout"),
      h4("For the above values, the body mass index is:"),
      verbatimTextOutput("bmiout"),
      h4("Under normal assumptions, this bmi is expected to
         increase(+) or reduce(-) your normal expected life span (in years) as indicated:"),
      verbatimTextOutput("yearout")
    )
  )
)

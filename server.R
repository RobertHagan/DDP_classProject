library(shiny)
# formula for bmi and years of remaining life
#bmi <- function(weight,height)  weight/height

#bmi <- function(weight, feet, inches) (weight * 703)/(((feet * 12) + inches)^2) #
bmi <- function(weight, feet, inches) (weight * 703) / ((feet * 12) + inches)^2
yearsleft <- function(weight, feet, inches, age) {  
 (1 - ((weight * 703) / ((feet * 12) + inches)^2)/25) * abs(82 - age) }
shinyServer(
# bmi <- function(weight, heightfeet, inches)
#  (weight * 703)/(((feet * 12) + inches)^2) #
  function(input, output) {
    
   output$weightout <- renderPrint({input$weight})
   output$feetout <- renderPrint({input$feet})
   output$inchesout <- renderPrint({input$inches})
   output$ageout <- renderPrint({input$age})
   output$bmiout <- renderPrint({bmi(input$weight, input$feet, input$inches)})
   output$yearout <- renderPrint({yearsleft(input$weight, input$feet, input$inches, input$age)})
   }
)

# Documentation


# This Shiny app gets two input values (height in inches and weight in pounds) from the user to calculate Body Mass Index (BMI). 
# The function on the server side takes height and weight as inputs and computes BMI using the formula on 
# this site: http://extoxnet.orst.edu/faqs/dietcancer/web2/twohowto.html
# The formula for BMI does the following:
# convert weight in pounds to kg by multiplying by .45
# convert height in inches to m by multiplying by 0.025, then square.
# calculate the ratio.




shinyUI(fluidPage(
        headerPanel("Calculate your Body Mass Index"),
       helpText("The Body Mass Index is an attempt to quanitfy the amount of tissue mass in an individual and categorize the individual as underweight,
                normal weight, overweight, or obese.  Normal weight is categorized as a BMI between 18.5 and 25.  There is some debate about both the scale and accuracy of this index as
                 meausurement of health."),
      
        
        sidebarPanel(
                
                        sliderInput("wt", "Weight in Pounds:", 
                                    min=0, max=400, value=130),
                        
                        # Decimal interval with step value
                        sliderInput("ht", "Height in Inches:",
                                    min = 0, max = 100, value = 60, step= 0.5)
        ),
       
      
        
        mainPanel(
                tableOutput("values")
                
        )
))
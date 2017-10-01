# Documentation
# This Shiny app gets two input values (height in inches and weight in pounds) from the user to calculate Body Mass Index (BMI). 
# The function on the server side takes height and weight as inputs and computes BMI using the formula on 
# this site: http://extoxnet.orst.edu/faqs/dietcancer/web2/twohowto.html
# The formula for BMI does the following:
# convert weight in pounds to kg by multiplying by .45
# convert height in inches to m by multiplying by 0.025, then square.
# calculate the ratio.



BMI = function(height,weight){
        return(0.45*weight/(.025*height)^2)
}

shinyServer(function(input, output) {
                # output$oht <- renderPrint({input$ht})
                # output$owt <- renderPrint({input$wt})
                # output$prediction <- renderPrint({BMI(input$ht, input$wt)})
                # 
                
                #added
                sliderValues <- reactive({
                        
                        # Compose data frame
                        data.frame(
                                Name = c("Weight in Pounds", 
                                         "Height in Inches", "BMI"),
                                Value = as.character(c(input$wt, 
                                                       input$ht, BMI(input$ht,input$wt)),
                                stringsAsFactors=FALSE))
                }) 
                
                # Show the values using an HTML table
                output$values <- renderTable({
                        sliderValues()
                })
        
})    
                
                
                
               
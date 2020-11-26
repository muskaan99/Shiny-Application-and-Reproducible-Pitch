shinyServer(function(input, output) {
    output$text1 = renderText({
        x<- input$a1;y<- input$a2;val2<- input$val1;out <-1
        if (x=="Pound" & y=="Kilogram"){out<- round(val2*0.453,2)
        }else if(x=="Kilogram" & y=="Pound"){out <- round(val2*2.204,2)
        }else if(x=="Fahrenheit" & y=="Celsius"){ out<- round((val2-32)/1.8,2)
        }else if(x=="Celsius" & y=="Fahrenheit"){ out<- round(1.8*val2+32,2)
        }else if(x==y){out<-val2
        }else{out<- "Wrong Inputs,please try again"}
        paste(val2, " ",x," = ",out, " ",y)
    })})

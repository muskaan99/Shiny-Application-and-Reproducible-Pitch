TITLE: System for Unit Conversion
========================================================
author: Muskaan Parmar 
date: 26 November 2020
autosize: true


The Shiny app is available at:
https://muskaan99.shinyapps.io/System_for_Unit_Conversion/


WORKING
========================================================
The System for Unit Conversion works by converting Pound/Kilogram & Fahrenheit/Celsius. Vice- versa conversion is also possible. It has been created using Shiny. It has 3 boxes namely: convert from, convert to and the numeric value(val1) you wish to convert.The default numeric value is taken as 1.
- To convert from pound to kilogram, the numeric value is multiplied by 0.453.
- To convert from kilogram to pound, the numeric value is multiplied by 2.204.
- To convert from fahrenheit to celsius,the numeric value is calculated by the formula (val1-32)/1.8.
- To convert from celsius to fahrenheit,the numeric value is calculated by the formula (1.8*val1)+32


WORKING(continued)
========================================================

Example:


```r
#assuming the input weight is 2 pound which we want to convert to kilogram
wt=2
out<- round(wt*0.453,2)
print(paste0("Weight in kilogram=",out))
```

```
[1] "Weight in kilogram=0.91"
```

This app has been made with a few basic functions. We can add other features to it to make it more interactive and also enable more conversions for different measurements like height, density,etc.



ui.R Code
========================================================


```r
library(shiny)


shinyUI(fluidPage(
    titlePanel(" System for Unit Conversion_Muskaan"),
    sidebarLayout(
        sidebarPanel(
            selectInput("a1","Convert from-",
                        c("Pound","Kilogram","Fahrenheit","Celsius"),
                        selected = "Pound"),
            selectInput("a2","Convert to-",
                        c("Pound","Kilogram","Fahrenheit","Celsius"),
                        selected = "Kilogram"),
            numericInput("val1","Numeric value to convert",value=1)
        ),
        mainPanel(
            h4("Works only for Pound/Kilogram and Fahrenheit/Celsius"),
            h4(textOutput("text1"))
        ))
))
```

<!--html_preserve--><div class="container-fluid">
<h2> System for Unit Conversion_Muskaan</h2>
<div class="row">
<div class="col-sm-4">
<form class="well">
<div class="form-group shiny-input-container">
<label class="control-label" for="a1">Convert from-</label>
<div>
<select id="a1"><option value="Pound" selected>Pound</option>
<option value="Kilogram">Kilogram</option>
<option value="Fahrenheit">Fahrenheit</option>
<option value="Celsius">Celsius</option></select>
<script type="application/json" data-for="a1" data-nonempty="">{}</script>
</div>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="a2">Convert to-</label>
<div>
<select id="a2"><option value="Pound">Pound</option>
<option value="Kilogram" selected>Kilogram</option>
<option value="Fahrenheit">Fahrenheit</option>
<option value="Celsius">Celsius</option></select>
<script type="application/json" data-for="a2" data-nonempty="">{}</script>
</div>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="val1">Numeric value to convert</label>
<input id="val1" type="number" class="form-control" value="1"/>
</div>
</form>
</div>
<div class="col-sm-8">
<h4>Works only for Pound/Kilogram and Fahrenheit/Celsius</h4>
<h4>
<div id="text1" class="shiny-text-output"></div>
</h4>
</div>
</div>
</div><!--/html_preserve-->

server.R Code
========================================================


```r
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
```


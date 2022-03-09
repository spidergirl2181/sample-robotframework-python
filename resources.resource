*** Settings ***
Documentation     An example resource file
Library           Selenium2Library

*** Variables ***
${URL}  https://www.google.com/

*** Keywords ***
#This is an example of managing 
    Access to url	${URL}
        Access to url	${URL}
     
    Input to google textbox ${text}
        Input to google textbox ${text}
   
    Verify google serp display

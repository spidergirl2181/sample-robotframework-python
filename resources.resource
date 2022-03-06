*** Settings ***
Documentation     An example resource file
Library           Selenium2Library

*** Variables ***
${URL}  https://www.google.com/
${BROWSER}  chrome.exe

*** Keywords ***
Default browser is opened
    Open default browser

Open ${URL} on a browser
    Access to URL ${URL}

Response should be equal to ${HTTPcode}
    Verify HTTP response code ${HTTPcode}

Type ${text} into a search box
    Input into Google search box ${text} 
    Hit Enter
    Verify Google SERP is displayed

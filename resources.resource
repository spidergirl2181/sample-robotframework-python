*** Settings ***
Documentation     An example resource file
Library           Selenium2Library

*** Variables ***
${URL}  https://www.google.com/
${BROWSER}  chrome.exe

*** Keywords ***
Default browser is opened
    Open program from shell ${BROWSER}
    Current process list on OS should have running ${BROWSER} 

Open ${URL} on a browser
    Open ${URL} on the browser

Response should be equal to ${HTTPcode}
    Verify HTTP response code ${HTTPcode}

Type ${text} into a search box
    Input ${text} into Google search box
    Hit Enter
    Verify SERP is displayed

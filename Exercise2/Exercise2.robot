*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url} =        https://testpages.herokuapp.com/styled/alerts/alert-test.html
${browser} =    Edge

*** Test Cases ***
Test alerts
    Set Selenium Speed    100 ms
    Set Selenium Implicit Wait    5 s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

    Title Should Be    Test Page For JavaScript Alerts

    Element Should Not Be Visible    alertexplanation
    Click Button    alertexamples
    Alert Should Be Present    I am an alert box!
    Element Should Be Visible    alertexplanation

    Execute Javascript    window.scrollBy(0,300)

    Element Should Not Be Visible    confirmexplanation
    Click Button    confirmexample
    Handle Alert    DISMISS
    Element Should Be Visible    confirmexplanation
    Element Text Should Be    confirmexplanation    You clicked Cancel, confirm returned false.

    Element Should Not Be Visible    promptreturn
    Click Button    promptexample
    Input Text Into Alert    Hi!
    Element Should Be Visible    promptreturn
    Element Text Should Be    promptreturn    Hi!

    Sleep    2s
    close browser
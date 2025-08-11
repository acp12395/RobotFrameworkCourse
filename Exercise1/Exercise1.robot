*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url} =        https://testsheepnz.github.io/BasicCalculator.html
${browser} =    Edge

*** Test Cases ***
Check Calculator Website
    Set Selenium Speed    100 ms
    Set Selenium Implicit Wait    5 s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

    Title Should Be    Basic Calculator
    Execute Javascript    window.scrollBy(0,1000)

    Element Should Not Be Visible    errorMsgField

    Element Should Be Visible    number1Field
    Element Should Be Enabled    number1Field
    Input Text    id=number1Field    20
    Element Should Be Visible    number2Field
    Element Should Be Enabled    number2Field
    Input Text    id=number2Field    d
    Element Should Be Visible    selectOperationDropdown
    Element Should Be Enabled    selectOperationDropdown
    Select From List By Label    selectOperationDropdown    Multiply
    Element Should Be Visible    calculateButton
    Element Should Be Enabled    calculateButton
    Click Button    calculateButton
    Wait Until Element Is Visible    errorMsgField
    Element Should Be Visible    clearButton
    Element Should Be Enabled    clearButton
    Click Button    clearButton

    Element Should Be Visible    number1Field
    Element Should Be Enabled    number1Field
    Input Text    id=number1Field    20
    Element Should Be Visible    number2Field
    Element Should Be Enabled    number2Field
    Input Text    id=number2Field    30
    Element Should Be Visible    selectOperationDropdown
    Element Should Be Enabled    selectOperationDropdown
    Select From List By Label    selectOperationDropdown    Multiply
    Element Should Be Visible    calculateButton
    Element Should Be Enabled    calculateButton
    Click Button    calculateButton
    Wait Until Element Is Not Visible    errorMsgField

    Wait Until Element Is Visible    numberAnswerField
    Element Should Be Visible    numberAnswerField
    Element Attribute Value Should Be    numberAnswerField    value    600

    Sleep    2s
    close browser
*** Settings ***
Documentation    Fill out a form making use of an Excel spreadsheet
Library    SeleniumLibrary
Library    DataDriver    ./Book.xlsx    sheetname=Sheet1
Suite Setup    General Setup
Test Setup    Initialize Browser
Test Template    Fill with Excel
Test Teardown    Finish Browser
Resource    ../Keywords/Keywords.robot

*** Variables ***
${browser} =    Edge
${url}=    https://www.rpasamples.com/suppliers?locale=en

*** Keywords ***
General Setup
    Set Selenium Speed    10 ms
    Set Selenium Implicit Wait    5 s

Initialize Browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Title Should Be    UiPath Demo App

Finish Browser
    Sleep    2s
    Close Browser

Fill with Excel
    [Arguments]    ${internalName}    ${externalName}    ${industry}    ${noEmployees}    ${address}    ${city}    ${state}
    Wait Until Element Is Visible    //button[@class='sc-fjdhpX ddwmgh']
    Wait Until Element Is Enabled    //button[@class='sc-fjdhpX ddwmgh']
    Page Should Not Contain    Supplier Info
    Click Button    //button[@class='sc-fjdhpX ddwmgh']
    Wait Until Page Contains    Supplier Info
    Input Text And Take Screenshot    //input[@name='internalName']    ${internalName}    //input[@name='internalName']
    Input Text And Take Screenshot    //input[@name='externalName']    ${externalName}    //input[@name='externalName']
    Wait Until Element Is Visible    industry-option
    Wait Until Element Is Enabled    industry-option
    Click Element    industry-option
    Wait Until Element Is Visible    //button[@title='${industry}']
    Wait Until Element Is Enabled    //button[@title='${industry}']
    Click Button    //button[@title='${industry}']
    Wait Until Element Is Enabled    industry-option
    Capture Element Screenshot    industry-option
    Input Text And Take Screenshot    //input[@name='noEmployees']    ${noEmployees}    //input[@name='noEmployees']
    Scroll Element Into View    saveButton
    Input Text And Take Screenshot    //input[@name='address']    ${address}    //input[@name='address']
    Input Text And Take Screenshot    //input[@name='city']    ${city}    //input[@name='city']
    Input Text And Take Screenshot    //input[@name='state']    ${state}    //input[@name='state']
    Wait Until Element Is Enabled    saveButton
    Page Should Not Contain    ${externalName}
    Click Button    saveButton
    Wait Until Page Does Not Contain    Address 2
    Wait Until Page Contains    ${externalName}
    Capture Page Screenshot

*** Test Cases ***
Fill out a form with Excel #${trialNo}
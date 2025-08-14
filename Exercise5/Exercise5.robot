*** Settings ***
Documentation    Fill out a form multiple times with different random inputs
Library    SeleniumLibrary
Library    String
Suite Setup    General Setup
Resource    ../Keywords/Keywords.robot

*** Variables ***
${browser} =    Edge
${url}=    https://testpages.eviltester.com/styled/basic-html-form-test.html

*** Keywords ***
General Setup
    Set Selenium Speed    100 ms
    Set Selenium Implicit Wait    5 s

Initialize Browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Fill Out Form
    [Arguments]    ${trialNo}
    ${randomNo}=    Generate Random String    5    0123456789
    Input Text And Take Screenshot    //input[@name='username']    User #${trialNo}    //td[normalize-space()='Username:']
    Wait Until Element Is Visible    //input[@name='password']
    Wait Until Element Is Enabled    //input[@name='password']
    Input Text    //input[@name='password']    Aa!${randomNo}
    Click Element At Coordinates    //input[@name='password']    100    0
    Capture Element Screenshot    //td[normalize-space()='Password:']
    Input Text And Take Screenshot    //textarea[@name='comments']    Comment #${trialNo}    //tbody/tr[3]/td[1]
    Scroll Element Into View    //input[@value='submit']
    Wait Until Element Is Visible    //input[@name='filename']
    Wait Until Element Is Enabled    //input[@name='filename']
    Choose File And Take Screenshot    //input[@name='filename']    ${CURDIR}/White.png    //td[normalize-space()='Filename:']
    Wait Until Element Is Visible    //input[@value='cb1']
    Wait Until Element Is Enabled    //input[@value='cb1']
    Unselect Checkbox    //input[@value='cb1']
    Wait Until Element Is Visible    //input[@value='cb2']
    Wait Until Element Is Enabled    //input[@value='cb2']
    Unselect Checkbox    //input[@value='cb2']
    Wait Until Element Is Visible    //input[@value='cb3']
    Wait Until Element Is Enabled    //input[@value='cb3']
    Unselect Checkbox    //input[@value='cb3']
    Click On Random Option And Take Screenshot    //td[contains(text(),'Checkbox Items:')]
    ...    //input[@value='cb1']
    ...    //input[@value='cb2']
    ...    //input[@value='cb3']
    Click On Random Option And Take Screenshot    //td[contains(text(),'Radio Items:')]
    ...    //input[@value='rd1']
    ...    //input[@value='rd2']
    ...    //input[@value='rd3']
    Wait Until Element Is Visible    //select[@multiple="multiple"]
    Wait Until Element Is Enabled    //select[@multiple="multiple"]
    Unselect All From List    //select[@multiple="multiple"]
    Select From List By Random Index And Take Screenshot    //select[@multiple="multiple"]    //tbody/tr[7]/td[1]
    Select From List By Random Index And Take Screenshot    //select[@name='dropdown']    //tbody/tr[8]/td[1]
    Wait Until Element Is Visible    //input[@value='submit']
    Wait Until Element Is Enabled    //input[@value='submit']
    Page Should Not Contain    Processed Form Details
    Click Button    //input[@value='submit']
    Wait Until Page Contains    Processed Form Details
    Capture Page Screenshot

Finish Browser Usage
    Sleep    2s
    Close Browser

*** Test Cases ***
Fill out a form multiple times
    FOR    ${trial}    IN RANGE    1    11
        Initialize Browser
        Fill Out Form    ${trial}
        Finish Browser Usage
    END
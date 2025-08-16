*** Settings ***
Documentation    Try to log in with different username/pwd combinations from an Excel spreadsheet read via Python
Library    SeleniumLibrary
Library    BookHandler.py
Suite Setup    General Setup
Test Setup    Initialize Browser
Test Teardown    Finish Browser
Resource    ../Keywords/Keywords.robot

*** Variables ***
${browser} =    Edge
${url}=    https://the-internet.herokuapp.com/login

*** Keywords ***
General Setup
    Set Selenium Speed    10 ms
    Set Selenium Implicit Wait    5 s

Initialize Browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Title Should Be    The Internet

Finish Browser
    Sleep    2s
    Close Browser

*** Test Cases ***
Log in with Excel via Python
    Open File Sheet    Book.xlsx    Sheet1
    ${cols}=    Get Number Of Columns
    ${cols}=    Evaluate    ${cols}+1
    ${rows}=    Get Number Of Rows
    ${rows}=    Evaluate    ${rows}+1
    ${fieldRow}=    Evaluate    1
    ${value}=    Evaluate    None
    ${voidColCheck}=    Evaluate    None
    ${voidRowCheck}=    Evaluate    None

    FOR    ${row}    IN RANGE    2    ${rows}
        FOR    ${col}    IN RANGE    1    ${cols}
            ${voidRowCheck}=    Set Variable    ${voidColCheck}
            ${voidColCheck}=    Get Cell Value    ${row}    ${col}
            Exit For Loop If    '${voidColCheck}'=='None'
            ${field}=    Get Cell Value    ${fieldRow}    ${col}
            ${value}=    Get Cell Value    ${row}    ${col}
            Input Text And Take Screenshot    //input[@name="${field}"]    ${value}    //input[@name="${field}"]
        END
        Exit For Loop If    '${voidRowCheck}'=='None'
        Click Element    //i[@class='fa fa-2x fa-sign-in']
    END
    Capture Page Screenshot
*** Settings ***
Documentation    Fill a form making confirmations via Dialogs UI
Library    Dialogs
Library    SeleniumLibrary

Resource    ../Keywords/Keywords.robot

*** Variables ***
${url} =        https://demoqa.com/automation-practice-form

*** Test Cases ***
Take screenshots while making confirmations via Dialogs UI
    ${browser} =    Get Selection From User    Choose Browser    Edge    Chrome
    ${ms}=    Get Value From User    Input Selenium speed in ms
    Set Selenium Speed    ${ms} ms
    Set Selenium Implicit Wait    5 s

    Open Browser    ${url}    ${browser}
    Title Should Be    DEMOQA
    Maximize Browser Window

    Input Text and take screenshot    firstName    Robert    userName-wrapper
    Input Text And Take Screenshot    lastName    Mahler    userName-wrapper
    Input Text And Take Screenshot    userEmail    MahlerR@mail.com    userEmail-wrapper
    Scroll Element Into View    genterWrapper
    Execute Javascript    window.scrollBy(0,100)
    Click Element and Take Screenshot    //label[contains(@for,'gender-radio-1')]    genterWrapper
    Input Text And Take Screenshot    userNumber    5628394421    userNumber-wrapper
    Wait Until Element Is Visible    dateOfBirthInput
    Wait Until Element Is Enabled    dateOfBirthInput
    Click Element    dateOfBirthInput
    Select From List By Label And Take Screenshot    //select[@class="react-datepicker__month-select"]    November    //select[@class="react-datepicker__month-select"]
    Select From List By Label And Take Screenshot    //select[@class="react-datepicker__year-select"]    2050    //select[@class="react-datepicker__year-select"]
    Wait Until Element Is Visible    //div[@aria-label='Choose Saturday, November 19th, 2050']
    Wait Until Element Is Enabled    //div[@aria-label='Choose Saturday, November 19th, 2050']
    Click Element    //div[@aria-label='Choose Saturday, November 19th, 2050']
    Capture Element Screenshot    dateOfBirth-wrapper
    Scroll Element Into View    subjectsWrapper
    Execute Javascript    window.scrollBy(0,100)
    Wait Until Element Is Visible    //div[@class='subjects-auto-complete__value-container subjects-auto-complete__value-container--is-multi css-1hwfws3']
    Wait Until Element Is Enabled    //div[@class='subjects-auto-complete__value-container subjects-auto-complete__value-container--is-multi css-1hwfws3']
    Press Keys    //div[@class='subjects-auto-complete__value-container subjects-auto-complete__value-container--is-multi css-1hwfws3']    Eng
    Click Element At Coordinates    //div[@class='subjects-auto-complete__value-container subjects-auto-complete__value-container--is-multi css-1hwfws3']    0    50
    Capture Element Screenshot    subjectsWrapper
    Click Element And Take Screenshot    //label[@for='hobbies-checkbox-3']    hobbiesWrapper
    Choose File And Take Screenshot    uploadPicture    ${CURDIR}/Robert.png    //div[@class="form-file"]
    Input Text And Take Screenshot    currentAddress    Address_1    currentAddress-wrapper
    Scroll Element Into View    state
    Execute Javascript    window.scrollBy(0,100)
    Wait Until Element Is Visible    state
    Wait Until Element Is Enabled    state
    Click Element    state
    Press Keys     state    Ha
    click element at coordinates    state    0    50
    Capture Element Screenshot    stateCity-wrapper
    Wait Until Element Is Visible    city
    Wait Until Element Is Enabled    city
    Click Element    city
    Press Keys     city    Pa
    click element at coordinates    city    0    50
    Capture Element Screenshot    stateCity-wrapper
    Page Should Not Contain    Thanks for submitting the form
    Execute Manual Step    Ready to submit?
    Scroll Element Into View    submit
    Execute Javascript    window.scrollBy(0,200)
    Click Button    submit
    Wait Until Page Contains    Thanks for submitting the form
    Capture Page Screenshot

    Sleep    2s
    Close Browser
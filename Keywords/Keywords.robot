*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Input Text and take screenshot
    [Documentation]    Verifies if element is enabled, inputs text and takes screenshot of the element
    [Arguments]    ${Locator}    ${Text}    ${LocatorScreenshot}
    Wait Until Element Is Visible    ${Locator}
    Wait Until Element Is Enabled    ${Locator}
    Input Text    ${Locator}    ${Text}
    Capture Element Screenshot    ${LocatorScreenshot}

Click Element and Take Screenshot
    [Documentation]    Verifies if element is enabled, clicks it and takes screenshot of the whole element
    [Arguments]    ${ClickableLocator}    ${ScreenshotLocator}
    Wait Until Element Is Visible    ${ClickableLocator}
    Wait Until Element Is Enabled    ${ClickableLocator}
    Click Element    ${ClickableLocator}
    Capture Element Screenshot    ${ScreenshotLocator}

Select From List By Label and Take Screenshot
    [Documentation]    Verifies if element is enabled, selects from list and takes screenshot
    [Arguments]    ${Locator}    ${Label}    ${ScreenshotLocator}
    Wait Until Element Is Visible    ${Locator}
    Wait Until Element Is Enabled    ${Locator}
    Select From List By Label    ${Locator}    ${Label}
    Capture Element Screenshot    ${ScreenshotLocator}

Choose File And Take Screenshot
    [Documentation]    Verifies if element is enabled, uploads a file and takes screenshot
    [Arguments]    ${Locator}    ${FileName}    ${ScreenshotLocator}
    Wait Until Element Is Visible    ${Locator}
    Wait Until Element Is Enabled    ${Locator}
    Choose File    ${Locator}    ${FileName}
    Capture Element Screenshot    ${ScreenshotLocator}
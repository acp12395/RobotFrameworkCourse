*** Settings ***
Documentation    Tests to check different User[correct, wrong]/Password[correct, wrong] combinations
Library    SeleniumLibrary

*** Variables ***
${url} =        https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser} =    Edge

*** Test Cases ***
Login: Void User and PW
    [Documentation]    Test for User = "", PW = ""
    [Tags]    0_VoidUser_VoidPW    VoidUser    VoidPW
    Set Selenium Speed    100 ms
    Set Selenium Implicit Wait    5 s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Title Should Be    OrangeHRM
    Execute Javascript    window.scrollBy(0,200)

    Page Should Not Contain    Required
    Click Button    //button[@type='submit']
    Page Should Contain Element    //div[@class='orangehrm-login-slot-wrapper']//div[1]//div[1]//span[1]
    Page Should Contain Element    //div[@class='orangehrm-login-form']//div[2]//div[1]//span[1]
    Page Should Contain    Required

    Sleep    2s
    close browser

Login: Void User and invalid PW
    [Documentation]    Test for User = "", PW = "Admin123"
    [Tags]    1_VoidUser_InvalidPW    VoidUser    InvalidPW
    Set Selenium Speed    100 ms
    Set Selenium Implicit Wait    5 s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Title Should Be    OrangeHRM
    Execute Javascript    window.scrollBy(0,200)

    Page Should Not Contain    Required

    Input Text    //input[@name='password']    Admin123
    Click Button    //button[@type='submit']
    Page Should Contain Element    //div[@class='orangehrm-login-slot-wrapper']//div[1]//div[1]//span[1]
    Page Should Not Contain Element    //div[@class='orangehrm-login-form']//div[2]//div[1]//span[1]
    Page Should Contain    Required

    Sleep    2s
    close browser

Login: Void User and valid PW
    [Documentation]    Test for User = "", PW = "admin123"
    [Tags]    2_VoidUser_ValidPW    VoidUser    ValidPW
    Set Selenium Speed    100 ms
    Set Selenium Implicit Wait    5 s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Title Should Be    OrangeHRM
    Execute Javascript    window.scrollBy(0,200)

    Page Should Not Contain    Required

    Input Text    //input[@name='password']    admin123
    Click Button    //button[@type='submit']
    Page Should Contain Element    //div[@class='orangehrm-login-slot-wrapper']//div[1]//div[1]//span[1]
    Page Should Not Contain Element    //div[@class='orangehrm-login-form']//div[2]//div[1]//span[1]
    Page Should Contain    Required

    Sleep    2s
    close browser

Login: Invalid User and void PW
    [Documentation]    Test for User = "admin123", PW = ""
    [Tags]    3_InvalidUser_VoidPW    InvalidUser    VoidPW
    Set Selenium Speed    100 ms
    Set Selenium Implicit Wait    5 s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Title Should Be    OrangeHRM
    Execute Javascript    window.scrollBy(0,200)

    Page Should Not Contain    Required

    Input Text    //input[@placeholder='Username']    admin123
    Click Button    //button[@type='submit']
    Page Should Not Contain Element    //div[@class='orangehrm-login-slot-wrapper']//div[1]//div[1]//span[1]
    Page Should Contain Element    //div[@class='orangehrm-login-form']//div[2]//div[1]//span[1]
    Page Should Contain    Required

    Sleep    2s
    close browser

Login: Invalid User and invalid PW
    [Documentation]    Test for User = "admin123", PW = "Admin123"
    [Tags]    4_InvalidUser_InvalidPW    InvalidUser    InvalidPW
    Set Selenium Speed    100 ms
    Set Selenium Implicit Wait    5 s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Title Should Be    OrangeHRM
    Execute Javascript    window.scrollBy(0,200)

    Page Should Not Contain    Invalid credentials

    Input Text    //input[@placeholder='Username']    admin123
    Input Text    //input[@name='password']    Admin123
    Click Button    //button[@type='submit']
    Page Should Contain Element    //p[@class='oxd-text oxd-text--p oxd-alert-content-text']
    Page Should Contain    Invalid credentials

    Sleep    2s
    close browser

Login: Invalid User and valid PW
    [Documentation]    Test for User = "admin123", PW = "admin123"
    [Tags]    5_InvalidUser_ValidPW    InvalidUser    ValidPW
    Set Selenium Speed    100 ms
    Set Selenium Implicit Wait    5 s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Title Should Be    OrangeHRM
    Execute Javascript    window.scrollBy(0,200)

    Page Should Not Contain    Invalid credentials

    Input Text    //input[@placeholder='Username']    admin123
    Input Text    //input[@name='password']    admin123
    Click Button    //button[@type='submit']
    Page Should Contain Element    //p[@class='oxd-text oxd-text--p oxd-alert-content-text']
    Page Should Contain    Invalid credentials

    Sleep    2s
    close browser

Login: Valid User and void PW
    [Documentation]    Test for User = "Admin", PW = ""
    [Tags]    6_ValidUser_VoidPW    ValidUser    VoidPW
    Set Selenium Speed    100 ms
    Set Selenium Implicit Wait    5 s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Title Should Be    OrangeHRM
    Execute Javascript    window.scrollBy(0,200)

    Page Should Not Contain    Required

    Input Text    //input[@placeholder='Username']    Admin
    Click Button    //button[@type='submit']
    Page Should Not Contain Element    //div[@class='orangehrm-login-slot-wrapper']//div[1]//div[1]//span[1]
    Page Should Contain Element    //div[@class='orangehrm-login-form']//div[2]//div[1]//span[1]
    Page Should Contain    Required

    Sleep    2s
    close browser

Login: Valid User and invalid PW
    [Documentation]    Test for User = "Admin", PW = "Admin123"
    [Tags]    7_ValidUser_InvalidPW    ValidUser    InvalidPW
    Set Selenium Speed    100 ms
    Set Selenium Implicit Wait    5 s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Title Should Be    OrangeHRM
    Execute Javascript    window.scrollBy(0,200)

    Page Should Not Contain    Invalid credentials

    Input Text    //input[@placeholder='Username']    Admin
    Input Text    //input[@name='password']    Admin123
    Click Button    //button[@type='submit']
    Page Should Contain Element    //p[@class='oxd-text oxd-text--p oxd-alert-content-text']
    Page Should Contain    Invalid credentials

    Sleep    2s
    close browser

Login: Valid User and valid PW
    [Documentation]    Test for User = "Admin", PW = "admin123"
    [Tags]    8_ValidUser_ValidPW    ValidUser    ValidPW
    Set Selenium Speed    100 ms
    Set Selenium Implicit Wait    5 s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Title Should Be    OrangeHRM
    Execute Javascript    window.scrollBy(0,200)

    Page Should Not Contain    Invalid credentials

    Input Text    //input[@placeholder='Username']    Admin
    Input Text    //input[@name='password']    admin123
    Click Button    //button[@type='submit']
    Page Should Not Contain Element    //p[@class='oxd-text oxd-text--p oxd-alert-content-text']
    Page Should Not Contain    Invalid credentials

    Sleep    2s
    close browser
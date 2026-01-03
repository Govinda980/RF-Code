*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Google
Suite Teardown    Close All Browsers
Test Teardown     Capture Page Screenshot

*** Variables ***
${BROWSER}        chrome
${URL}            https://www.google.com
${SEARCH_TEXT}    Robot Framework SeleniumLibrary

*** Test Cases ***

Verify Google Page Title
    Title Should Be    Google

Verify Search Box Visibility
    Wait Until Element Is Visible    name=q    10s
    Element Should Be Visible        name=q

Search Using Enter Key
    Input Text    name=q    ${SEARCH_TEXT}
    Press Keys    name=q    ENTER
    Wait Until Page Contains    Robot Framework

Validate Search Results Page
    Page Should Contain    SeleniumLibrary
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Navigate Back To Home
    Go Back
    Wait Until Element Is Visible    name=q    10s

Clear And Re-enter Text
    Clear Element Text    name=q
    Input Text    name=q    Robot Framework automation

Keyboard Shortcuts
    Press Keys    name=q    CTRL+A
    Press Keys    name=q    BACKSPACE

Mouse Action (Click Search Button)
    Input Text    name=q    Robot Framework
    Press Keys    name=q    ENTER
    Wait Until Page Contains    Robot

JavaScript Validation
    ${title}=    Execute JavaScript    return document.title
    Log    ${title}

Screenshot Of Search Box
    Wait Until Element Is Visible    name=q    10s
    Scroll Element Into View         name=q
    Capture Element Screenshot       name=q

*** Keywords ***

Open Google
    Open Browser
    ...    ${URL}
    ...    ${BROWSER}
    ...    options=add_argument("--headless"),
    ...            add_argument("--no-sandbox"),
    ...            add_argument("--disable-dev-shm-usage"),
    ...            add_argument("--window-size=1920,1080")
    Set Window Size    1920    1080
    Set Selenium Implicit Wait    5s

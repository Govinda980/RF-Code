*** Keywords ***
Open Google
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Open Browser    https://www.google.com    chrome    options=${options}
    Maximize Browser Window
    Set Selenium Implicit Wait    5s

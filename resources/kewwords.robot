*** Keywords ***
Open Google
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size=1920,1080
    Open Browser    https://www.google.com    chrome    options=${options}
    Set Window Size    1920    1080
    Set Selenium Implicit Wait    5s

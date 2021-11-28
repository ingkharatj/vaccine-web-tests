*** Settings ***
# Documentation     Reusable keywords and variables.
Library           SeleniumLibrary

*** Variables ***
${URL}      https://vaccine-haven.herokuapp.com/
${BROWSER_TYPE}  Chrome
${CITIZEN_ID}  9601054596041
${SITE_NAME}  OGYHSite
${Vaccine}  Astra

*** Test Cases ***

Verify 2 items on Home Page
    Open Home Page
    Verify Registration 
    Set Selenium Speed    1 seconds
    Verify Reservation 
    Set Selenium Speed    1 seconds


Click and Create Reservation
	Click Button    Reserve Vaccine
    Wait Until Page Contains Element    id:citizen_id
    Input Text                          id:citizen_id      ${CITIZEN_ID}
    Select From List By Value           id:site_name       ${SITENAME}
    Select From List By Value           id:vaccine_name    ${Vaccine}
	Click Button    Submit



*** Keywords ***

Open Home Page
    Set Selenium Speed    0.5 seconds
    Open Browser    ${URL}    ${BROWSER_TYPE}
    Title Should Be    Vaccine Haven
    

Verify Registration
    Wait Until Page Contains    Citizen Registration
	Click Button    Register
    Go Back

Verify Reservation
    Wait Until Page Contains    Vaccine Reservation
	Click Button    Reserve Vaccine
    Go Back





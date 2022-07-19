*** Settings ***
Documentation    Searched bitopro website via google browser
Library          SeleniumLibrary
Suite Teardown   Close Browser

*** Variables ***
${TIMEOUT}  5
${BROWSER}  Chrome
${URL_GOOGLE}  https://www.google.com
${GOOGLE_SEARCHED_BAR}  name=q

*** Test Cases ***
Valid Searched Result
    Open Browser    ${URL_GOOGLE}    ${BROWSER}
    Title Should Be    Google
    Wait Until Element Is Visible  ${GOOGLE_SEARCHED_BAR}  ${TIMEOUT}
    Input Text  ${GOOGLE_SEARCHED_BAR}  BitoPro
    Press Keys  ${GOOGLE_SEARCHED_BAR}  RETURN
    ${text}=  Get Text  class=LC20lb.MBeuO.DKV0Md
    Should Be True  '${text}'=='BitoPro 台灣幣託交易所'
    ${link}=  Get Element Attribute  xpath=//*[@id="rso"]/div[1]/div/div/div/div/div/div[1]/a  href
    Should Be True  '${link}'=='https://www.bitopro.com/'
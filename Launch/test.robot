*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Test Setup  Open Browser Max Size

*** Variables ***
${login}                            89856615000
${password}                         Pf,bzrf8504.
${captcha_location}                 Captchas/captcha.png

*** Test Cases ***
Launch Case
    Wait And Click                  //*[@id="top_panel"]/a

    Login By Credentials

    Wait And Click                  //*[@id="wrapperId"]/div/nav/div[1]/ul[1]/li[4]/div

    ${key}  Wait And Get Text       //*[@id="wrapperId"]/div/div[5]/div/div/ng-form/div/div[1]/div[2]/strong

    Go To                           https://rosreestr.ru/wps/portal/p/cc_present/ir_egrn

    Wait And Input                  //*[@id="v-Z7_01HA1A42KODT90AR30VLN22003"]/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div/div/div/div/div[2]/div/div/div/div[2]/div/div/div[1]/div/input  ${key}
    Click Element                   //*[@id="v-Z7_01HA1A42KODT90AR30VLN22003"]/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div/div

    Do Full Iteration
    Do Full Iteration
    Do Full Iteration

*** Keywords ***
Open Browser Max Size
    Open Browser                    https://rosreestr.ru  chrome
#    Maximize Browser Window

Login By Credentials
    Wait And Input                 //*[@id="mobileOrEmail"]     ${login}
    Input Text                     //*[@id="password"]          ${password}
    Click Element                  //*[@id="loginByPwdButton"]

Wait And Click
    [Arguments]  ${locator}  ${timeout}=15s
    Wait Until Element Is Enabled  ${locator}  ${timeout}
    Click Element                  ${locator}

Wait And Input
    [Arguments]  ${locator}  ${text}  ${timeout}=15s
    Wait Until Element Is Enabled  ${locator}  ${timeout}
    Input Text                     ${locator}  ${text}

Wait And Get Text
    [Arguments]  ${locator}  ${timeout}=15s
    Wait Until Element Is Enabled  ${locator}  ${timeout}
    ${result}  Get Text            ${locator}
    [Return]                       ${result}

Solve Captcha
    ${file}  Get Binary File  ${captcha_location}
    Create Session  xEvil  http://127.0.0.1:80
    ${files}  Create Dictionary  file=${file}
    ${response}  Post Request  xEvil  /in.php  files=${files}
    ${strip}  Strip String  ${response.text}  characters=OK|*
    ${response}  Get Request  xEvil  /res.php?id=${strip}&action=get
    ${strip}  Strip String  ${response.text}  characters=OK|*
    Log To Console  ${strip}
    [Return]  ${strip}

Do Full Iteration
    Wait And Click                  //*[@id="v-Z7_01HA1A42KODT90AR30VLN22003"]/div/div[2]/div/div[1]/div/div/div/div[1]/div/div/div/div[1]/div/div/div/div/div[1]/div/div/span/span

    Wait And Input                  //*[@id="v-Z7_01HA1A42KODT90AR30VLN22003"]/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[2]/div/div/div[2]/div/div/div/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div/div/div/div[1]/div/div/div/div[1]/div/input  50:15:0000000:33365
    Input Text                      //*[@id="v-Z7_01HA1A42KODT90AR30VLN22003"]/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[2]/div/div/div[2]/div/div/div/div/div[2]/div/div/div/div[3]/div/div/div/div[1]/div/div/div/div[1]/div/div/div/div[1]/div/div/div/div[1]/div[1]/div/input  Московская область
    Wait And Click                  //*[@id="VAADIN_COMBOBOX_OPTIONLIST"]/div/div[2]/table/tbody/tr/td/span
    Click Element                   //*[@id="v-Z7_01HA1A42KODT90AR30VLN22003"]/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[3]/div/div/div/div[1]/div/div/div/div[1]/div/div

    Wait And Click                  //*[@id="v-Z7_01HA1A42KODT90AR30VLN22003"]/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[5]/div/div/div[2]/div[1]/table/tbody/tr

    Wait Until Element Is Enabled   //*[@id="v-Z7_01HA1A42KODT90AR30VLN22003"]/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div/div/div/div[3]/div/div/div/div[1]/div/div/div/div[2]/div/div/div/div[1]/div/div/img  15s
    Sleep  1s
    Capture Element Screenshot      //*[@id="v-Z7_01HA1A42KODT90AR30VLN22003"]/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div/div/div/div[3]/div/div/div/div[1]/div/div/div/div[2]/div/div/div/div[1]/div/div/img  ${captcha_location}
    ${captcha_text}  Solve Captcha
    Wait And Click                  //*[@id="v-Z7_01HA1A42KODT90AR30VLN22003"]/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div/div/div/div[3]/div/div/div/div[1]/div/div/div/div[3]/div/div/div/div[1]/div/div/div/div[1]/div/input
    Wait And Input                  //*[@id="v-Z7_01HA1A42KODT90AR30VLN22003"]/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div/div/div/div[3]/div/div/div/div[1]/div/div/div/div[3]/div/div/div/div[1]/div/div/div/div[1]/div/input  ${captcha_text}
    Wait And Click                  //*[@id="v-Z7_01HA1A42KODT90AR30VLN22003"]/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div/div/div/div[4]/div/div/div/div[1]/div/div/div/div[1]
    Sleep  5s
    Press Keys                      None  ESCAPE
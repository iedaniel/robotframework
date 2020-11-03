*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  OperatingSystem
Library  Collections
Library  String

*** Test Cases ***
Launch Case
    ${file}  Get Binary File               Captchas/captcha.png
    Create Session                  mySession       http://127.0.0.1:80
    ${files}  Create dictionary      file=${file}
    ${resp}  Post Request           mySession  /in.php  files=${files}
    ${words}  Split String  ${resp.text}  separator=|
    ${res}  Get Request  mySession  /res.php?id=${words[1]}&action=get
    ${ans}  Split String  ${res.text}  separator=|
    Log To Console  ${ans[1]}
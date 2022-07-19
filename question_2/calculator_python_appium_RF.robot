*** Settings ***
Documentation    Calculate numbers by android device
Library          AppiumLibrary

*** Variables ***
${TIMEOUT}  10
${APPIUM_SERVER}   http://127.0.0.1:4723/wd/hub
${ANDROID_OS_VERSION}  10
${ANDROID_UUID}  AS201WW215100019
${PACKAGE_NAME}  com.android.calculator2
${LOCATOR_BTN_0}  id=com.android.calculator2:id/digit_0
${LOCATOR_BTN_1}  id=com.android.calculator2:id/digit_1
${LOCATOR_BTN_2}  id=com.android.calculator2:id/digit_2
${LOCATOR_BTN_3}  id=com.android.calculator2:id/digit_3
${LOCATOR_BTN_4}  id=com.android.calculator2:id/digit_4
${LOCATOR_BTN_5}  id=com.android.calculator2:id/digit_5
${LOCATOR_BTN_6}  id=com.android.calculator2:id/digit_6
${LOCATOR_BTN_7}  id=com.android.calculator2:id/digit_7
${LOCATOR_BTN_8}  id=com.android.calculator2:id/digit_8
${LOCATOR_BTN_9}  id=com.android.calculator2:id/digit_9
${LOCATOR_BTN_+}  id=com.android.calculator2:id/op_add
${LOCATOR_BTN_=}  id=com.android.calculator2:id/eq
${LOCATOR_RESULT}  id=com.android.calculator2:id/result

*** Test Cases ***
Caluator 1+2+..+10
    ${driver}=  Open Application  ${APPIUM_SERVER}  platformName=android
    ...  platformVersion=${ANDROID_OS_VERSION}  deviceName=${ANDROID_UUID}
    ...  automationName=uiautomator2  alias=mobile

    Wait And Click  ${LOCATOR_BTN_1}
    Wait And Click  ${LOCATOR_BTN_+}
    Wait And Click  ${LOCATOR_BTN_2}
    Wait And Click  ${LOCATOR_BTN_+}
    Wait And Click  ${LOCATOR_BTN_3}
    Wait And Click  ${LOCATOR_BTN_+}
    Wait And Click  ${LOCATOR_BTN_4}
    Wait And Click  ${LOCATOR_BTN_+}
    Wait And Click  ${LOCATOR_BTN_5}
    Wait And Click  ${LOCATOR_BTN_+}
    Wait And Click  ${LOCATOR_BTN_6}
    Wait And Click  ${LOCATOR_BTN_+}
    Wait And Click  ${LOCATOR_BTN_7}
    Wait And Click  ${LOCATOR_BTN_+}
    Wait And Click  ${LOCATOR_BTN_8}
    Wait And Click  ${LOCATOR_BTN_+}
    Wait And Click  ${LOCATOR_BTN_9}
    Wait And Click  ${LOCATOR_BTN_+}
    Wait And Click  ${LOCATOR_BTN_1}
    Wait And Click  ${LOCATOR_BTN_0}
    Wait And Click  ${LOCATOR_BTN_=}
    ${result}=  Wait And Get Text  ${LOCATOR_RESULT}
    Should Be True  ${result}==55



*** Keywords ***
Wait And Click
    [Arguments]  ${locator}
    Wait Until Page Contains Element  ${locator}  timeout=${TIMEOUT}
    Click Element  ${locator}

Wait And Get Text
    [Arguments]  ${locator}
    Wait Until Page Contains Element  ${locator}  timeout=${TIMEOUT}
    ${text}=  Get Text  ${locator}
    [Return]  ${text}

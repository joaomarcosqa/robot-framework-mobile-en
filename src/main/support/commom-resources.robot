*** Comments ***
Documentation
... Suite with common system features
... Resources used in all scenarios

*** Settings ***
Resource    base.robot

*** Variables ***
#Android
${Url}                              http://localhost:4723/wd/hub
${DeviceAndroid}                    Android Emulator
${Apk}                              ${EXECDIR}/src/main/support/app/android.apk
${AndroidAutomationName}            UIAutomator2  
${AndroidPlatformName}              Android
${AndroidUdid}                      emulator-5554
${AndroidBuild}                     Set Build
${AndroidOsVersion}                 10.0

#Ios
${DeviceIOS}                       iPhone
${App}                             ${EXECDIR}/src/main/support/app/ios.app
${IosUdid}                         Set Udid
${IosPlatformVersion}              15.4
${IosPlatformName}                 ios
${IosAutomationName}               XCUITest
${IosOsVersion}                    13.0
${IosBuild}                        Set Build

# Browserstack
${UserName}                        Set Browserstcack User Name
${AccessKey}                       Set Browserstcack Access Key
${AppId}                           Set Browserstcack App Id
${TestName}                        Set Test Name
${Project}                         Set Project
${IosDevice}                       Iphone 11
${AndroidDevice}                   Google Pixel 3

*** Keywords ***
Open App
    Set Appium Timeout    60
    IF    "${device}" == "android"    Start Android
    IF    "${device}" == "ios"    Start IOS
    IF    "${device}" == "browserstack-android"    Start Browserstack Android
    IF    "${device}" == "browserstack-ios"    Start Browserstack Ios

Close App
    Capture Page Screenshot
    Close Application

Start Android
    Open Application    ${Url}
    ...    automationName=${AndroidAutomationName}
    ...    platformName=${AndroidPlatformName}
    ...    DeviceName=${DeviceAndroid}
    ...    app=${Apk}
    ...    udid=${AndroidUdid}
    ...    autoGrantPermissions=true

Start IOS
    Open Application    ${Url}
    ...    automationName=${IosAutomationName}
    ...    platformName=${IosPlatformName}
    ...    platformVersion=${IosPlatformVersion}
    ...    DeviceName=${DeviceIOS}
    ...    app=${App}
    ...    udid=${IosUdid}
    ...    autoGrantPermissions=true

Start Browserstack Android
    Set Appium Timeout    600
    Open Application    https://${UserName}:${AccessKey}@hub-cloud.browserstack.com/wd/hub
    ...    platformName=${AndroidPlatformName}
    ...    app=${AppId}
    ...    DeviceName=${DeviceAndroid}
    ...    Device=${AndroidDevice}
    ...    os_version=${AndroidOsVersion}
    ...    project=${Project}
    ...    build=${AndroidBuild}
    ...    name=${TestName}
    ...    autoGrantPermissions=true

Start Browserstack Ios
    Set Appium Timeout    600
    Open Application    https://${UserName}:${AccessKey}@hub-cloud.browserstack.com/wd/hub
    ...    automationName=${IosAutomationName}
    ...    platformName=${IosPlatformName}
    ...    platformVersion=${IosPlatformVersion}
    ...    DeviceName=${DeviceIOS}
    ...    Device=${IosDevice}
    ...    os_version=${IosOsVersion}
    ...    project=${Project}
    ...    build=${IosBuild}
    ...    name=${TestName}
    ...    udid=${IosUdid}
    ...    autoGrantPermissions=true
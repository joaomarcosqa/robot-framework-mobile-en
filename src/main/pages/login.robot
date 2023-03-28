*** Comments ***
Documentation
... Suite with login variables

*** Settings ***
Resource    ../support/base.robot

*** Variables ***
${loginVariable}            loginVariable

*** Keywords ***

Define keyword
    Wait Until Element Is Visible        $${loginVariable}
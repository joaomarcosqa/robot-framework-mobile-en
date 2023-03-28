*** Comments ***
Documentation
...Suite with login tests

*** Settings ***
Resource            ../main/support/base.robot
Resource            ../main/pages/login.robot

Test Setup          Open App
Test Teardown       Close App

*** Test Cases ***
Test Case 001: name of test
    Given im on the app    45555551850    123456
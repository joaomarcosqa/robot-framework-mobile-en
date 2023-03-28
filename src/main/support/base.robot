*** Comments ***
Documentation
... Suite with base system features
... Resources used in all scenarios

*** Settings ***
Library     FakerLibrary    locale=pt_BR
Library     AppiumLibrary
Resource    commom-resources.robot

*** Variables ***
#primeiro xpath sempre ios usando o * para nao ter problemas, segundo sempre android pode ser usado qualquer Elemento
#Login
${UserEmailOrCpfTextField}              //*[@name='nameTitleLabel' or @text='Digite seu e-mail ou CPF']
${UserPasswordTextfield}                //*[@name='nameTitleLabel' or @text='Digite sua senha']
${Submit}                               //*[@name='nameTitleLabel' or @text='Entrar']

#cadastro
${firstNameTextField}                   //*[@name='nameTitleLabel' or @text='Entrar']
${LastNameTextField}                    //*[@name='nameTitleLabel' or @text='Entrar']
${EmailTextField}                       //*[@name='nameTitleLabel' or @text='Entrar']
${PasswordTextField}                    //*[@name='nameTitleLabel' or @text='Entrar']
${registerButton}                       //*[@name='nameTitleLabel' or @text='Entrar']

*** Keywords ***
Given im on the app
    [Arguments]        ${EmailOrCpf}        ${Password}
    Fill in Login    ${EmailOrCpf}    ${Password}
    Sleep    15

Fill in Login
    [Arguments]    ${Email}    ${Password}
    Validate and Input Text    ${UserEmailOrCpfTextField}    ${Email} 
    Validate and Input Text    ${UserPasswordTextfield}    ${Password}
    Click Element    ${Submit}

# Filling login
# Quando inserir dados validos
    # Run Keyword    Fill in Login    ${EmailTextfield}    ${Email}    ${Password}

Fill in Registration
    [Arguments]       ${firstName}       ${LastName}        ${Email}        ${Password}    
    Wait Until Element Is Visible    ${firstNameTextField}
    Input Text    ${firstNameTextField}    ${firstName}
    Input Text    ${LastNameTextField}    ${LastName}
    Input Text    ${EmailTextField}    ${Email}
    Input Text    ${PasswordTextField}    ${Password}
    Click Element    ${RegisterButton}

# Filling Registration
# Quando inserir dados validos no cadastro
#    ${firstName}    FakerLibrary.Name
#    ${LastName}    FakerLibrary.Name
#    ${Email}    FakerLibrary.Email
#    ${Password}    FakerLibrary.Password
#    Run Keyword    Fill in registration    ${firstNameTextField}    ${firstName}    ${LastNameTextField}    ${LastName}    ${EmailTextField}    ${Email}    ${PasswordTextField}    ${Password}    ${registerButton}

Validate and Input Text
    [Arguments]    ${Locator}    ${String}
    Wait Until Element Is Visible    ${Locator}    30
    Input Text    ${Locator}    ${String}

# Validating and typing Texts
    # Validate And Input Text    ${EmailTextfield}    teste
    # Validate And Input Text    ${PasswordTextfield}    teste

Validate and Click Button
    [Arguments]    ${Locator}
    Wait Until Element Is Visible    ${Locator}    30
    Click Element    ${Locator}

# Validating and Click Button
    # Validate And Click Button    ${Submit}

Inspect if Text Exists and Confirm
    [Arguments]    ${Text}
    FOR    ${index}    IN RANGE    1
        ${CheckElement}=    Run Keyword and Return Status    Wait Until Page Contains    ${Text}
        LOG    ${CheckElement}
        IF    ${CheckElement} == True
            Click Text    ${Text}
        ELSE
            Wait Until Page Contains    ${Text}
        END
    END

Inspect if Element Exists and Confirm
    [Arguments]    ${Locator}    ${ElementVisible}
    FOR    ${index}    IN RANGE    5
        ${CheckElement}=    Run Keyword and Return Status    Wait Until Page Contains Element    ${Locator}
        LOG    ${CheckElement}
        IF    ${CheckElement} == True
            Click Element    ${Locator}
            Click Element    ${ElementVisible}
            Sleep    2
            Click Element    ${Locator}
            Sleep    2
        ELSE
            Page Should Contain Text    Você ainda não tem cadastro
        END
    END

Swipe Until Element is Visible
    [Arguments]    ${Element}
    FOR    ${i}    IN RANGE    400
        ${Result}=    Run KeyWord And Return Status    Element Should Be Visible    ${Element}
        IF    ${Result}    BREAK
        Swipe    700    1300    700    300
    END

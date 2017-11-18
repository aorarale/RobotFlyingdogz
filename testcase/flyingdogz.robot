*** Settings ***
Library    Selenium2Library

*** Variables ***
${Flyingdogz_URL}    https://flyingdogz.github.io/
${Browser}    chrome

${txt_username_locator}    //*[@name="username"]
${txt_password_locator}    //*[@name="password"]

${txt_verify_table_userlist_locator}    xpath=//div[@class="panel-heading"][contains(text(), 'User List')]
${txt_verify_user_initial_locator}    xpath=//table[@class="table table-hover"]//tr//td[contains(text(), 'Username')]
${txt_verify_newUser_locator}    xpath=//table[@class="table table-hover"]//tr[last()]//td[contains(text(), 'user2')]

${txt_newUserName_locator}    //*[@name="newUserName"]
${txt_newUserPassword_locator}    //*[@name="newUserPassword"]

${button_login_locator}    //*[@class="btn btn-primary"]
${button_add_locator}    //*[@class="btn btn-primary"]
${button_delete_locator}    xpath=//table[@class="table table-hover"]//tr[last()]//span[contains(@class,'glyphicon glyphicon-trash')]

${set_username}    admin
${set_password}    1234
${set_newusername}    user2
${set_newuserpassword}    1234

*** Keyword ***
Input Username
    [Arguments]    ${username}
    Input Text    ${txt_username_locator}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${txt_password_locator}    ${password}

Click Login
    Click Element    ${button_login_locator}

Verify Table UserList
    Page Should Contain Element    ${txt_verify_table_userlist_locator}

Verify User Initial
    Page Should Contain Element    ${txt_verify_user_initial_locator}

Input NewUserName
    [Arguments]    ${new_username}
    Input Text    ${txt_newUserName_locator}    ${new_username}

Input NewUserPassword
    [Arguments]    ${new_user_password}
    Input Text    ${txt_newUserPassword_locator}    ${new_user_password}

Click Add NewUser
    Click Element    ${button_add_locator}

Verify NewUser
    Page Should Contain Element    ${txt_verify_newUser_locator}

Click Delete
    Click Element    ${button_delete_locator}

*** Test Cases ***

TC_01_Login website using User: admin, Password: 1234
    Open Browser    ${Flyingdogz_URL}    ${Browser}
    Sleep    1s

    Input Username    ${set_username}
    Input Password    ${set_password}
    Wait Until Element Is Visible    ${txt_password_locator}
    Sleep    2s

    Click Login
    Sleep    1s

TC_02_Verify table User List and one user as initial.
    Verify Table UserList
    Verify User Initial
    Sleep    1s

TC_03_Add new user by adding New User Name and New User Password and click Add button.
    Input NewUserName    ${set_newusername}
    Input NewUserPassword    ${set_newuserpassword}
    Wait Until Element Is Visible    ${txt_newUserPassword_locator}
    Sleep    2s

    Click Add NewUser
    Sleep    1s

TC_04_Verify new user is added to User List table.
    Verify NewUser
    Sleep    1s

TC_05_Delete the user created in step 3 by clicking Bin button.
    Click Delete
    Sleep    1s

    Close Browser


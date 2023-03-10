*** settings ***
Library          SeleniumLibrary

*** variables ***
${BROWSER}                          chrome
${URL}                              https://abhigyank.github.io/To-Do-List/
${INPUT_Task}                       //*[@id="new-task"]
${ADD_BUTTON}                       //*[@id="add-item"]/button/i
${ADD_ITEM}                         //html/body/div[1]/div/div[1]/a[1]
${TO_DO_TASKS}                      //html/body/div[1]/div/div[1]/a[2]
${COMPLETED_Tasks}                  //html/body/div[1]/div/div[1]/a[3]
${FIRST_TASK_CHECKBOX}              //*[@id="incomplete-tasks"]/li/label/span[4]
${Second_TASK_CHECKBOX}             //*[@id="incomplete-tasks"]/li[2]/label/span[4]
${Third_TASK_CHECKBOX}              //*[@id="incomplete-tasks"]/li[3]/label/span[4]
${Delete_First_Task}                //*[@id="1"]/span
${Delete_Second_Task}               //*[@id="2"]/span
${Delete_Third_Task}                //*[@id="3"]/span
${Delete_First_Completed_Task}      //*[@id="1"]

*** Keywords ***


*** Test cases ***
Add a Task
   Open Browser     ${URL}    ${BROWSER}
    Input Text      ${INPUT_Task}   TEST1
    Click Element   ${ADD_BUTTON}
    Click Element   ${TO_DO_TASKS}
    Page Should Contain    TEST1
    Close Browser

Mark a Task as COMPLETED_Tasks
   Open Browser     ${URL}  ${BROWSER}
    Input Text      ${INPUT_TASK}  TEST1
    Click Element   ${ADD_BUTTON}
    Click Element   ${TO_DO_TASKS}
    Click Element   ${FIRST_TASK_CHECKBOX}
    Click Element   ${COMPLETED_TASKS}
    Page Should Contain    TEST1
    Close Browser

Delete a Task from To-Do List
    Open Browser    ${URL}  ${BROWSER}
    Input Text      ${INPUT_TASK}  TEST1
    Click Element   ${ADD_BUTTON}
    Click Element   ${TO_DO_TASKS}
    Click Element   ${Delete_First_Task}
    Page Should Not Contain    TEST1
    Click Element     ${COMPLETED_TASKS}
    Page Should Not Contain    TEST1
    Close Browser

Delete a Completed Task
    Open Browser      ${URL}  ${BROWSER}
    Input Text        ${INPUT_TASK}  TEST1
    Click Element     ${ADD_BUTTON}
    Click Element     ${TO_DO_TASKS}
    Click Element     ${FIRST_TASK_CHECKBOX}
    Click Element     ${COMPLETED_TASKS}
    Click Element     ${Delete_First_Task}
    Page Should Not Contain  TEST1
    Click Element     ${TO_DO_TASKS}
    Page Should Not Contain  TEST1
    Close Browser

Add Multiple Tasks
    Open Browser      ${URL}  ${BROWSER}
    Input Text        ${INPUT_TASK}  TEST1
    Click Element     ${ADD_BUTTON}
    Input Text        ${INPUT_TASK}  TEST2
    Click Element     ${ADD_BUTTON}
    Input Text        ${INPUT_TASK}  TEST3
    Click Element     ${ADD_BUTTON}
    Click Element     ${TO_DO_TASKS}
    Page Should Contain    TEST1
    Page Should Contain    TEST2
    Page Should Contain    TEST3
    Close Browser

Mark Multiple Tasks as Completed
    Open Browser      ${URL}  ${BROWSER}
    Input Text        ${INPUT_TASK}  TEST1
    Click Element     ${ADD_BUTTON}
    Input Text        ${INPUT_TASK}  TEST2
    Click Element     ${ADD_BUTTON}
    Input Text        ${INPUT_TASK}  TEST3
    Click Element     ${ADD_BUTTON}
    Click Element     ${TO_DO_TASKS}
    Click Element     ${FIRST_TASK_CHECKBOX}
    Click Element     ${FIRST_TASK_CHECKBOX}
    Click Element     ${FIRST_TASK_CHECKBOX}
    Click Element     ${COMPLETED_TASKS}
    Page Should Contain    TEST1
    Page Should Contain    TEST2
    Page Should Contain    TEST3
    Close Browser

Delete Multiple Tasks from To-Do List
    Open Browser      ${URL}  ${BROWSER}
    Input Text        ${INPUT_TASK}  TEST1
    Click Element     ${ADD_BUTTON}
    Input Text        ${INPUT_TASK}  TEST2
    Click Element     ${ADD_BUTTON}
    Input Text        ${INPUT_TASK}  TEST3
    Click Element     ${ADD_BUTTON}
    Click Element     ${TO_DO_TASKS}
    Click Element     ${Delete_Second_Task}
    Click Element     ${Delete_First_Task}
    Click Element     ${Delete_First_Task}
    Page Should Not Contain    TEST1
    Page Should Not Contain    TEST2
    Page Should Not Contain    TEST3
    Click Element     ${COMPLETED_TASKS}
    Page Should Not Contain    TEST1
    Page Should Not Contain    TEST2
    Page Should Not Contain    TEST3
    Close Browser

Delete Multiple Completed Tasks
    Open Browser      ${URL}  ${BROWSER}
    Input Text        ${INPUT_TASK}  TEST1
    Click Element     ${ADD_BUTTON}
    Input Text        ${INPUT_TASK}  TEST2
    Click Element     ${ADD_BUTTON}
    Input Text        ${INPUT_TASK}  TEST3
    Click Element     ${ADD_BUTTON}
    Click Element     ${TO_DO_TASKS}
    Click Element     ${FIRST_TASK_CHECKBOX}
    Click Element     ${FIRST_TASK_CHECKBOX}
    Click Element     ${FIRST_TASK_CHECKBOX}
    Click Element     ${COMPLETED_TASKS}
    Click Element     ${Delete_First_Task}
    Click Element     ${Delete_First_Completed_Task}
    Click Element     ${Delete_First_Completed_Task}
    Page Should Not Contain    TEST1
    Page Should Not Contain    TEST2
    Page Should Not Contain    TEST3
    Click Element     ${TO_DO_TASKS}
    Page Should Not Contain    TEST1
    Page Should Not Contain    TEST2
    Page Should Not Contain    TEST3
    Close Browser
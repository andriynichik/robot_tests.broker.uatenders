*** Setting ***
Library  Selenium2Screenshots
Library  String
Library  DateTime

*** Variables ***
${locator.tenderId}                                            xpath=(//table[@class='clean-table']/tbody/tr[2]/td)[1]
${locator.title}                                               xpath=(//div[@class='col-md-12']/h2)
${locator.description}                                         xpath=(//div[@class='col-md-12']/p)
${locator.value.amount}                                        xpath=(//table[@class='clean-table']/tbody/tr[4]/td)[1]
${locator.minimalStep.amount}                                  xpath=(//table[@class='clean-table']/tbody/tr[5]/td)[1]
${locator.procuringEntity.name}                                xpath=(//table[@class='table table-striped table-bordered']/tbody/tr[1]/td)[4]
${locator.tenderPeriod.startDate}                              xpath=(//table[@class='clean-table']/tbody/tr[2]/td)[2]
${locator.tenderPeriod.endDate}                                xpath=(//table[@class='clean-table']/tbody/tr[2]/td)[2]
${locator.enquiryPeriod.startDate}                             xpath=(//table[@class='clean-table']/tbody/tr[1]/td)[2]
${locator.enquiryPeriod.endDate}                               xpath=(//table[@class='clean-table']/tbody/tr[1]/td)[2]
#${locator.items[0].description}                                xpath=(//table[@class='table table-striped table-bordered']/tbody/tr[1]/td)[3]
#${locator.items[0].deliveryDate.endDate}                       xpath=//table[@class='table table-striped table-bordered']/tbody/tr[6]/td
#${locator.items[0].deliveryAddress.countryName}                xpath=(//table[@class='table table-striped table-bordered']/tbody/tr[7]/td)[1]
#${locator.items[0].classification.scheme}                      xpath=(//table[@class='table table-striped table-bordered']/tbody/tr[5]/th)[3]
#${locator.items[0].classification.id}                          xpath=(//table[@class='table table-striped table-bordered']/tbody/tr[5]/td)[3]
#${locator.items[0].additionalClassifications[0].scheme}        xpath=(//table[@class='table table-striped table-bordered']/tbody/tr[4]/th)[3]
#${locator.items[0].additionalClassifications[0].id}            xpath=(//table[@class='table table-striped table-bordered']/tbody/tr[4]/td)[3]
#${locator.items[0].additionalClassifications[0].description}   xpath=(//table[@class='table table-striped table-bordered']/tbody/tr[4]/td)[3]
#${locator.items[0].quantity}                                   xpath=(//table[@class='table table-striped table-bordered']/tbody/tr[2]/td)[3]
#${locator.items[0].unit.code}                                  xpath=(//table[@class='table table-striped table-bordered']/tbody/tr[3]/td)[3]
#${locator.items[0].unit.name}                                  xpath=(//table[@class='table table-striped table-bordered']/tbody/tr[3]/td)[3]


#Опис
${locator.items[0].description}                                xpath=(//p[@class='desc'])[0]
${locator.items[1].description}                                xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[1]/td)[4]
${locator.items[2].description}                                xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[1]/td)[5]
${locator.items[3].description}                                xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[1]/td)[6]
${locator.items[4].description}                                xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[1]/td)[7]
#Дата доставки
${locator.items[0].deliveryDate.endDate}                       xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[6]/td)[1]
${locator.items[1].deliveryDate.endDate}                       xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[6]/td)[2]
${locator.items[2].deliveryDate.endDate}                       xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[6]/td)[3]
${locator.items[3].deliveryDate.endDate}                       xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[6]/td)[4]
${locator.items[4].deliveryDate.endDate}                       xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[6]/td)[5]
#Населений пункт
${locator.items[0].deliveryAddress.countryName}                xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[7]/td)[1]
${locator.items[1].deliveryAddress.countryName}                xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[7]/td)[2]
${locator.items[2].deliveryAddress.countryName}                xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[7]/td)[3]
${locator.items[3].deliveryAddress.countryName}                xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[7]/td)[4]
${locator.items[4].deliveryAddress.countryName}                xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[7]/td)[5]
#Cхеми класифікації
${locator.items[0].classification.scheme}                      xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[5]/th)[3]
#ідентифікатора класифікації
${locator.items[0].classification.id}                          xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[5]/td)[3]
#опису класифікації
${locator.items[0].classification.description}                 xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[5]/td)[3]
#схеми додаткової класифікації
${locator.items[0].additionalClassifications[0].scheme}        xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[4]/th)[3]
#ідентифікатора додаткової класифікації
${locator.items[0].additionalClassifications[0].id}            xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[4]/td)[3]
${locator.items[1].additionalClassifications[0].id}            xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[4]/td)[4]
${locator.items[2].additionalClassifications[0].id}            xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[4]/td)[5]
${locator.items[3].additionalClassifications[0].id}            xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[4]/td)[6]
${locator.items[4].additionalClassifications[0].id}            xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[4]/td)[7]
#опису додаткової класифікації
${locator.items[0].additionalClassifications[0].description}   xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[4]/td)[3]
${locator.items[1].additionalClassifications[0].description}   xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[4]/td)[4]
${locator.items[2].additionalClassifications[0].description}   xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[4]/td)[5]
${locator.items[3].additionalClassifications[0].description}   xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[4]/td)[6]
${locator.items[4].additionalClassifications[0].description}   xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[4]/td)[7]
#Назва одиниці, коду
${locator.items[0].unit.name}                                   xpath=(//table[@class='clean-table']/tbody/tr[1]/td)[4]
${locator.items[1].unit.name}                                  xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[3]/td)[4]
${locator.items[2].unit.name}                                  xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[3]/td)[5]
${locator.items[3].unit.name}                                  xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[3]/td)[6]
${locator.items[4].unit.name}                                  xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[3]/td)[7]
#Кількісь
${locator.items[0].quantity}                                  xpath=(//table[@class='clean-table']/tbody/tr[2]/td)[4]
${locator.items[1].quantity}                                  xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[2]/td)[4]
${locator.items[2].quantity}                                  xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[2]/td)[5]
${locator.items[3].quantity}                                  xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[2]/td)[6]
${locator.items[4].quantity}                                  xpath=(//div[@class='container']/table[@class='table table-striped table-bordered']/tbody/tr[2]/td)[7]



*** Keywords ***
Підготувати клієнт для користувача
  
  [Arguments]  ${username}
  [Documentation]  Відкрити брaузер, створити обєкт api wrapper, тощо

  Open Browser   ${BROKERS['${USERS.users['${username}'].broker}'].url}   ${USERS.users['${username}'].browser}   alias=${username}
  Set Window Size       @{USERS.users['${username}'].size}
  Set Window Position   @{USERS.users['${username}'].position}
#  Run Keyword If   '${username}' != 'Ua_Viewer'   Login ${username}

#Login
  Wait Until Page Contains Element   name=email   10
  Sleep  1
  Input text                         name=email      ${USERS.users['${username}'].login}
  Sleep  2
  Input text                         name=password   ${USERS.users['${username}'].password}
  Wait Until Page Contains Element   xpath=//button[contains(@class, 'btn btn-danger')]
  Click Element                      xpath=//button[contains(@class, 'btn btn-danger')]


Створити тендер
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_data
  ${items}=         Get From Dictionary   ${INITIAL_TENDER_DATA.data}               items
  ${title}=         Get From Dictionary   ${INITIAL_TENDER_DATA.data}               title
  ${description}=   Get From Dictionary   ${INITIAL_TENDER_DATA.data}               description
  ${budget}=        Get From Dictionary   ${INITIAL_TENDER_DATA.data.value}         amount
  ${step_rate}=     Get From Dictionary   ${INITIAL_TENDER_DATA.data.minimalStep}   amount
  ${enquiry_start_date}=   Get From Dictionary         ${INITIAL_TENDER_DATA.data.enquiryPeriod}   startDate
  ${enquiry_start_date}=   convert_date_to_slash_format_with_time   ${enquiry_start_date}
  ${enquiry_end_date}=   Get From Dictionary         ${INITIAL_TENDER_DATA.data.enquiryPeriod}   endDate
  ${enquiry_end_date}=   convert_date_to_slash_format_with_time   ${enquiry_end_date}
  ${start_date}=      Get From Dictionary   ${INITIAL_TENDER_DATA.data.tenderPeriod}   startDate
  ${start_date}=      convert_date_to_slash_format_with_time   ${start_date}
  ${end_date}=      Get From Dictionary   ${INITIAL_TENDER_DATA.data.tenderPeriod}   endDate
  ${end_date}=      convert_date_to_slash_format_with_time   ${end_date}

  Selenium2Library.Switch Browser     ${ARGUMENTS[0]}
  Maximize Browser Window
  sleep  1
  Wait Until Page Contains Element    xpath=//a[@class='btn btn-info']    10
  Click Element                       xpath=//a[@class='btn btn-info']
  Wait Until Page Contains Element    name=title   10
  Input text                          name=title    ${title}
  Input text                          name=description    ${description}
  Input text                          name=amount   ${budget}
  Input text                          name=minimal_step  ${step_rate}
  Input text                          name=enquiry_start_date          ${enquiry_start_date}
  Input text                          name=enquiry_end_date            ${enquiry_end_date}
  Input text                          name=tender_start_date           ${start_date}
  Input text                          name=tender_end_date             ${end_date}
  Додати предмет    ${items[0]}    0
  Run Keyword if   '${mode}' == 'multi'   Додати багато предметів   items
  Click Element                       xpath=//input[@class='btn btn-lg btn-danger']
  Sleep  3
  Click Element                       xpath=//*[text()='${title}']
  Sleep  2
  Click Element                        xpath=//*[text()='Опубликовать']
  Sleep  5
  Reload Page
  Sleep  3
  Capture Page Screenshot
  ${tender_UAid}=   Get Text          xpath=//h2
  ${tender_UAid}=  Get Substring  ${tender_UAid}   7   27
  ${Ids}=   Convert To String         ${tender_UAid}
  Run keyword if   '${mode}' == 'multi'   Set Multi Ids   ${tender_UAid}
  [return]  ${Ids}

Set Multi Ids
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[1]} ==  ${tender_UAid}
  ${id}=    Get Text   xpath=//td/a
  ${Ids}=   Create List    ${tender_UAid}   ${id}

Додати предмет
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  items
  ...      ${ARGUMENTS[1]} ==  ${INDEX}
  ${quantity}=      Get From Dictionary   ${ARGUMENTS[0]}         quantity
  ${cpv_id}=        Get From Dictionary   ${ARGUMENTS[0].classification}         id
  ${dkpp_id}=       Get From Dictionary   ${ARGUMENTS[0].additionalClassifications[0]}   id
  ${region}=     Get From Dictionary   ${ARGUMENTS[0].deliveryAddress}     region_ru
  ${postalCode}=     Get From Dictionary   ${ARGUMENTS[0].deliveryAddress}     postalCode
  ${streetAddress}=  Get From Dictionary   ${ARGUMENTS[0].deliveryAddress}     streetAddress
  ${locality}=  Get From Dictionary   ${ARGUMENTS[0].deliveryAddress}     locality
  ${name_ru}=  Get From Dictionary   ${ARGUMENTS[0].unit}    name_ru
  ${items_description}=   Get From Dictionary   ${ARGUMENTS[0]}               description
  ${delivery_end_date}=      Get From Dictionary   ${ARGUMENTS[0].deliveryDate}   endDate
  ${delivery_end_date}=      convert_date_to_slash_format_with_time   ${delivery_end_date}

  Input text                          xpath=(//div[@class='item-section']/div[@class='form-group']/div[@class='col-md-4']/input)[last()]   ${items_description}
  Input text                          xpath=(//div[@class='item-section']/div[@class='form-group']/div[@class='col-md-2']/input)[last()]   ${quantity}
  Click Element                       xpath=(//div[@class='item-section']/div[@class='form-group']/div[@class='col-md-2']/select//option[text()='${name_ru}'])[last()]
  Input text                          xpath=(//div[@class='item-section']/div[@class='form-group'][2]/div[@class='col-md-8']/input[1])[last()]   ${dkpp_id}
  Sleep  1
  Click Element                       xpath=//*[contains(text(),'${dkpp_id}')]
  Input text                          xpath=(//div[@class='item-section']/div[@class='form-group'][3]/div[@class='col-md-8']/input[1])[last()]   ${cpv_id}
  Sleep  1
  Click Element                       xpath=(//*[contains(text(),'${cpv_id}')])[last()]
  Input text                          xpath=(//div[@class='col-md-4'][1]/div[@class='input-group date']/input[1])[last()]     ${delivery_end_date}
  Input text                          xpath=(//div[@class='col-md-4'][2]/div[@class='input-group date']/input[1])[last()]  ${delivery_end_date}
  Click Element                       xpath=(//label[@class='checkbox-inline']/input[@class='address-toggle-control origin'])[last()]
  Sleep  2
  Click Element                       xpath=(//select[@class='form-control'])[last()]//option[contains(., '${region}')]
  Input text                          xpath=(//div[@class='form-group'][3]/div[@class='col-md-4']/input[@class='form-control'])[last()]   ${postalCode}
  Input text                          xpath=(//div[@class='form-group'][4]/div[@class='col-md-4']/input[@class='form-control'])[last()]   ${locality}
  Input text                          xpath=(//div[@class='form-group'][5]/div[@class='col-md-4']/input[@class='form-control'])[last()]   ${streetAddress}

Додати багато предметів
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  items
  ${Items_length}=   Get Length   ${items}
  : FOR    ${INDEX}    IN RANGE    1    ${Items_length}
  \   Click Element   xpath=//button[@class='btn btn-info pull-right add-item-section']
  \   Додати предмет   ${items[${INDEX}]}   ${INDEX}
  Sleep  2

Завантажити документ
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} =  username
  ...    ${ARGUMENTS[1]} =  ${file_path}
  ...    ${ARGUMENTS[2]} =  ${TENDER_UAID}
  ${filepath}=   local_path_to_file   TestDocument.docx
  uatender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Click Element     xpath=//*[text()='Редактировать']
  Sleep  2
  Choose File       id=1        ${filepath}
  Sleep  2
  Click Element     xpath=//input[@class='btn btn-lg btn-danger']
  Capture Page Screenshot

Внести зміни в тендер
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} =  username
  ...      ${ARGUMENTS[1]} =  ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} =  tender_data
  ${ADDITIONAL_DATA}=  prepare_Front_end_initial_data  ${BROKERS['${USERS.users['${tender_owner}'].broker}'].period_interval}   single
  ${items}=         Get From Dictionary   ${INITIAL_TENDER_DATA.data}               items
  ${items_description}=   Get From Dictionary   ${items[0]}         description
  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  uatender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Sleep  2
  Click Element                      xpath=//*[text()='Редактировать']
  Sleep  2
  Input text                         name=description    ${items_description}
  Sleep  2
  Click Element                      xpath=//input[@class='btn btn-lg btn-danger']
  Capture Page Screenshot

Оновити сторінку з тендером
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} =  username
  ...      ${ARGUMENTS[1]} =  ${TENDER_UAID}
  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  uatender.Пошук тендера по ідентифікатору    ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Reload Page

Подати скаргу
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} =  username
  ...    ${ARGUMENTS[1]} =  ${TENDER_UAID}
  ...    ${ARGUMENTS[2]} =  complaintsId
  Fail  Поки не реалізовано

порівняти скаргу
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} =  username
  ...    ${ARGUMENTS[1]} =  ${TENDER_UAID}
  ...    ${ARGUMENTS[2]} =  complaintsId
  Fail  Поки не реалізовано

Пошук тендера по ідентифікатору
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}
  Switch browser   ${ARGUMENTS[0]}
  Go To  ${USERS.users['${ARGUMENTS[0]}'].homepage}
   Input Text      name=s   ${ARGUMENTS[1]}
  Sleep  10
  Click Button    xpath=//button[@type='submit']
  sleep  1
  


Отримати тест із поля і показати на сторінці
  [Arguments]   ${fieldname}
  sleep  3
  ${return_value}=   Get Text  ${locator.${fieldname}}
  [return]  ${return_value}

отримати інформацію із тендера
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  fieldname
  Switch browser   ${ARGUMENTS[0]}
  ${return_value}=  run keyword  отримати інформацію про ${ARGUMENTS[1]}
  [return]  ${return_value}

отримати інформацію про title
  ${return_value}=   Отримати тест із поля і показати на сторінці   title
  [return]  ${return_value}

отримати інформацію про description
  ${return_value}=   Отримати тест із поля і показати на сторінці   description
  [return]  ${return_value}

отримати інформацію про value.amount
  ${return_value}=   Отримати тест із поля і показати на сторінці   value.amount
  ${return_value}=   Convert To Number   ${return_value.split(' ')[0]}
  [return]  ${return_value}

отримати інформацію про tenderId
  ${return_value}=   Отримати тест із поля і показати на сторінці   tenderId
  [return]  ${return_value}

отримати інформацію про procuringEntity.name
  Fail  Немає такого поля при перегляді

Change_date_to_month
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]}  ==  date
  ${day}=   Get Substring   ${ARGUMENTS[0]}   0   2
  ${month}=   Get Substring   ${ARGUMENTS[0]}  3   6
  ${year}=   Get Substring   ${ARGUMENTS[0]}   5
  ${return_value}=   Convert To String  ${month}${day}${year}
  [return]  ${return_value}

отримати інформацію про enquiryPeriod.startDate
  ${return_value}=   Отримати тест із поля і показати на сторінці   enquiryPeriod.startDate
  ${return_value}=   Change_date_to_month   ${return_value}
  [return]  ${return_value}

отримати інформацію про enquiryPeriod.endDate
  ${return_value}=   Отримати тест із поля і показати на сторінці   enquiryPeriod.endDate
  ${return_value}=   Change_date_to_month   ${return_value}
  [return]  ${return_value}

отримати інформацію про tenderPeriod.startDate
  ${return_value}=   Отримати тест із поля і показати на сторінці   tenderPeriod.startDate
  ${return_value}=   Change_date_to_month   ${return_value}
  [return]  ${return_value}

отримати інформацію про tenderPeriod.endDate
  ${return_value}=   Отримати тест із поля і показати на сторінці   tenderPeriod.endDate
  ${return_value}=   Change_date_to_month   ${return_value}
  [return]  ${return_value}

отримати інформацію про minimalStep.amount
  ${return_value}=   Отримати тест із поля і показати на сторінці   minimalStep.amount
  ${return_value}=   Convert To Number   ${return_value.split(' ')[0]}
  [return]  ${return_value}

додати предмети закупівлі
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} =  username
  ...      ${ARGUMENTS[1]} =  ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} =  3
  ${ADDITIONAL_DATA}=  prepare_Front_end_initial_data   ${BROKERS['${USERS.users['${tender_owner}'].broker}'].period_interval}   multi
  ${items}=         Get From Dictionary   ${INITIAL_TENDER_DATA.data}               items
  ${items_description}=   Get From Dictionary   ${items[0]}               description
  ${delivery_end_date}=      Get From Dictionary   ${items[0].deliveryDate}   endDate
  ${delivery_end_date}=      convert_date_to_slash_format_with_time   ${delivery_end_date}
  ${quantity}=      Get From Dictionary   ${items[0]}         quantity
  ${cpv_id}=        Get From Dictionary   ${items[0].classification}         id
  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  Run keyword if   '${TEST NAME}' == 'Можливість додати позицію закупівлі в тендер'   додати позицію
  Run keyword if   '${TEST NAME}' != 'Можливість додати позицію закупівлі в тендер'   видалити позиції

додати позицію
  Click Element                        xpath=//*[text()='Мои тендеры']
  Sleep  2
  Click Element                      xpath=(//a[@class='btn btn-xs btn-info']/span)[1]
  Sleep  2
  : FOR    ${INDEX}    IN RANGE    1    ${ARGUMENTS[2]} +1
  \   Click Element   xpath=//button[@class='btn btn-info pull-right add-item-section']
  \   Додати предмет   ${items[${INDEX}]}   ${INDEX}
  Sleep  2
  Click Element   xpath=//input[@class='btn btn-lg btn-danger']
  Wait Until Page Contains    [ТЕСТУВАННЯ]   10

видалити позиції
  Fail  Немає можливості баг №493

#1
Отримати інформацію про items[0].description
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].description
  [return]  ${return_value}
#2
Отримати інформацію про items[1].description
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[1].description
  [return]  ${return_value}
#3
Отримати інформацію про items[2].description
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[2].description
  [return]  ${return_value}
#4
Отримати інформацію про items[3].description
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[3].description
  [return]  ${return_value}
#5
Отримати інформацію про items[4].description
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[4].description
  [return]  ${return_value}


#1
Отримати інформацію про items[0].deliveryDate.endDate
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].deliveryDate.endDate
  [return]  ${return_value.split(' ',4)[4]}
#2
Отримати інформацію про items[1].deliveryDate.endDate
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[1].deliveryDate.endDate
  [return]  ${return_value.split(' ',4)[4]}
#3
Отримати інформацію про items[2].deliveryDate.endDate
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[2].deliveryDate.endDate
  [return]  ${return_value.split(' ',4)[4]}
#4
Отримати інформацію про items[3].deliveryDate.endDate
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[3].deliveryDate.endDate
  [return]  ${return_value.split(' ',4)[4]}
#5
Отримати інформацію про items[4].deliveryDate.endDate
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[4].deliveryDate.endDate
  [return]  ${return_value.split(' ',4)[4]}


отримати інформацію про items[0].deliveryLocation.latitude
  Fail  Немає такого поля при перегляді

отримати інформацію про items[0].deliveryLocation.longitude
  Fail  Немає такого поля при перегляді


#1
Отримати інформацію про items[0].deliveryAddress.countryName
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[1]}  ,
  ${return_value}=   Run keyword if    '${return_value}' == 'Украина'   Convert To String  Україна
  [return]  ${return_value}
#2
Отримати інформацію про items[1].deliveryAddress.countryName
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[1].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[1]}  ,
  ${return_value}=   Run keyword if    '${return_value}' == 'Украина'   Convert To String  Україна
  [return]  ${return_value}
#3
Отримати інформацію про items[2].deliveryAddress.countryName
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[2].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[1]}  ,
  ${return_value}=   Run keyword if    '${return_value}' == 'Украина'   Convert To String  Україна
  [return]  ${return_value}
#4
Отримати інформацію про items[3].deliveryAddress.countryName
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[3].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[1]}  ,
  ${return_value}=   Run keyword if    '${return_value}' == 'Украина'   Convert To String  Україна
  [return]  ${return_value}
#5
Отримати інформацію про items[4].deliveryAddress.countryName
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[4].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[1]}  ,
  ${return_value}=   Run keyword if    '${return_value}' == 'Украина'   Convert To String  Україна
  [return]  ${return_value}

#1
отримати інформацію про items[0].deliveryAddress.postalCode
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[0]}  ,
  [return]  ${return_value}
#2
отримати інформацію про items[1].deliveryAddress.postalCode
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[1].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[0]}  ,
  [return]  ${return_value}
#3
отримати інформацію про items[2].deliveryAddress.postalCode
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[2].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[0]}  ,
  [return]  ${return_value}
#4
отримати інформацію про items[3].deliveryAddress.postalCode
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[3].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[0]}  ,
  [return]  ${return_value}
#5
отримати інформацію про items[4].deliveryAddress.postalCode
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[4].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[0]}  ,
  [return]  ${return_value}

#1
отримати інформацію про items[0].deliveryAddress.region
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].deliveryAddress.countryName
  ${return_value}=   Run keyword if    '${return_value.split(' ')[2]}' == 'Николаевская'   Convert To String  Миколаївська
  [return]  ${return_value}
#2
отримати інформацію про items[1].deliveryAddress.region
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[1].deliveryAddress.countryName
  ${return_value}=   Run keyword if    '${return_value.split(' ')[2]}' == 'Волынская'   Convert To String  Волинська
  [return]  ${return_value}
#3
отримати інформацію про items[2].deliveryAddress.region
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[2].deliveryAddress.countryName
  ${return_value}=   Run keyword if    '${return_value.split(' ')[2]}' == 'Запорожская'   Convert To String  Запорізька
  [return]  ${return_value}
#4
отримати інформацію про items[3].deliveryAddress.region
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[3].deliveryAddress.countryName
  ${return_value}=   Run keyword if    '${return_value.split(' ')[2]}' == 'Винницкая'   Convert To String  Вінницька
  [return]  ${return_value}
#5
отримати інформацію про items[4].deliveryAddress.region
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[4].deliveryAddress.countryName
  ${return_value}=   Run keyword if    '${return_value.split(' ')[2]}' == 'Полтавская'   Convert To String  Полтавська
  [return]  ${return_value}

#1
отримати інформацію про items[0].deliveryAddress.locality
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[4]}  ,
  [return]  ${return_value}
#2
отримати інформацію про items[1].deliveryAddress.locality
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[1].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[4]}  ,
  [return]  ${return_value}
#3
отримати інформацію про items[2].deliveryAddress.locality
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[2].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[4]}  ,
  [return]  ${return_value}
#4
отримати інформацію про items[3].deliveryAddress.locality
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[3].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[4]}  ,
  [return]  ${return_value}
#5
отримати інформацію про items[4].deliveryAddress.locality
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[4].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value.split(' ')[4]}  ,
  [return]  ${return_value}

#1
отримати інформацію про items[0].deliveryAddress.streetAddress
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].deliveryAddress.countryName
#  ${return_value}=   Get Substring    ${return_value}   46
  [return]  ${return_value.split(' ',5)[5]}
#2
отримати інформацію про items[1].deliveryAddress.streetAddress
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[1].deliveryAddress.countryName
#  ${return_value}=   Get Substring    ${return_value}   42
  [return]  ${return_value.split(' ',5)[5]}
#3
отримати інформацію про items[2].deliveryAddress.streetAddress
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[2].deliveryAddress.countryName
#  ${return_value}=   Get Substring    ${return_value}   45
  [return]  ${return_value.split(' ',5)[5]}
#4
отримати інформацію про items[3].deliveryAddress.streetAddress
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[3].deliveryAddress.countryName
#  ${return_value}=   Get Substring    ${return_value}   45
  [return]  ${return_value.split(' ',5)[5]}
#5
отримати інформацію про items[4].deliveryAddress.streetAddress
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[4].deliveryAddress.countryName
#  ${return_value}=   Get Substring    ${return_value}   45
  [return]  ${return_value.split(' ',5)[5]}

#1
отримати інформацію про items[0].classification.scheme
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.scheme
  [return]  ${return_value.split(' ')[1]}
#2
отримати інформацію про items[1].classification.scheme
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.scheme
  [return]  ${return_value.split(' ')[1]}
#3
отримати інформацію про items[2].classification.scheme
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.scheme
  [return]  ${return_value.split(' ')[1]}
#4
отримати інформацію про items[3].classification.scheme
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.scheme
  [return]  ${return_value.split(' ')[1]}
#5
отримати інформацію про items[4].classification.scheme
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.scheme
  [return]  ${return_value.split(' ')[1]}


#1
отримати інформацію про items[0].classification.id
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.id
  [return]  ${return_value.split(' ')[0]}
#2
отримати інформацію про items[1].classification.id
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.id
  [return]  ${return_value.split(' ')[0]}
#3
отримати інформацію про items[2].classification.id
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.id
  [return]  ${return_value.split(' ')[0]}
#4
отримати інформацію про items[3].classification.id
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.id
  [return]  ${return_value.split(' ')[0]}
#5
отримати інформацію про items[4].classification.id
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.id
  [return]  ${return_value.split(' ')[0]}

#1
отримати інформацію про items[0].classification.description
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.id
  [return]  ${return_value.split(' ',1)[1]}
#2
отримати інформацію про items[1].classification.description
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.id
  [return]  ${return_value.split(' ',1)[1]}
#3
отримати інформацію про items[2].classification.description
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.id
  [return]  ${return_value.split(' ',1)[1]}
#4
отримати інформацію про items[3].classification.description
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.id
  [return]  ${return_value.split(' ',1)[1]}
#5
отримати інформацію про items[4].classification.description
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].classification.id
  [return]  ${return_value.split(' ',1)[1]}

#1
отримати інформацію про items[0].additionalClassifications[0].scheme
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].additionalClassifications[0].scheme
  [return]  ${return_value.split(' ')[1]}
#1
отримати інформацію про items[1].additionalClassifications[0].scheme
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].additionalClassifications[0].scheme
  [return]  ${return_value.split(' ')[1]}
#1
отримати інформацію про items[2].additionalClassifications[0].scheme
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].additionalClassifications[0].scheme
  [return]  ${return_value.split(' ')[1]}
#1
отримати інформацію про items[3].additionalClassifications[0].scheme
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].additionalClassifications[0].scheme
  [return]  ${return_value.split(' ')[1]}
#1
отримати інформацію про items[4].additionalClassifications[0].scheme
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].additionalClassifications[0].scheme
  [return]  ${return_value.split(' ')[1]}

#1
отримати інформацію про items[0].additionalClassifications[0].id
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].additionalClassifications[0].id
  [return]  ${return_value.split(' ')[0]}
#2
отримати інформацію про items[1].additionalClassifications[0].id
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[1].additionalClassifications[0].id
  [return]  ${return_value.split(' ')[0]}
#3
отримати інформацію про items[2].additionalClassifications[0].id
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[2].additionalClassifications[0].id
  [return]  ${return_value.split(' ')[0]}
#4
отримати інформацію про items[3].additionalClassifications[0].id
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[3].additionalClassifications[0].id
  [return]  ${return_value.split(' ')[0]}
#5
отримати інформацію про items[4].additionalClassifications[0].id
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[4].additionalClassifications[0].id
  [return]  ${return_value.split(' ')[0]}

#1
отримати інформацію про items[0].additionalClassifications[0].description
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[0].additionalClassifications[0].description
  [return]  ${return_value.split(' ',1)[1]}
#2
отримати інформацію про items[1].additionalClassifications[0].description
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[1].additionalClassifications[0].description
  [return]  ${return_value.split(' ',1)[1]}
#3
отримати інформацію про items[2].additionalClassifications[0].description
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[2].additionalClassifications[0].description
  [return]  ${return_value.split(' ',1)[1]}
#4
отримати інформацію про items[3].additionalClassifications[0].description
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[3].additionalClassifications[0].description
  [return]  ${return_value.split(' ',1)[1]}
#5
отримати інформацію про items[4].additionalClassifications[0].description
  ${return_value}=   Отримати тест із поля і показати на сторінці  items[4].additionalClassifications[0].description
  [return]  ${return_value.split(' ',1)[1]}

#1
отримати інформацію про items[0].unit.code
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].unit.name
  ${return_value}=   Run keyword if    '${return_value}' == 'штуки'   Convert To String  кг.
  [return]  ${return_value}
#2
отримати інформацію про items[1].unit.code
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].unit.name
  ${return_value}=   Run keyword if    '${return_value}' == 'штуки'   Convert To String  кг.
  [return]  ${return_value}
#3
отримати інформацію про items[2].unit.code
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].unit.name
  ${return_value}=   Run keyword if    '${return_value}' == 'штуки'   Convert To String  кг.
  [return]  ${return_value}
#4
отримати інформацію про items[3].unit.code
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].unit.name
  ${return_value}=   Run keyword if    '${return_value}' == 'штуки'   Convert To String  кг.
  [return]  ${return_value}
#5
отримати інформацію про items[4].unit.code
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].unit.name
  ${return_value}=   Run keyword if    '${return_value}' == 'штуки'   Convert To String  кг.
  [return]  ${return_value}

#1
отримати інформацію про items[0].unit.name
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].unit.name
  ${return_value}=   Run keyword if    '${return_value}' == 'штуки'   Convert To String  кг.
  [return]  ${return_value}
#2
отримати інформацію про items[1].unit.name
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].unit.name
  ${return_value}=   Run keyword if    '${return_value}' == 'штуки'   Convert To String  кг.
  [return]  ${return_value}
#3
отримати інформацію про items[2].unit.name
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].unit.name
  ${return_value}=   Run keyword if    '${return_value}' == 'штуки'   Convert To String  кг.
  [return]  ${return_value}
#4
отримати інформацію про items[3].unit.name
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].unit.name
  ${return_value}=   Run keyword if    '${return_value}' == 'штуки'   Convert To String  кг.
  [return]  ${return_value}
#5
отримати інформацію про items[4].unit.name
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].unit.name
  ${return_value}=   Run keyword if    '${return_value}' == 'штуки'   Convert To String  кг.
  [return]  ${return_value}

#1
отримати інформацію про items[0].quantity
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[0].quantity
  ${return_value}=   Convert To Number   ${return_value}
  [return]   ${return_value}
#2
отримати інформацію про items[1].quantity
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[1].quantity
  ${return_value}=   Convert To Number   ${return_value}
  [return]   ${return_value}
#3
отримати інформацію про items[2].quantity
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[2].quantity
  ${return_value}=   Convert To Number   ${return_value}
  [return]   ${return_value}
#4
отримати інформацію про items[3].quantity
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[3].quantity
  ${return_value}=   Convert To Number   ${return_value}
  [return]   ${return_value}
#5
отримати інформацію про items[4].quantity
  ${return_value}=   Отримати тест із поля і показати на сторінці   items[4].quantity
  ${return_value}=   Convert To Number   ${return_value}
  [return]   ${return_value}


Відповісти на питання
  [Arguments]  @{ARGUMENTS}
  
  [Documentation]
  ...      ${ARGUMENTS[0]} = username
  ...      ${ARGUMENTS[1]} = ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} = 0
  ...      ${ARGUMENTS[3]} = answer_data
  ${answer}=     Get From Dictionary  ${ARGUMENTS[3].data}  answer
  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  uatender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Click Element      xpath=//*[text()='Вопросы']
  Sleep  2
  Click Element      xpath=(//*[text()='Ответить'])[last()]
  Sleep  2
  Input text         name=answer     ${answer}
  Sleep  1
  Click Element      xpath=//div[@class='form-group']/input[@class='btn btn-xs btn-default']
  Capture Page Screenshot




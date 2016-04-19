*** Setting ***
Library  Selenium2Screenshots
Library  String
Library  DateTime
Library  uatenders_service.py

*** Variables ***
  
${locator.title}                                                xpath=(//div[@class='col-md-12']/h2)
${locator.description}                                          xpath=(//div[@class='col-md-12']/p)
${locator.questions[0].title}                                   xpath=(//span[@class='item-questions.title'])
${locator.questions[0].description}                             xpath=(//div[@class='bs-callout bs-callout-warning']/p)
${locator.questions[0].date}                                    xpath=(//div[@class='bs-callout bs-callout-warning']/h4/small)[1]
${locator.questions[0].answer}                                  xpath=(//div[@class='bs-callout bs-callout-success']/p)
${locator.minimalStep.amount}                                   xpath=(//table[@class='clean-table']/tbody/tr[5]/td)[1]
${locator.value.amount}                                         xpath=(//table[@class='clean-table']/tbody/tr[4]/td)[1]
${locator.value.currency}                                       xpath=(//table[@class='clean-table']/tbody/tr[4]/td)[1]
${locator.value.valueAddedTaxIncluded}                          xpath=(//table[@class='clean-table']/tbody/tr[4]/td)[1]
${locator.tenderId}                                             xpath=(//table[@class='clean-table']/tbody/tr[2]/td)[1]
${locator.procuringEntity.name}                                 xpath=(//td[@class='item-procuringEntity.name'])
${locator.enquiryPeriod.startDate}                              xpath=(//td[@class="enquiryPeriod"]/span[1])
${locator.enquiryPeriod.endDate}                                xpath=(//td[@class="enquiryPeriod"]/span[2])
${locator.tenderPeriod.startDate}                               xpath=(//td[@class="tenderPeriod"]/span[1])
${locator.tenderPeriod.endDate}                                 xpath=(//td[@class="tenderPeriod"]/span[2])
${locator.items[0].quantity}                                    xpath=(//td[@class='item-amount'])
${locator.items[0].description}                                 xpath=(//td[@class='item-description'])
${locator.items[0].deliveryLocation.latitude}                   xpath=//td[(@class='item-deliveryLocation.latitude')]
${locator.items[0].deliveryLocation.longitude}                  xpath=//td[(@class='item-deliveryLocation.longitude')]
${locator.items[0].unit.code}                                   xpath=(//td[@class='item-amount'])
${locator.items[0].unit.name}                                   xpath=(//td[@class='item-amount'])
${locator.items[0].deliveryAddress.postalCode}                  xpath=(//span[@class='item-deliveryAddress.postalCode'])
${locator.items[0].deliveryAddress.countryName}                 xpath=(//span[@class='item-deliveryAddress.countryName'])
${locator.items[0].deliveryAddress.region}                      xpath=(//span[@class='item-deliveryAddress.region'])
${locator.items[0].deliveryAddress.locality}                    xpath=(//span[@class='item-deliveryAddress.locality'])
${locator.items[0].deliveryAddress.streetAddress}               xpath=(//span[@class='item-deliveryAddress.streetAddress'])
${locator.items[0].deliveryDate.endDate}                        xpath=(//td[@class='item-delivery_period'])
${locator.items[0].classification.scheme}                       xpath=(//span[@class=' item-classification.scheme '])
${locator.items[0].classification.id}                           xpath=(//td[@class='item-cpv'])
${locator.items[0].classification.description}                  xpath=(//td[@class='item-cpv'])
${locator.items[0].additionalClassifications[0].scheme}         xpath=(//span[@class=' item-additionalClassifications.scheme '])
${locator.items[0].additionalClassifications[0].id}             xpath=(//td[@class='item-dkpp'])
${locator.items[0].additionalClassifications[0].description}    xpath=(//td[@class='item-dkpp'])
 



*** Keywords ***
Підготувати клієнт для користувача
  
  [Arguments]  ${username}
  [Documentation]  Відкрити брaузер, створити обєкт api wrapper, тощо

  Open Browser   ${USERS.users['${username}'].homepage}   ${USERS.users['${username}'].browser}   alias=${username}
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

  ${items}=                 Get From Dictionary         ${ARGUMENTS[1].data}               items
  ${title}=                 Get From Dictionary         ${ARGUMENTS[1].data}               title
  ${description}=           Get From Dictionary         ${ARGUMENTS[1].data}                 description
  ${budget}=                Get From Dictionary         ${ARGUMENTS[1].data.value}           amount
 
  ${proc_name}=             Get From Dictionary         ${ARGUMENTS[1].data.procuringEntity}   name

  ${step_rate}=             Get From Dictionary         ${ARGUMENTS[1].data.minimalStep}       amount
  ${items_description}=   Get From Dictionary   ${items[0]}         description
  ${quantity}=              Get From Dictionary         ${items[0]}         quantity
  ${countryName}=           Get From Dictionary         ${ARGUMENTS[1].data.procuringEntity.address}       countryName
  ${delivery_end_date}=     Get From Dictionary         ${items[0].deliveryDate}   endDate
  ${delivery_end_date}=     convert_datetime_for_delivery  ${delivery_end_date}
  ${cpv}=                   Convert To String           Картонні коробки
  ${cpv_id}=                Get From Dictionary         ${items[0].classification}         id
  ${unit}=                  Get From Dictionary         ${items[0].unit}                 name
  ${dkpp_desc}=             Get From Dictionary         ${items[0].additionalClassifications[0]}   description
  ${dkpp_id}=               Get From Dictionary         ${items[0].additionalClassifications[0]}   id
  ${lots_title} =           Convert To string           testlot_title
  ${lots_desc} =            Convert To string           testlot_desc
  
  ${dates}=                get_all_uatenders_dates  ${ARGUMENTS[1]}
  ${end_period_adjustments}=      convert_datetime_for_delivery        ${dates['EndPeriod']}        
  ${start_receive_offers}=        convert_datetime_for_delivery        ${dates['StartDate']}        
  ${end_receive_offers}=          convert_datetime_for_delivery        ${dates['EndDate']}        
  ${postalCode}=           Get From Dictionary         ${items[0].deliveryAddress}     postalCode
  ${locality}=             Get From Dictionary         ${items[0].deliveryAddress}     locality
  ${region}=               Get From Dictionary         ${items[0].deliveryAddress}     region
  ${streetAddress}=        Get From Dictionary         ${items[0].deliveryAddress}     streetAddress

  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  Sleep  1
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[2]/a
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[2]/ul/li[2]/a
  Input text                          name=name   ${proc_name}
  Click Element                       xpath=//*[@type='submit']
  Sleep  5

  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[3]/a
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[3]/ul/li[1]/a
  Input text                          name=title    ${title}
  Input text                          name=description      ${description}

  Input text                          name=contact_name    ${proc_name} 
  Click Element                       name=tax_included
  
  ## dates
  Click Element                       name=enquiry_start_date
  Input text                          name=enquiry_end_date     ${end_period_adjustments}
  Input text                          name=tender_start_date    ${start_receive_offers}
  Input text                          name=tender_end_date      ${end_receive_offers}

  ## lots
  Input text                          name=lots[0][title]         ${lots_title} 
  Input text                          name=lots[0][amount]        ${budget}
  Input text                          name=lots[0][description]   ${unit}
  Sleep  7
  Input text                          name=lots[0][minimal_step]                                     ${step_rate}
  Input Text                          name=lots[0][items][0][description]                            ${items_description}
  Input Text                          name=lots[0][items][0][quantity]                               ${quantity}
  Click Element                       name=lots[0][items][0][delivery_date_start]
  Click Element                       name=lots[0][items][0][delivery_date_end]                      
  Sleep  1

 
  Input Text                          name=lots[0][items][0][postal_code]                         ${postalCode}
  Input Text                          name=lots[0][items][0][locality]                            ${locality}
  Input Text                          name=lots[0][items][0][delivery_address]                    ${streetAddress}
  Click Element                       name=lots[0][items][0][unit_id]
  Select From List                    xpath=//select[@name="lots[0][items][0][region_id]"]        1
  Select From List                    xpath=//select[@name="lots[0][items][0][unit_id]"]          20


  ## cpv
  Input text                          name=lots[0][items][0][cpv]   ${cpv}
  Click Element                       xpath=//li[@class='ui-menu-item']
  Sleep  1
  Input text                          name=lots[0][items][0][dkpp]   ${dkpp_desc}
  Sleep  1
  Click Element                       xpath=(//li[@class='ui-menu-item'])[2]

  Click Element                       xpath=//*[@type='submit']
  Sleep  5
  Click Element                       xpath=(//span[@class='glyphicon glyphicon-bullhorn'])
  Sleep  15
  Reload Page
  Sleep  5
  

  ${tender_UAid}=   Отримати текст із поля і показати на сторінці   tenderId
  [return]  ${tender_UAid}
 

Задати питання
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tenderUaId
  ...      ${ARGUMENTS[2]} ==  questionId
  ${title}=        Get From Dictionary  ${ARGUMENTS[2].data}  title
  ${description}=  Get From Dictionary  ${ARGUMENTS[2].data}  description

  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  Click Element     xpath=//*[text()='Задати запитання']
  Input text                          name=title                                     ${title}
  Input Text                          name=question                            ${description}
  Click Element                       xpath=//*[@type='submit']
  Sleep  15


Подати цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} ==  ${test_bid_data}
  ${bid}=        Get From Dictionary   ${ARGUMENTS[2].data.value}         amount
  Sleep  30
  Reload Page
  uatenders.Пошук тендера по ідентифікатору    ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Sleep  30 
  Reload Page
  Click Element     xpath=//*[text()='Подати пропозицію']
  Input text                          name=amount     100 

  Click Element                       xpath=//*[@type='submit']



скасувати цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}

  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Click Element               xpath=//*[text()='Редагувати пропозицію'] 
  Click Element               xpath=//*[text()='Відмінити']
   
Змінити цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  Log Many  @{ARGUMENTS}
  Input text                          name=amount     ${ARGUMENTS[3]}
  Click Element                       xpath=//*[@type='submit']
  Sleep  15

Завантажити документ в ставку
    [Arguments]  @{ARGUMENTS}
    [Documentation]
    ...     ${ARGUMENTS[1]} ==  file
    ...    ${ARGUMENTS[2]} ==  tenderId
    Sleep   5
    Click Element               xpath=//*[text()='Додати файл']
    Sleep   2
    Choose File     id=bid-1            ${ARGUMENTS[1]}
    sleep   3
    Click Element                       xpath=//*[@type='submit']

Змінити документ в ставці
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[1]} ==  file
  ...    ${ARGUMENTS[2]} ==  tenderId
  Click Element                       xpath=(//a[@class='fileUpload btn btn-danger btn-xs'])  
  Sleep  5
  Click Element                       xpath=//*[text()='OK']
  Sleep  5
  Click Element                       xpath=//*[text()='Додати файл']
  Choose File     id=bid-1             ${ARGUMENTS[1]}
  Sleep  3 
  Click Element                       xpath=//*[@type='submit']

Відповісти на питання
  Sleep   7
  Reload Page
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} = username
  ...      ${ARGUMENTS[1]} = ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} = 0
  ...      ${ARGUMENTS[3]} = answer_data
  ${answer}=     Get From Dictionary  ${ARGUMENTS[3].data}  answer
  Click Element      xpath=(//ul[@class='nav nav-tabs']/li[2]/a)[1]
  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  Click Element     xpath=//*[text()='Відповісти']
  Input text                          name=answer   ${answer}
  Click Element                       xpath=//*[@type='submit']



Завантажити документ
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} =  username
  ...    ${ARGUMENTS[1]} =  ${file_path}
  ...    ${ARGUMENTS[2]} =  ${TENDER_UAID}
  ${filepath}=   local_path_to_file   TestDocument.docx
  Sleep  10
  Click Element     xpath=//*[text()='Редагувати']
  Sleep  2
  Choose File       id=tender-1       ${filepath}
  Sleep  2
  Click Element                       xpath=//*[@type='submit']
  Capture Page Screenshot

Внести зміни в тендер
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} =  username
  ...    ${ARGUMENTS[1]} =  ${file_path}
  ...    ${ARGUMENTS[2]} =  ${TENDER_UAID}

 
  
  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Sleep  2 
  Click Element                       xpath=//*[text()='Редагувати']
  Sleep  2
  Input text                         name=description    Тестовий тендер
  Sleep  2
  Capture Page Screenshot

Оновити сторінку з тендером
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} =  username
  ...      ${ARGUMENTS[1]} =  ${TENDER_UAID}
  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  uatenders.Пошук тендера по ідентифікатору    ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
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
  Sleep  6
  Click Button    xpath=//button[@type='submit']
  sleep  1
  

Отримати текст із поля і показати на сторінці
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
  ${return_value}=   Отримати текст із поля і показати на сторінці   title
  [return]  ${return_value}

отримати інформацію про value.currency
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.currency
  [return]  ${return_value.split(' ')[1]}


отримати інформацію про value.valueAddedTaxIncluded
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.valueAddedTaxIncluded
  ${return_value}=   convert to string     ${return_value.split(' ')[3]}
  ${return_value}=   convert_uatenders_string_to_common_string    ${return_value}
  ${return_value}=   Convert To Boolean   ${return_value}
  [return]  ${return_value}

отримати інформацію про description
  ${return_value}=   Отримати текст із поля і показати на сторінці   description
  [return]  ${return_value}

отримати інформацію про value.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.amount
  ${return_value}=   Convert To Number   ${return_value.split(' ')[0]}
  [return]  ${return_value}

отримати інформацію про tenderId
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderId
  [return]  ${return_value}

отримати інформацію про procuringEntity.name
  ${return_value}=   Отримати текст із поля і показати на сторінці   procuringEntity.name
  [return]  ${return_value}

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
  ${return_value}=   Отримати текст із поля і показати на сторінці   enquiryPeriod.startDate
  ${return_value}=   Change_date_to_month   ${return_value}
  [return]  ${return_value}

отримати інформацію про enquiryPeriod.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   enquiryPeriod.endDate
  ${return_value}=   Change_date_to_month   ${return_value}
  [return]  ${return_value}

отримати інформацію про tenderPeriod.startDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderPeriod.startDate
  ${return_value}=   Change_date_to_month   ${return_value}
  [return]  ${return_value}

отримати інформацію про tenderPeriod.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderPeriod.endDate
  ${return_value}=   Change_date_to_month   ${return_value}
  [return]  ${return_value}

отримати інформацію про minimalStep.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   minimalStep.amount
  ${return_value}=   Convert To Number   ${return_value.split(' ')[0]}
  [return]  ${return_value}

додати предмети закупівлі
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} =  username
  ...      ${ARGUMENTS[1]} =  ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} =  3
  ${period_interval}=  Get Broker Property By Username  ${ARGUMENTS[0]}  period_interval
  ${tender_data}=  prepare_test_tender_data  ${period_interval}  multi

  ${items}=         Get From Dictionary   ${tender_data.data}               items
  ${description}=   Get From Dictionary   ${tender_data.data}               description
  ${quantity}=      Get From Dictionary   ${items[0]}                       quantity
  ${cpv}=           Convert To String     Картонки
  ${cpv_id}=        Get From Dictionary   ${items[0].classification}         id
  ${cpv_id1}=       Replace String        ${cpv_id}   -   _
  ${dkpp_desc}=     Get From Dictionary   ${items[0].additionalClassifications[0]}   description
  ${dkpp_id}=       Get From Dictionary   ${items[0].additionalClassifications[0]}   id
  ${dkpp_id1}=      Replace String        ${dkpp_id}   -   _

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


Отримати інформацію про items[0].description
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].description
  [return]  ${return_value}


Отримати інформацію про items[0].deliveryDate.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryDate.endDate
  [return]  ${return_value.split(' ')[1]}


отримати інформацію про items[0].deliveryLocation.latitude
  Fail  Немає такого поля при перегляді

отримати інформацію про items[0].deliveryLocation.longitude
  Fail  Немає такого поля при перегляді


Отримати інформацію про items[0].deliveryAddress.countryName
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value}  ,
  ${return_value}=   Run keyword if    '${return_value}' == 'Украина'   Convert To String  Україна
  [return]  ${return_value}


отримати інформацію про items[0].deliveryAddress.postalCode
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryAddress.postalCode
  ${return_value}=   Remove String   ${return_value}  ,
  [return]  ${return_value}


отримати інформацію про items[0].deliveryAddress.region
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryAddress.region
  ${return_value}=   Remove String   ${return_value}  ,
  [return]  ${return_value}



отримати інформацію про items[0].deliveryAddress.locality
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryAddress.locality
  ${return_value}=   Remove String   ${return_value}  ,
  [return]  ${return_value}


отримати інформацію про items[0].deliveryAddress.streetAddress
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryAddress.streetAddress
#  ${return_value}=   Get Substring    ${return_value}   46
  [return]  ${return_value}


отримати інформацію про items[0].classification.scheme
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].classification.scheme
  [return]  ${return_value}



отримати інформацію про items[0].classification.id
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].classification.id
  [return]  ${return_value.split(' ')[0]}


отримати інформацію про items[0].classification.description
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].classification.description
  ${return_value}=   Get Substring  ${return_value}   11
  Run Keyword And Return If  '${return_value}' == 'Картонки'   Convert To String  Картонні коробки
  [return]  ${return_value}


отримати інформацію про items[0].additionalClassifications[0].scheme
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].additionalClassifications[0].scheme
  [return]  ${return_value}


отримати інформацію про items[0].additionalClassifications[0].id
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].additionalClassifications[0].id
  [return]  ${return_value.split(' ')[0]}



отримати інформацію про items[0].additionalClassifications[0].description
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].additionalClassifications[0].description
  [return]  ${return_value.split(' ',1)[1]}


Отримати інформацію про items[0].unit.code
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].unit.code
  ${return_value}=   Convert To String     ${return_value.split(' ')[1]}
  ${return_value}=   Convert To String    KGM
  [return]  ${return_value}

Отримати інформацію про items[0].unit.name
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].unit.name
  ${return_value}=   convert to string     ${return_value.split(' ')[1]}
  ${return_value}=   convert_uatenders_string_to_common_string    ${return_value}
  [return]   ${return_value}
 


Отримати посилання на аукціон для глядача
  [Arguments]  @{ARGUMENTS}
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  ${url} =          Get Element Attribute     xpath=(//table[@class='clean-table']/tbody/tr[4]/td/a)[1]@href
  Log  ${url}
  [return]  ${url}


Отримати посилання на аукціон для учасника
  [Arguments]  @{ARGUMENTS}
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  ${url} =          Get Element Attribute     xpath=(//table[@class='clean-table']/tbody/tr[4]/td/a)[1]@href
  Log  ${url}
  [return]  ${url}



отримати інформацію про items[0].quantity
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].quantity
  ${return_value}=   Convert To Number   ${return_value.split(' ')[0]}
  [return]   ${return_value}

отримати інформацію про questions[0].title
  Click Element      xpath=(//ul[@class='nav nav-tabs']/li[2]/a)[1]
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[0].title
  [return]  ${return_value}

отримати інформацію про questions[0].description
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[0].description
  [return]  ${return_value}

отримати інформацію про questions[0].date
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[0].date
  [return]  ${return_value}

отримати інформацію про questions[0].answer
  Wait Until Page Contains Element    xpath=(//ul[@class='nav nav-tabs']/li[2]/a)[1]
  Click Element                       xpath=(//ul[@class='nav nav-tabs']/li[2]/a)[1]
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[0].answer
  [return]  ${return_value}


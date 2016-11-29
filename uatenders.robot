*** Setting ***
Library  Selenium2Screenshots
Library  String
Library  DateTime
Library  uatenders_service.py

*** Variables ***

${locator.title}                                                xpath=(//div[@class='col-md-12']/h2)
${locator.description}                                          xpath=//*[@id="lot-0"]/div[1]/div/table/tbody/tr[1]/td
${locator.questions[0].title}                                   xpath=(//span[@class='item-questions.title'])
${locator.questions[0].description}                             xpath=(//div[@class='bs-callout bs-callout-warning']/p)
${locator.questions[0].date}                                    xpath=(//div[@class='bs-callout bs-callout-warning']/h4/small)[1]
${locator.questions[0].answer}                                  xpath=(//div[@class='bs-callout bs-callout-success']/p)

${locator.questions[1].title}                                   xpath=(//span[@class='item-questions.title'])
${locator.questions[1].description}                             xpath=(//div[@class='bs-callout bs-callout-warning']/p)
${locator.questions[1].date}                                    xpath=(//div[@class='bs-callout bs-callout-warning']/h4/small)[1]
${locator.questions[1].answer}                                  xpath=(//div[@class='bs-callout bs-callout-success']/p)


${locator.auctionPeriod.endDate}                                xpath=(//td[@class='auctionEndDate'])
${locator.auctionPeriod.startDate}                              xpath=(//td[@class='enquiryPeriod']/span)   


${locator.status}                                               xpath=(//table[@class='clean-table']/tbody/tr[1]/td)[1]
                       

${locator.minimalStep.amount}                                   xpath=(//table[@class='clean-table']/tbody/tr[4]/td)[1]
${locator.value.amount}                                         xpath=(//table[@class='clean-table']/tbody/tr[3]/td)[1]
${locator.value.currency}                                       xpath=(//table[@class='clean-table']/tbody/tr[4]/td)[1]
${locator.value.valueAddedTaxIncluded}                          xpath=(//span[@class='valueAddedTaxIncluded'])
${locator.auctionID}                                            xpath=(//table[@class='clean-table']/tbody/tr[2]/td)[1]
${locator.procuringEntity.name}                                 xpath=(//td[@class='item-procuringEntity.name'])
${locator.enquiryPeriod.startDate}                              xpath=/html/body/div[2]/div[1]/div[3]/div[1]/table[2]/tbody/tr[1]/td/span[1]
${locator.enquiryPeriod.endDate}                                xpath=/html/body/div[2]/div[1]/div[3]/div[1]/table[2]/tbody/tr[1]/td/span[2]
${locator.tenderPeriod.startDate}                               xpath=(//span[@class='startDate'])
${locator.tenderPeriod.endDate}                                 xpath=(//span[@class='endDate'])
${locator.items[0].quantity}                                    xpath=(//td[@class='item-amount'])
${locator.items[0].description}                                 xpath=(//td[@class='item-description'])
${locator.items[0].deliveryLocation.latitude}                   xpath=//td[(@class='item-deliveryLocation.latitude')]
${locator.items[0].deliveryLocation.longitude}                  xpath=//td[(@class='item-deliveryLocation.longitude')]
${locator.items[0].unit.code}                                   xpath=(//span[@class='amountCode'])
${locator.items[0].unit.name}                                   xpath=(//span[@class='amountDescription'])
${locator.items[0].deliveryAddress.postalCode}                  xpath=(//span[@class='item-deliveryAddress.postalCode'])
${locator.items[0].deliveryAddress.countryName}                 xpath=(//span[@class='item-deliveryAddress.countryName'])
${locator.items[0].deliveryAddress.region}                      xpath=(//span[@class='item-deliveryAddress.region'])
${locator.items[0].deliveryAddress.locality}                    xpath=(//span[@class='item-deliveryAddress.locality'])
${locator.items[0].deliveryAddress.streetAddress}               xpath=(//span[@class='item-deliveryAddress.streetAddress'])
${locator.items[0].deliveryDate.endDate}                        xpath=//*[@id="lot-0-item-0"]/table/tbody/tr[4]/td
${locator.items[0].classification.scheme}                       xpath=(//span[@class=' item-classification.scheme '])
${locator.items[0].classification.id}                           xpath=(//span[@class='id'])
${locator.items[0].classification.description}                  xpath=(//span[@class='description'])
${locator.dgf}                                                  xpath=(//b[@class='dgfLotID'])

${locator.cancellations[0].status}                             xpath=(//table[@class='clean-table']/tbody/tr[1]/td)[1]
${locator.cancellations[0].reason}                             xpath=/html/body/div/div/div[3]/div/p
${locator.cancellations[0].documents[0].title}                 xpath=(//a[@class='doc-download'])
${locator.cancellations[0].documents[0].description}           xpath=(//span[@class='docDesc'])
${locator.eligibilityCriteria}                                 xpath=(//td[@class='eligibilityCriteria'])

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
    ${title}=                Get From Dictionary         ${ARGUMENTS[1].data}             title
    ${dgf}=                  Get From Dictionary         ${ARGUMENTS[1].data}             dgfID
    ${description}=          Get From Dictionary         ${ARGUMENTS[1].data}             description
    ${budget}=               Get From Dictionary         ${ARGUMENTS[1].data.value}       amount
    ${budget}=                Convert To String           ${budget}
    ${currency}=                            Get From Dictionary         ${ARGUMENTS[1].data.value}              currency
    ${valueAddedTaxIncluded}=               Get From Dictionary         ${ARGUMENTS[1].data.value}              valueAddedTaxIncluded
    ${step_rate}=                           Get From Dictionary         ${ARGUMENTS[1].data.minimalStep}        amount
    ${step_rate} =            Convert To String           ${step_rate}
    ${dates}=                   get_all_uatenders_dates          ${ARGUMENTS[1]}
    ${start_day_auction}=        convert_datetime_for_delivery        ${dates['StartDate']}
    ${items}=                Get From Dictionary         ${ARGUMENTS[1].data}             items
    ${item0}=                Get From List               ${items}                         0
    ${descr_lot}=            Get From Dictionary         ${items[0]}                      description
    ${quantity}=             Get From Dictionary         ${items[0]}                      quantity
    ${unit}=                 Get From Dictionary         ${items[0].unit}                 name
    ${cav_id}=               Get From Dictionary         ${items[0].classification}       id
    ${postalCode}=           Get From Dictionary         ${items[0].deliveryAddress}      postalCode
    ${locality}=             Get From Dictionary         ${items[0].deliveryAddress}      locality
    ${streetAddress}=        Get From Dictionary         ${items[0].deliveryAddress}      streetAddress
    ${proc_name}=             Get From Dictionary         ${ARGUMENTS[1].data.procuringEntity}   name
    ${unit_id} =              get_unit_id                 ${unit}
  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  Maximize Browser Window
    Sleep  1
  Wait Until Page Contains Element       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[2]/li[1]/a           20
  Sleep  1
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[2]/li[1]/a
  Sleep  1
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[2]/li[1]/ul/li[2]/a
  Input text                          name=name   ${proc_name}
  Click Element                       xpath=//*[@type='submit']
  Sleep  5
  
  Wait Until Page Contains Element       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/a          9 
  Sleep  1
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/a
  Sleep  1
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/ul/li[1]/a
  Input text                          name=title  ${title}
   Sleep  1
     Sleep  3
  Click Element                       name=tax_included
  Input text                          name=lots[0][title]  ${dgf}
   Sleep  1
  Input text                          name=should_start_after   ${start_day_auction}
   Sleep  1
  Input text                           name=lots[0][items][0][quantity]  ${quantity}
  Input text                           name=lots[0][description]  ${description}
  Sleep  1
  Input text                           name=lots[0][amount]   ${budget}
  Sleep  4
  Input text                           name=lots[0][minimal_step]   ${step_rate}
  Sleep  4
  Input text                           name=lots[0][items][0][description]   ${descr_lot}
  Sleep  3
  Wait Until Page Contains Element    name=lots[0][items][0][unit_id]
  Click Element                       name=lots[0][items][0][unit_id]
  Select From List                    xpath=//select[@name="lots[0][items][0][unit_id]"]          ${unit_id}


  Sleep  11
  Input text                          name=lots[0][items][0][cav]   ${cav_id}
  Wait Until Page Contains Element       xpath=//li[@class='ui-menu-item']
  Click Element                       xpath=//li[@class='ui-menu-item']
  Sleep  3

  Click Element                       xpath=//*[@type='submit']
  Sleep  10
  Sleep  5
  Click Element                       xpath=//*[text()='Опублікувати']
  Sleep  40
  Reload Page

  Sleep  2
  ${tender_UAid}=   Отримати текст із поля і показати на сторінці   auctionID 
  [return]  ${tender_UAid}

отримати інформацію про auctionID
  ${tender_UAid}=   Отримати текст із поля і показати на сторінці   auctionID
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

Задати запитання на тендер
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
  uatenders.Пошук тендера по ідентифікатору  ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  ${bid}=        Get From Dictionary   ${ARGUMENTS[2].data.value}         amount
  ${bid} =            Convert To String           ${bid}
  Sleep  3
  Reload Page
  Click Element     xpath=//*[text()='Подати пропозицію'] 
  Sleep  10
  Input text                          name=amount     ${bid}
  Sleep  3
  Run Keyword And Ignore Error    Click Element                       xpath=//*[@id="self_eligible"]
  Sleep  3
  Click Element                       xpath=//*[@type='submit'] 
  Sleep  10
  ${is_qualified}=  is_qualified  ${ARGUMENTS[2]}    ${ARGUMENTS[0]}
  Run Keyword If  ${is_qualified} == False
  ...  Fail  "Неможливо подати пропозицію без кваліфікації"
  Run Keyword And Ignore Error    Click Element                       xpath=(//a[@class='confirmOrganizationLink'])
  Sleep  1
  Input text                          name=amount     ${bid}
  Sleep  3
  Run Keyword And Ignore Error    Click Element                       xpath=//*[@id="self_eligible"]
  Sleep  3
  Click Element                       xpath=//*[@type='submit'] 
  Sleep  10
  Sleep  3
  Click Element                       xpath=/html/body/div/div[2]/div[1]/table/tbody/tr[2]/td[9]/a/span
  Sleep  3
  Click Element                       xpath=//a[@class="btn btn-success"]



скасувати цінову пропозицію
  [Arguments]  @{ARGUMENTS} 
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}

  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Click Element               xpath=//*[text()='Редагувати пропозицію']
  Sleep  3
  Click Element               xpath=//*[text()='Відмінити']
  Sleep  10
  Wait Until Page Contains Element       xpath=//*[@id="modal-confirm-bid"]/div/div/div[3]/input
  Click Element               xpath=//*[@id="modal-confirm-bid"]/div/div/div[3]/input


Змінити цінову пропозицію
    [Arguments]  @{ARGUMENTS}
    [Documentation]
    ...    ${ARGUMENTS[0]} ==  username
    ...    ${ARGUMENTS[1]} ==  tenderId
    ...    ${ARGUMENTS[2]} ==  amount
    ...    ${ARGUMENTS[3]} ==  amount.value

    uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
    ${amount} =          Convert To String  ${ARGUMENTS[3]}
    Click Element               xpath=//*[text()='Редагувати пропозицію']
    Sleep  3
    Clear Element Text      name=amount
    Input Text              name=amount         ${amount}
    Sleep  2
    Click Element                       xpath=//*[@type='submit']
    Sleep  8
    

Завантажити документ в ставку
  [Arguments]  ${username}  ${filePath}  ${tender_uaid}
  ${filepyth}=                              get_file_path
    Reload Page
    Sleep   5
    Click Element               xpath=//*[text()='Додати файл']
    Sleep   2
    Choose File     id=bid-1            ${filepyth}
    sleep   3
    Click Element                       xpath=//*[@type='submit']

Змінити документ в ставці
    [Arguments]  @{ARGUMENTS}
    [Documentation]
    ...    ${ARGUMENTS[1]} ==  file
    ...    ${ARGUMENTS[2]} ==  tenderId
    ${filepyth}=                              get_file_path
    Reload Page
    Sleep   5

    Click Element               xpath=//*[text()='Додати файл']
    Sleep   2
    Choose File     id=bid-1            ${filepyth}
    sleep   3
    Click Element                       xpath=//*[@type='submit']

Відповісти на питання
  Sleep   20
  Reload Page
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} = username
  ...      ${ARGUMENTS[1]} = ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} = 0
  ...      ${ARGUMENTS[3]} = answer_data
  ${answer}=     Get From Dictionary  ${ARGUMENTS[3].data}  answer
  Click Element      xpath=/html/body/div[2]/div[1]/div[2]/div/ul/li[2]/a
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

  Sleep  2
  Choose File       id=tender-1       ${filepath}
  Sleep  5
  Click Element                       xpath=//*[@type='submit']
  

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
  Input text                         name=description    Тестовий тендер після редагування
  Sleep  2
  Click Element     xpath=//*[@id="submit-edit-btn"]

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


Отримати інформацію про dgfID
  ${return_value}=   Отримати текст із поля і показати на сторінці   dgf
  [return]  ${return_value}

отримати інформацію про title
  ${return_value}=   Отримати текст із поля і показати на сторінці   title
  [return]  ${return_value}

отримати інформацію про value.currency
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.currency
  [return]  ${return_value.split(' ')[1]}

Отримати інформацію про status
  reload page
  ${return_value}=   Отримати текст із поля і показати на сторінці   status
  ${return_value}=   convert_uatenders_string_to_common_string   ${return_value}
  [Return]  ${return_value}


отримати інформацію про value.valueAddedTaxIncluded
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.valueAddedTaxIncluded
  
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

отримати інформацію про auctionPeriod.startDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   auctionPeriod.startDate
  ${return_value}=            convert_auction_date     ${return_value}

  [return]  ${return_value}

Отримати інформацію про auctionPeriod.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   auctionPeriod.endDate
  ${return_value}=            convert_auction_date    ${return_value}

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
  ${return_value}=   convert_auction_date   ${return_value}
  Log To Console  ${return_value}
  [return]  ${return_value}

отримати інформацію про tenderPeriod.startDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderPeriod.startDate
  ${return_value}=   convert_auction_date   ${return_value}
  Log To Console  ${return_value}
  [return]  ${return_value}

отримати інформацію про tenderPeriod.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderPeriod.endDate
  ${return_value}=   convert_auction_date   ${return_value}
  Log To Console  ${return_value}
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
  ${return_value}=   Change_date_to_month   ${return_value}
  [return]  ${return_value}


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
  ${return_value}=   Run keyword if    '${return_value}' == 'Київ'   Convert To String  м. Київ
  [return]  ${return_value}



отримати інформацію про items[0].deliveryAddress.locality
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryAddress.locality
  ${return_value}=   Remove String   ${return_value}  ,
  [return]  ${return_value}


отримати інформацію про items[0].deliveryAddress.streetAddress
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryAddress.streetAddress
  ${return_value}=   Remove String    ${return_value}
  [return]  ${return_value}


отримати інформацію про items[0].classification.scheme
  ${return_value}=   Convert To String    CAV
  [return]  ${return_value}



отримати інформацію про items[0].classification.id
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].classification.id
  [return]  ${return_value}


отримати інформацію про items[0].classification.description
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].classification.description
  [return]  ${return_value}





Отримати інформацію про items[0].unit.code
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].unit.code
  ${return_value}=   Convert To String     ${return_value}
  [return]  ${return_value}

Отримати інформацію про items[0].unit.name
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].unit.name
  ${return_value}=   convert to string     ${return_value}
  ${return_value}=   convert_uatenders_string_to_common_string    ${return_value}
  [return]   ${return_value}



Отримати посилання на аукціон для глядача
  [Arguments]  @{ARGUMENTS}
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Sleep   3
  ${url}=  Get Element Attribute  xpath=//*[text()='Перейти до аукціону']@href
  ${url}=   convert to string   ${url}
 
  [return]  ${url}

Отримати посилання на аукціон для учасника
  [Arguments]  @{ARGUMENTS}
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Sleep   3
  ${url}=  Get Element Attribute  xpath=//*[text()='Перейти до аукціону']@href
  ${url}=   convert to string   ${url}
  
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
  Click Element      xpath=(//ul[@class='nav nav-tabs']/li[2]/a)[1]
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

отримати інформацію про questions[1].title
  Click Element      xpath=//*[@id="lot-0"]/div[2]/div/div/table/tbody/tr/td[2]/div[1]/div/ul/li[3]/a
  Sleep   3
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[1].title
  [return]  ${return_value}

отримати інформацію про questions[1].description
  Click Element      xpath=//*[@id="lot-0"]/div[2]/div/div/table/tbody/tr/td[2]/div[1]/div/ul/li[3]/a
  Sleep   3
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[1].description
  [return]  ${return_value}

отримати інформацію про questions[1].date
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[1].date
  [return]  ${return_value}

отримати інформацію про questions[1].answer
  Wait Until Page Contains Element    xpath=//*[@id="lot-0"]/div[2]/div/div/table/tbody/tr/td[2]/div[1]/div/ul/li[3]/a
  Click Element                       xpath=//*[@id="lot-0"]/div[2]/div/div/table/tbody/tr/td[2]/div[1]/div/ul/li[3]/a
  Sleep   3
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[1].answer
  [return]  ${return_value}

Підготувати дані для оголошення тендера
  [Arguments]  ${username}   ${tender_data}    ${role_name}
  ${tender_data}=    adapt_procuringEntity   ${tender_data}
  ${tender_data}=    adapt_item   ${tender_data}  ${role_name}
  [Return]  ${tender_data}

Отримати інформацію із тендера
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  fieldname
  ${return_value}=  run keyword  Отримати інформацію про ${ARGUMENTS[2]}
  [Return]  ${return_value}

Отримати текст із поля і показати на сторінці
  [Arguments]   ${fieldname}
  ${return_value}=   Get Text  ${locator.${fieldname}}
  [Return]  ${return_value}

Отримати інформацію із предмету
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  item_id
  ...      ${ARGUMENTS[3]} ==  field_name
  ${return_value}=  Run Keyword And Return  uatenders.Отримати інформацію із тендера  ${username}  ${tender_uaid}  ${field_name}
  [Return]  ${return_value}


Отримати інформацію із пропозиції
  [Arguments]  ${username}  ${tender_uaid}   ${field}
  Reload Page
  Click Element                        xpath=//*[text()='Мої пропозиції']
  Sleep   3
  Click Element                        xpath=/html/body/div[1]/div/div[1]/table/tbody/tr[2]/td[9]/a/span
  Sleep   3
  ${value}=   Get Value     name=amount 
  ${value}=   convert to string      ${value.split('.')[0]}
  ${value}=   Convert To Number      ${value}
  [Return]    ${value}

Підтвердити постачальника
    [Arguments]  ${username}  ${tender_uaid}  ${award_num}
    ${filepyth}=                              get_file_path
    uatenders.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
    sleep   5
    Reload Page
    sleep   5
    Click Element                     xpath=(//a[@class='btn btn-warning'])
    sleep   3
    
    Sleep   2
    Click Element               xpath=//*[text()='Додати файл']
    Sleep   2
    Choose File     id=award-0-1            ${filepyth}
    sleep   3
    Click Element                       xpath=//*[@type='submit']

    sleep   10
    Click Element                     xpath=(//a[@class='btn btn-xm btn-success'])



Підтвердити підписання контракту
    [Arguments]  ${username}  ${tender_uaid}  ${contract_num}
    ${filepyth}=                              get_file_path
    uatenders.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
    Click Element     xpath=/html/body/div/div[1]/div[2]/div/ul/li[4]/a
    sleep   5
    Click Element     xpath=/html/body/div/div/table/tbody/tr/td[2]/a
    sleep   2
    Input text                          name=contract_number   ${contract_num}
    Sleep   2
    Choose File     id=contract-0            ${filepyth}
    Click Element                          name=date_signed   
    Sleep   1
    Click Element                          name=period_date_start   
    Sleep   1
    Click Element                          name=period_date_end   
    Sleep   10
    Click Element                         xpath=(//a[@class='btn btn-success'])

Скасувати закупівлю
  [Arguments]  ${username}  ${tender_uaid}  ${cancellation_reason}  ${document}  ${new_description}
  uatenders.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}

  Click Element                         xpath=(//a[@class='btn btn-danger'])
  Sleep   1
  Input text                          name=reason                                     ${cancellation_reason}
  
  Sleep   2
  Choose File     id=cancel-1            ${document}
  Sleep   3
  Input text                          name=cancel[descriptions][]                                     ${new_description}
  
  Click Element                       xpath=//*[@type='submit']
  Sleep   3
  Click Element                         xpath=(//a[@class='btn btn btn-info'])
  
Отримати інформацію із документа
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}  ${field}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Sleep   3
  ${doc_value}=  Get Text       xpath=//a[contains(text(),'${doc_id}')]
  [return]  ${doc_value}

Отримати інформацію про cancellations[0].status
  ${return_value}=   Отримати текст із поля і показати на сторінці   cancellations[0].status
  ${return_value}=   convert to string     ${return_value}
  ${return_value}=   convert_uatenders_string_to_common_string    ${return_value}
  [return]  ${return_value}

Отримати інформацію про cancellations[0].reason
  Sleep   3
  Reload Page
  Click Element                 xpath=/html/body/div/div[1]/div[2]/div/ul/li[2]/a
  Sleep   3
  ${return_value}=   Отримати текст із поля і показати на сторінці   cancellations[0].reason
  [return]  ${return_value}

Отримати інформацію про cancellations[0].documents[0].title
  Sleep   3
  Reload Page
  Click Element                 xpath=/html/body/div/div[1]/div[2]/div/ul/li[2]/a
  Sleep   3
  ${return_value}=   Отримати текст із поля і показати на сторінці   cancellations[0].documents[0].title
  [return]  ${return_value}

Отримати інформацію про cancellations[0].documents[0].description
  Sleep   3
  Reload Page
  Click Element                 xpath=/html/body/div/div[1]/div[2]/div/ul/li[2]/a
  Sleep   3
  ${return_value}=   Отримати текст із поля і показати на сторінці   cancellations[0].documents[0].description
  [return]  ${return_value}

Додати Virtual Data Room
  [Arguments]  ${username}  ${tender_uaid}  ${vdr_url}  ${title}=Sample Virtual Data Room
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                       xpath=//*[text()='Редагувати']
  Sleep   3
  Click Element                       xpath=//*[text()='Додати VDR']
  Sleep   1
  Input text                          name=vdr[]     ${vdr_url}
  Sleep   1
  Click Element                       xpath=//*[@type='submit']

Завантажити ілюстрацію
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}

  ${filepath}=   local_path_to_file   TestDocument.docx
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                       xpath=//*[text()='Редагувати']
  Sleep  2
  Choose File       id=tender-1       ${filepath}
  Sleep  5
  Click Element                       xpath=//*[@id="edit-form-submit"]/div[8]/div/div[1]/div[1]/span/span[1]/span
  Sleep  2
  Click Element                       xpath=//*[text()='Ілюстрації']
  Click Element                       xpath=//*[@type='submit']


Отримати інформацію про eligibilityCriteria
  ${return_value}=   Отримати текст із поля і показати на сторінці   eligibilityCriteria
  [return]  ${return_value}


Отримати інформацію із запитання
  [Arguments]  ${username}  ${tender_uaid}  ${question_id}  ${field_name}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element      xpath=/html/body/div[2]/div[1]/div[2]/div/ul/li[2]/a
  ${return_value}=   Отримати текст із поля і показати на сторінці    ${field_name}
  ${return_value}=      Convert To String ${return_value}
  [return]  ${return_value}



Задати запитання на предмет
  [Arguments]  ${username}  ${tender_uaid}  ${item_id}  ${question}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                       xpath=(//a[@class='btn btn-success pull-right itemQuestion'])
  Sleep  2
  Input text                          name=title                                      ${question.data.title}
  Input Text                          name=question                                   ${question.data.description}
  Click Element                       xpath=//*[@type='submit']
  Sleep  15


Відповісти на запитання
  [Arguments]  ${username}  ${tender_uaid}  ${answer_data}  ${question_id}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[2]/a/span
  Sleep  2
  Click Element                       xpath=//*[text()='Відповісти']
  Sleep  2
  Click Element                       xpath=//*[text()='Відповісти']
  Input Text                          name=answer                                   ${answer_data.data.answer}
  Click Element                       xpath=//*[@type='submit']




Отримати документ
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}
  ${file_name}=       Get Text     xpath=//a[contains(text(),'${doc_id}')]
  Log To Console  ${file_name}
  ${url}=         Get Element Attribute   xpath=//a[contains(text(),'${doc_id}')]@href
  Log To Console  ${url}
  download   ${url}  ${file_name}  ${OUTPUT_DIR}
  [return]  ${file_name} 
  

Завантажити фінансову ліцензію
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element               xpath=//*[text()='Редагувати пропозицію']
  Sleep  3
  Choose File                  name=bid[files][]       ${filepath}

  Select From List                    name=bid[docTypes][]         12

  Sleep  2
  Click Element                       xpath=//*[@type='submit']

Скасування рішення кваліфікаційної комісії
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Sleep  2
  Click Element                     xpath=(//a[@class='btn btn-warning'])
  Sleep  2
  Click Element                     xpath=/html/body/div/div/div[3]/div/a
    
Завантажити документ рішення кваліфікаційної комісії
  [Arguments]  ${username}  ${document}  ${tender_uaid}  ${award_num}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Sleep  2
  Click Element                     xpath=(//a[@class='btn btn-warning'])
  Sleep   2
  Click Element                     xpath=//*[text()='Додати файл']
  Sleep   2
  Choose File     id=award-0-1            ${document}
  sleep   3
  Click Element                       xpath=//*[@type='submit']

Дискваліфікувати постачальника
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}  ${description}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Sleep  2
  Click Element                     xpath=(//a[@class='btn btn-warning'])
  Sleep  2
  Click Element                     xpath=/html/body/div/div/div[3]/div/a[2]
  Sleep  2
  Input text                           name=unsuccessful_title  ${award_num}
  Input text                           name=unsuccessful_description  ${description}
  Click Element                       xpath=//*[@type='submit']  

Завантажити угоду до тендера
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}  ${filepath}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Sleep  2
  Click Element                     xpath=/html/body/div/div[1]/div[2]/div/ul/li[4]/a
  Sleep  2
  Click Element                     xpath=/html/body/div/div/table/tbody/tr/td[2]/a
  Sleep  2
  Click Element                     xpath=//*[text()='Додати файл']
  Sleep  2
  Choose File         name=contract[files][]            ${filepath}
  Sleep  2
  Click Element                       xpath=//*[@type='submit']


Отримати кількість документів в ставці
  [Arguments]  ${username}  ${tender_uaid}  ${bid_index}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Sleep  2
  Click Element                     xpath=(//a[@class='btn btn-warning'])
  Sleep  2
  ${return_value}=                  Get Text  xpath=/html/body/div/div/div[3]/div/div/table/tbody/tr[9]/td/p/span
  [Return]  ${return_value}
  
  
Завантажити протокол аукціону
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}  ${award_index}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Sleep  2
  Click Element               xpath=//*[text()='Редагувати пропозицію']
  Sleep  3
  Choose File                  name=bid[files][]       ${filepath}

  Select From List                    name=bid[docTypes][]         15

  Sleep  2
  Click Element                       xpath=//*[@type='submit']

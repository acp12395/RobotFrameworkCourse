*** Settings ***
Documentation    Test REST API
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${url}=    https://api.restful-api.dev
${CONTENT_TYPE}

*** Test Cases ***
GET request test
    Create Session    Session_GET    ${url}
    ${response}=    GET On Session    Session_GET    /objects
    ${code}=        convert to string    ${response.status_code}
    should be equal    ${code}    200
    Log To Console    Content = ${response.content}
    Log To Console    Headers = ${response.headers}
    Should contain    ${response.content}    Google Pixel 6 Pro
    Set Global Variable    ${CONTENT_TYPE}    ${response.headers["Content-Type"]}
    Delete All Sessions

POST request test
    Create Session    Session_POST    ${url}
    &{data}=    Create Dictionary    year=2019    price=1849.99    CPU model=Intel Core i9    Hard disk size=1 TB
    &{body}=    Create Dictionary    name=Apple MacBook Pro 16    data=&{data}
    &{header}=    Create Dictionary    Content-Type=${CONTENT_TYPE}
    ${response}=    POST On Session    Session_POST    /objects    json=&{body}    headers=&{header}
    ${code}=        convert to string    ${response.status_code}
    should be equal    ${code}    200
    Should contain    ${response.content}    Apple MacBook Pro 16
    Delete All Sessions

PUT request test
    Create Session    Session_PUT    ${url}
    &{data}=    Create Dictionary    year=2019    price=1849.99    CPU model=Intel Core i9    Hard disk size=1 TB
    &{body}=    Create Dictionary    name=Apple MacBook Pro 16    data=&{data}
    &{header}=    Create Dictionary    Content-Type=${CONTENT_TYPE}
    ${response}=    POST On Session    Session_PUT    /objects    json=&{body}    headers=&{header}
    ${json_obj}=    Convert String To JSON    ${response.content}
    ${id}=    Get From Dictionary    ${json_obj}    id

    ${code}=        convert to string    ${response.status_code}
    should be equal    ${code}    200
    log to console    ${response.content}

    &{data}=    Create Dictionary    year=2019    price=1849.99    CPU model=Intel Core i9    Hard disk size=1 TB
    ...    color=Black
    &{body}=    Create Dictionary    name=Apple MacBook Pro 16    data=&{data}
    ${response}=    PUT On Session    Session_PUT    /objects/${id}    json=&{body}    headers=&{header}
    ${code}=        convert to string    ${response.status_code}
    should be equal    ${code}    200
    Should contain    ${response.content}    Black

DELETE request test
    Create Session    Session_DELETE    ${url}
    &{data}=    Create Dictionary    year=2019    price=1849.99    CPU model=Intel Core i9    Hard disk size=1 TB
    &{body}=    Create Dictionary    name=Apple MacBook Pro 16    data=&{data}
    &{header}=    Create Dictionary    Content-Type=${CONTENT_TYPE}
    ${response}=    POST On Session    Session_DELETE    /objects    json=&{body}    headers=&{header}
    ${json_obj}=    Convert String To Json    ${response.content}
    ${id}=    Get From Dictionary    ${json_obj}    id

    ${code}=        convert to string    ${response.status_code}
    should be equal    ${code}    200

    ${response}=    DELETE On Session    Session_DELETE    /objects/${id}    json=&{body}    headers=&{header}
    ${code}=        convert to string    ${response.status_code}
    should be equal    ${code}    200
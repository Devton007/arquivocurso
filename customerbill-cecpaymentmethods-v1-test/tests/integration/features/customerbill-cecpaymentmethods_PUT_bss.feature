@apiproxy
Feature: customerbill-cecpaymentmethods-v1

  @services @PUT
  Scenario: 0. Prep variables

    Given I set variable body200 in global scope to { "data": { "paymentMethodId": "a2o6t000000UGVnAAO", "paymentMethodStatus": "Inactive" } }
    Given I set variable body400_1 in global scope to { "data": { "paymentMethodId": "", "paymentMethodStatus": "Inactive" } }



  Scenario: Request para pegar o token
      Given I use variables from app ClaroTvPlus-BFF-OAuth-Test-App
    And I set headers to
      | name             | value                             |
      | `authHeaderName` | `authHeaderValue`                 |
      | Content-Type     | application/x-www-form-urlencoded |
      | Accept           | application/json                  |
    And I set body to grant_type=client_credentials
    When I POST /oauth2/v1/token
    Then response code should be 200
    Then response body should be valid json
    Then response body path $.access_token should be (\w+)
    And I store the value of body path $.access_token as access_token in global scope

  Scenario:CT1 - Campos informados corretamente - Cod. 200 (SUCESSO)
    Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok-PUT
    And I set headers to
      | name          | value                               |
                 | Authorization | Bearer `access_token`                               |
      | Content-Type  | application/json                    |
      | Accept        | application/json                    |
      | x-target      | test06                              |
    And I set body to `body200`
    When I PUT /customerbill/v1/cec/paymentmethods/status
    Then response code should be 200
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body path $.data should be [a-zA-Z]


  Scenario:US114030_CT2 -NÃO INFORMAR paymentMethodId  - Cod.400 (ERRO)
      Given I use variables from app ClaroTvPlus-BFF-OAuth-Test-App
    And I set headers to
      | name          | value                               |
                 | Authorization | Bearer `access_token`                               |
      | Content-Type  | application/json                    |
      | Accept        | application/json                    |
      | x-target      | test06                              |
    And I set body to `body400_1`
    When I PUT /customerbill/v1/cec/paymentmethods/status
    Then response code should be 400
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body path $.error should be [a-zA-Z]

  Scenario:US114030_CT3 Unauthorized 401 (ERRO)
      Given I use variables from app ClaroTvPlus-BFF-OAuth-Test-App
    And I set headers to
      | name          | value            |
      | Authorization | Bearer           |
      | Content-Type  | application/json |
      | Accept        | application/json |
    When I PUT /customerbill/v1/cec/paymentmethods/status
    Then response code should be 401
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body path $.error should be [a-zA-Z]

  Scenario:US114030_CT4 Forbidden 403 (ERRO)
    Given I use variables from app customerbill-cecpaymentmethods-v1-np
    And I set headers to
      | name          | value                                                                      |
      | Authorization | Basic aW40dTlGcEFKWWJVVnJHeXB5RWFUQTRQVTRYTEFhRlU6WWRjT3BXOWZYU3FQaGpxYw== |
      | Content-Type  | application/json                                                           |
      | Accept        | application/json                                                           |
      | x-target      | test06                                                                     |
    When I PUT /customerbill/v1/cec/paymentmethods/status /
    Then response code should be 403
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body path $.data should be [a-zA-Z]
    And response body path $.error should be [a-zA-Z]

  Scenario:US114030_CT5 not found  404 (ERRO)
      Given I use variables from app ClaroTvPlus-BFF-OAuth-Test-App
    And I set headers to
      | name          | value                               |
                 | Authorization | Bearer `access_token`                               |
      | Content-Type  | application/json                    |
      | Accept        | application/json                    |
    When I PUT /customerbill/v1/cec/paymentmethods/status/soap
    Then response code should be 404
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body path $.error should be [a-zA-Z]

  Scenario:CUS114030_CT6 Method Not Allowed 405 (ERRO)
      Given I use variables from app ClaroTvPlus-BFF-OAuth-Test-App
    And I set headers to
      | name          | value                               |
                 | Authorization | Bearer `access_token`                               |
      | Content-Type  | application/json                    |
      | Accept        | application/json                    |
      | x-target      | test06                              |
    When I PATCH /customerbill/v1/cec/paymentmethods/status
    Then response code should be 405
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body path $.data should be [a-zA-Z]

  Scenario:US114030_CT7 Not Acceptable 406 (ERRO))
      Given I use variables from app ClaroTvPlus-BFF-OAuth-Test-App
    And I set headers to
      | name          | value                               |
                 | Authorization | Bearer `access_token`                               |
      | Content-Type  | application/json                    |
    #           | Accept        | application/json      |
    When I PUT /customerbill/v1/cec/paymentmethods/status
    Then response code should be 406
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body path $.error should be [a-zA-Z]

  Scenario:US114030_CT9 Too Many Requests 429 (ERRO)
    And I set headers to
      | name          | value                                                                      |
      | Authorization | Basic eHllbm85WENoVnZIb09uVkhlQVl1M1ZHVEUyWExIekE6djVzN2x3UUY3cXViMlNWeA== |
      | Content-Type  | application/json                                                           |
      | Accept        | application/json                                                           |
      | x-target      | test06                                                                     |
    When I PUT /customerbill/v1/cec/paymentmethods/status
    Then response code should be 429
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body path $.error should be [a-zA-Z]


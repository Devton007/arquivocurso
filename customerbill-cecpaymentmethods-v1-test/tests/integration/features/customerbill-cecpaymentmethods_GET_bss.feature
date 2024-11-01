@apiproxy
Feature: customerbill-cecpaymentmethods-v1-ok

    @services @GET
    Scenario: 0. Prep variables


    Scenario: Request para pegar o token
        Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok
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

    Scenario:US114030_CT01 - sem cartaoes cadastrados - Cod. 201 (SUCESSO)
        And I set headers to
            | name          | value                                       |
                  | Authorization | Bearer `access_token`                               |
            | X-QueryString | documentType=CPF&documentNumber=53723641814 |
            | Content-Type  | application/json                            |
            | Accept        | application/json                            |
            | x-target      | test06                                      |
        When I GET /customerbill/v1/cec/paymentmethods?businessUnit=NewStack
        Then response code should be 200
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.data should be [a-zA-Z]


    Scenario:GET-US114030_CT02 - Campos informados corretamente - Cod. 201 (SUCESSO)
        And I set headers to
            | name          | value                                       |
                  | Authorization | Bearer `access_token`                               |
            | X-QueryString | documentType=CPF&documentNumber=33241734935 |
            | Content-Type  | application/json                            |
            | Accept        | application/json                            |
            | x-target      | test06                                      |
        When I GET /customerbill/v1/cec/paymentmethods?businessUnit=NewStack
        Then response code should be 200
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.data should be [a-zA-Z]

    Scenario:GET-US114030_CT02 - Campos informados corretamente - Cod. 201 (SUCESSO)
        And I set headers to
            | name          | value                                       |
                  | Authorization | Bearer `access_token`                               |
            | X-QueryString | documentType=CPF&documentNumber=33241734935 |
            | Content-Type  | application/json                            |
            | Accept        | application/json                            |
            | x-target      | test06                                      |
        When I GET /customerbill/v1/cec/paymentmethods?businessUnit=NewStack
        Then response code should be 200
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.data should be [a-zA-Z]

    Scenario:US114030_CT2 -NÃO INFORMAR X-QueryString  - Cod.400 (ERRO)
        And I set headers to
            | name          | value                               |
                  | Authorization | Bearer `access_token`                               |
            #            | X-QueryString | documentType=CPF&documentNumber=33241734935           |
            | Content-Type  | application/json                    |
            | Accept        | application/json                    |
            | x-target      | test06                              |
        When I GET /customerbill/v1/cec/paymentmethods?businessUnit=NewStack
        Then response code should be 400
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:GET-US114030_CT04 Unauthorized 401 (ERRO)
        And I set headers to
            | name          | value                                       |
            | X-QueryString | documentType=CPF&documentNumber=33241734935 |
            | Content-Type  | application/json                            |
            | Accept        | application/json                            |
            | x-target      | test06                                      |
        When I GET /customerbill/v1/cec/paymentmethods?businessUnit=NewStack
        Then response code should be 401
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:GET-US114030_CT05 Forbidden 403 (ERRO)
        And I set headers to
            | name          | value                                                                      |
            | Authorization | Basic bVFKR283Z0ZxSEV5U0JPTjRnQkxQN1RHUWFmZkNWY2c6OVZCZE1jcHZjWml1TDFKag== |
            | X-QueryString | documentType=CPF&documentNumber=33241734935                                |
            | Content-Type  | application/json                                                           |
            | Accept        | application/json                                                           |
            | x-target      | test06                                                                     |
        When I GET /customerbill/v1/cec/paymentmethods?businessUnit=NewStack
        Then response code should be 403
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    # N/A Scenario:US114030_CT06 not found  404 (ERRO)
    #        And I set headers to
    #            | name          | value                                       |
    #                  | Authorization | Bearer `access_token`                               |
    #            | X-QueryString | documentType=CPF&documentNumber=53723641814 |
    #            | Content-Type  | application/json                            |
    #            | Accept        | application/json                            |
    #            | x-target      | test06                                      |
    #        When I GET /customerbill/v1/cec/paymentmethods?businessUnit=NewStack
    #        Then response code should be 404
    #        And response body should be valid json
    #        And response body path $.apiVersion should be (.*)
    #        And response body path $.transactionId should be (.*)
    #        And response body path $.error should be [a-zA-Z]

    Scenario:US114030_CT07Method Not Allowed 405 (ERRO)
        And I set headers to
            | name          | value                                       |
                  | Authorization | Bearer `access_token`                               |
            | X-QueryString | documentType=CPF&documentNumber=53723641814 |
            | Content-Type  | application/json                            |
            | Accept        | application/json                            |
            | x-target      | test06                                      |
        When I PATCH /customerbill/v1/cec/paymentmethods?businessUnit=NewStack
        Then response code should be 405
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:US114030_CT07Method Not Allowed 406 (ERRO)
        And I set headers to
            | name          | value                                       |
                  | Authorization | Bearer `access_token`                               |
            | X-QueryString | documentType=CPF&documentNumber=53723641814 |
            | Content-Type  | application/json                            |
            | x-target      | test06                                      |
        When I GET /customerbill/v1/cec/paymentmethods?businessUnit=NewStack
        Then response code should be 406
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:US114030_CT09 API-CECPAYMENTMETHODS-001: Customer not found. 422 (ERRO)
        And I set headers to
            | name          | value                                        |
                  | Authorization | Bearer `access_token`                               |
            | X-QueryString | documentType=CPF&documentNumber=537236418141 |
            | Content-Type  | application/json                             |
            | Accept        | application/json                             |
            | x-target      | test06                                       |
        When I GET /customerbill/v1/cec/paymentmethods?businessUnit=NewStack
        Then response code should be 422
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:US114030_CT09 API-CECPAYMENTMETHODS-001: Customer not found. 422 (ERRO)
        And I set headers to
            | name          | value                                                                      |
            | Authorization | Basic N0szc0FBY2xoczZpVm1PWThuc1hNUFlyT3pnTFNqbGI6UmpkZjVtM0VlUDlRZTZHSg== |
            | X-QueryString | documentType=CPF&documentNumber=53723641814                                |
            | Content-Type  | application/json                                                           |
            | Accept        | application/json                                                           |
            | x-target      | test06                                                                     |
        When I GET /customerbill/v1/cec/paymentmethods?businessUnit=NewStack
        Then response code should be 429
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]
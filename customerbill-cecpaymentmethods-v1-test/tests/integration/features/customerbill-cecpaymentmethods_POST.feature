@apiproxy
Feature: customerbill-cecpaymentmethods-v1-app-bss-ok

    @services @POST
    Scenario: 0. Prep variables

        Given I set variable body201 in global scope to { "data": { "customerAccountId": "0016t00000msf0JAAQ", "businessUnit": "NewStack", "paymentMethod": { "type": "CreditCard", "creditCard": { "brand": "Master", "holder": "Naomi Ferreira", "lastFourNumber": "8391", "expirationDate": "042025", "firstToken": "91CDC1AD-DFB9-4460-9393-3D3C8A83B1A5", "secondToken": "3256CA16-EFE0-48F5-B9F4-AD29B595BB4C" } } } }
        Given I set variable body400_1 in global scope to { "data": { "customerAccountId": "", "businessUnit": "NewStack", "paymentMethod": { "type": "CreditCard", "creditCard": { "brand": "Master", "holder": "Hildegardo da Cunha", "lastFourNumber": "0099", "expirationDate": "052024", "firstToken": "FADCCBE7-D363-44C7-919E-D6D7162A83B0", "secondToken": "3256CA16-EFE0-48F5-B9F4-AD29B595BB4C" } } } }
        Given I set variable body400_2 in global scope to { "data": { "customerAccountId": "0016t00000lVfP0AAK", "businessUnit": "", "paymentMethod": { "type": "CreditCard", "creditCard": { "brand": "", "holder": "Hildegardo da Cunha", "lastFourNumber": "0099", "expirationDate": "052024", "firstToken": "FADCCBE7-D363-44C7-919E-D6D7162A83B0", "secondToken": "3256CA16-EFE0-48F5-B9F4-AD29B595BB4C" } } } }
        Given I set variable body400_3 in global scope to { "data": { "customerAccountId": "0016t00000lVfP0AAK", "businessUnit": "NewStack", "paymentMethod": { "type": "CreditCard", "creditCard": { "brand": "", "holder": "Hildegardo da Cunha", "lastFourNumber": "0099", "expirationDate": "052024", "firstToken": "FADCCBE7-D363-44C7-919E-D6D7162A83B0", "secondToken": "3256CA16-EFE0-48F5-B9F4-AD29B595BB4C" } } } }
        Given I set variable body400_4 in global scope to { "data": { "customerAccountId": "0016t00000lVfP0AAK", "businessUnit": "NewStack", "paymentMethod": { "type": "CreditCard", "creditCard": { "brand": "Master", "holder": "", "lastFourNumber": "0099", "expirationDate": "052024", "firstToken": "FADCCBE7-D363-44C7-919E-D6D7162A83B0", "secondToken": "3256CA16-EFE0-48F5-B9F4-AD29B595BB4C" } } } }
        Given I set variable body400_5 in global scope to { "data": { "customerAccountId": "0016t00000lVfP0AAK", "businessUnit": "NewStack", "paymentMethod": { "type": "CreditCard", "creditCard": { "brand": "Master", "holder": "Hildegardo da Cunha", "lastFourNumber": "", "expirationDate": "052024", "firstToken": "FADCCBE7-D363-44C7-919E-D6D7162A83B0", "secondToken": "3256CA16-EFE0-48F5-B9F4-AD29B595BB4C" } } } }
        Given I set variable body400_6 in global scope to { "data": { "customerAccountId": "0016t00000lVfP0AAK", "businessUnit": "NewStack", "paymentMethod": { "type": "CreditCard", "creditCard": { "brand": "Master", "holder": "Hildegardo da Cunha", "lastFourNumber": "0099", "expirationDate": "", "firstToken": "FADCCBE7-D363-44C7-919E-D6D7162A83B0", "secondToken": "3256CA16-EFE0-48F5-B9F4-AD29B595BB4C" } } } }
        Given I set variable body400_7 in global scope to { "data": { "customerAccountId": "0016t00000lVfP0AAK", "businessUnit": "NewStack", "paymentMethod": { "type": "CreditCard", "creditCard": { "brand": "Master", "holder": "Hildegardo da Cunha", "lastFourNumber": "0099", "expirationDate": "052024", "firstToken": "", "secondToken": "3256CA16-EFE0-48F5-B9F4-AD29B595BB4C" } } } }
        Given I set variable body422 in global scope to { "data": { "customerAccountId": "0016t00000lVfP0AAK", "businessUnit": "NewStack", "paymentMethod": { "type": "CreditCard", "creditCard": { "brand": "Master", "holder": "Hildegardo da Cunha", "lastFourNumber": "0099", "expirationDate": "052024", "firstToken": "FADCCBE7-D363-44C7-919E-D6D7162A83B0", "secondToken": "3256CA16-EFE0-48F5-B9F4-AD29B595BB4C" } } } }





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

    Scenario:CT1 - Campos informados corretamente - Cod. 201 (SUCESSO)
        Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok
        And I set headers to
            | name          | value                               |
                  | Authorization | Bearer `access_token`                               |
            | Content-Type  | application/json                    |
            | Accept        | application/json                    |
            | x-target      | test06                              |
        And I set body to `body201`
        When I POST to /customerbill/v1/cec/paymentmethods
        Then response code should be 201
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.data should be [a-zA-Z]


    Scenario:US114030_CT2 -NÃO INFORMAR CUSTOMER ID - Cod.400 (ERRO)
        Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok
        And I set headers to
            | name          | value                               |
                  | Authorization | Bearer `access_token`                               |
            | Content-Type  | application/json                    |
            | Accept        | application/json                    |
            | x-target      | test06                              |
        And I set body to `body400_1`
        When I POST to /customerbill/v1/cec/paymentmethods
        Then response code should be 400
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:US114030_CT3 -NÃO INFORMAR paymentType - Cod.400 (ERRO)
        Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok
        And I set headers to
            | name          | value                               |
                  | Authorization | Bearer `access_token`                               |
            | Content-Type  | application/json                    |
            | Accept        | application/json                    |
            | x-target      | test06                              |
        And I set body to `body400_2`
        When I POST to /customerbill/v1/cec/paymentmethods
        Then response code should be 400
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:US114030_CT4 -NÃO INFORMAR creditCard.brand - Cod.400 (ERRO)
        Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok
        And I set headers to
            | name          | value                               |
                  | Authorization | Bearer `access_token`                               |
            | Content-Type  | application/json                    |
            | Accept        | application/json                    |
            | x-target      | test06                              |
        And I set body to `body400_3`
        When I POST to /customerbill/v1/cec/paymentmethods
        Then response code should be 400
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:US114030_CT5 -NÃO INFORMAR creditCard.holder - Cod.400 (ERRO)
        Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok
        And I set headers to
            | name          | value                               |
                  | Authorization | Bearer `access_token`                               |
            | Content-Type  | application/json                    |
            | Accept        | application/json                    |
            | x-target      | test06                              |
        And I set body to `body400_4`
        When I POST to /customerbill/v1/cec/paymentmethods
        Then response code should be 400
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:US114030_CT6 -NÃO INFORMAR creditCard.lastFourNumber - Cod.400 (ERRO)
        Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok
        And I set headers to
            | name          | value                               |
                  | Authorization | Bearer `access_token`                               |
            | Content-Type  | application/json                    |
            | Accept        | application/json                    |
            | x-target      | test06                              |
        And I set body to `body400_5`
        When I POST to /customerbill/v1/cec/paymentmethods
        Then response code should be 400
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:US114030_CT7 -NÃO INFORMAR creditCard.expirationDate - Cod.400 (ERRO)
        Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok
        And I set headers to
            | name          | value                               |
                  | Authorization | Bearer `access_token`                               |
            | Content-Type  | application/json                    |
            | Accept        | application/json                    |
            | x-target      | test06                              |
        And I set body to `body400_6`
        When I POST to /customerbill/v1/cec/paymentmethods
        Then response code should be 400
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:US114030_CT8 -NÃO INFORMAR creditCard.firstToken - Cod.400 (ERRO)
        Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok
        And I set headers to
            | name          | value                               |
                  | Authorization | Bearer `access_token`                               |
            | Content-Type  | application/json                    |
            | Accept        | application/json                    |
            | x-target      | test06                              |
        And I set body to `body400_7`
        When I POST to /customerbill/v1/cec/paymentmethods
        Then response code should be 400
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:CT13 - Unauthorized sem parametro no token - Cod. 401 (ERRO)
        Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok
        And I set headers to
            | name         | value            |
            #| Authorization | Bearer 6GadsvJHBSeTNGBuAl6FPCo9bSA6 |
            | Content-Type | application/json |
            | Accept       | application/json |
        When I POST to /customerbill/v1/cec/paymentmethods
        Then response code should be 401
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:CT14 - Forbidden - Cod. 403 (ERRO)
        Given I use variables from app customerbill-cecpaymentmethods-v1-np
        And I set headers to
            | name          | value                                                                      |
            | Authorization | Basic bVFKR283Z0ZxSEV5U0JPTjRnQkxQN1RHUWFmZkNWY2c6OVZCZE1jcHZjWml1TDFKag== |
            | Content-Type  | application/json                                                           |
            | Accept        | application/json                                                           |
            | x-target      | test06                                                                     |
        When I POST to /customerbill/v1/cec/paymentmethods/
        Then response code should be 403
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.data should be [a-zA-Z]
        And response body path $.error should be [a-zA-Z]

    Scenario:CT15 - Not Found - Cod. 404 (ERRO)
        Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok
        And I set headers to
            | name          | value                               |
                  | Authorization | Bearer `access_token`                               |
            | Content-Type  | application/json                    |
            | Accept        | application/json                    |
        When I POST to /customerbill/v1/cec/paymentmethods/soap
        Then response code should be 404
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:CT16 - Method Not Allowed - Cod. 405 (ERRO)
        Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok
        And I set headers to
            | name          | value                               |
                  | Authorization | Bearer `access_token`                               |
            | Content-Type  | application/json                    |
            | Accept        | application/json                    |
            | x-target      | test06                              |
        When I PATCH /customerbill/v1/cec/paymentmethods
        Then response code should be 405
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.data should be [a-zA-Z]

    Scenario:CT17 - Not Acceptable - Cod. 406 (ERRO)
        Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok
        And I set headers to
            | name          | value                               |
                  | Authorization | Bearer `access_token`                               |
            | Content-Type  | application/json                    |
        #           | Accept        | application/json      |
        When I POST to /customerbill/v1/cec/paymentmethods
        Then response code should be 406
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:CT19 - Unprocessable Entity - Cod. 422 (ERRO)
        Given I use variables from app customerbill-cecpaymentmethods-v1-app-bss-ok
        And I set headers to
            | name          | value                               |
                  | Authorization | Bearer `access_token`                               |
            | Content-Type  | application/json                    |
            | Accept        | application/json                    |
            | x-target      | test06                              |
        And I set body to `body422`
        When I POST to /customerbill/v1/cec/paymentmethods
        Then response code should be 422
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

    Scenario:TESTE 429. (ERRO)
        And I set headers to
            | name          | value                                                                      |
            | Authorization | Basic N0szc0FBY2xoczZpVm1PWThuc1hNUFlyT3pnTFNqbGI6UmpkZjVtM0VlUDlRZTZHSg== |
            | X-QueryString | documentType=CPF&documentNumber=53723641814                                |
            | Content-Type  | application/json                                                           |
            | Accept        | application/json                                                           |
            | x-target      | test06                                                                     |
        When I POST to /customerbill/v1/cec/paymentmethods
        Then response code should be 429
        And response body should be valid json
        And response body path $.apiVersion should be (.*)
        And response body path $.transactionId should be (.*)
        And response body path $.error should be [a-zA-Z]

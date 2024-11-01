# Autor: Ramiro Brandão @ Spread
# Data: 02/06/2023

# Autor: Ramiro Brandão @ Spread
# Data: 11/09/2023

Feature: @customerbill-cecpaymentmethods-v1

  API responsável por criar registros de Método de Pagamento na plataforma Salesforce/Vlocity.
  O Cliente (Account) é a pessoa (Inicialmente Física) que solicitará a criação de seu Método de Pagamento (Payment Method).

  ######### - Preparar variáveis para os cenários de teste - #########
  @set-variables
  Scenario: Prepara variáveis
    #### Cenários de positivos com dados válidos ###########

    Given I set variable request_paymentMethod in global scope to {"data":{"customerAccountId":"0016t00000c416WAAQ","paymentMethod":{"type":"CreditCard","creditCard":{"brand":"Master","holder":"Marco Antonio Ribeiro Vendramini","lastFourNumber":"8019","expirationDate":"052024","firstToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C","secondToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}

    #### Cenários negativos com dados inválidos ###########

    Given I set variable badrequest_customerAccountId in global scope to {"data":{"paymentMethod":{"type":"CreditCard","creditCard":{"brand":"Master","holder":"Marco Antonio Ribeiro Vendramini","lastFourNumber":"8019","expirationDate":"052024","firstToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C","secondToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}
    Given I set variable badrequest_paymentMethod in global scope to {"data":{"customerAccountId":"0016t00000c416WAAQ","":{"type":"CreditCard","creditCard":{"brand":"Master","holder":"Marco Antonio Ribeiro Vendramini","lastFourNumber":"8019","expirationDate":"052024","firstToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C","secondToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}
    Given I set variable badrequest_type in global scope to {"data":{"customerAccountId":"0016t00000c416WAAQ","paymentMethod":{"creditCard":{"brand":"Master","holder":"Marco Antonio Ribeiro Vendramini","lastFourNumber":"8019","expirationDate":"052024","firstToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C","secondToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}
    Given I set variable badrequest_creditCard in global scope to {"data":{"customerAccountId":"0016t00000c416WAAQ","paymentMethod":{"type":"CreditCard","":{"brand":"Master","holder":"Marco Antonio Ribeiro Vendramini","lastFourNumber":"8019","expirationDate":"052024","firstToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C","secondToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}
    Given I set variable badrequest_brand in global scope to {"data":{"customerAccountId":"0016t00000c416WAAQ","paymentMethod":{"type":"CreditCard","creditCard":{"holder":"Marco Antonio Ribeiro Vendramini","lastFourNumber":"8019","expirationDate":"052024","firstToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C","secondToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}
    Given I set variable badrequest_holder in global scope to {"data":{"customerAccountId":"0016t00000c416WAAQ","paymentMethod":{"type":"CreditCard","creditCard":{"brand":"Master","lastFourNumber":"8019","expirationDate":"052024","firstToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C","secondToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}
    Given I set variable badrequest_lastFourNumber in global scope to {"data":{"customerAccountId":"0016t00000c416WAAQ","paymentMethod":{"type":"CreditCard","creditCard":{"brand":"Master","holder":"Marco Antonio Ribeiro Vendramini","expirationDate":"052024","firstToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C","secondToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}
    Given I set variable badrequest_expirationDate in global scope to {"data":{"customerAccountId":"0016t00000c416WAAQ","paymentMethod":{"type":"CreditCard","creditCard":{"brand":"Master","holder":"Marco Antonio Ribeiro Vendramini","lastFourNumber":"8019","firstToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C","secondToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}
    Given I set variable badrequest_firstToken in global scope to {"data":{"customerAccountId":"0016t00000c416WAAQ","paymentMethod":{"type":"CreditCard","creditCard":{"brand":"Master","holder":"Marco Antonio Ribeiro Vendramini","lastFourNumber":"8019","expirationDate":"052024","secondToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}
    Given I set variable badrequest_secondToken in global scope to {"data":{"customerAccountId":"0016t00000c416WAAQ","paymentMethod":{"type":"CreditCard","creditCard":{"brand":"Master","holder":"Marco Antonio Ribeiro Vendramini","lastFourNumber":"8019","expirationDate":"052024","firstToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}

    Given I set variable body422 in global scope to { "data": { "customerAccountId": "0016t00000lVcssAAC", "businessUnit": "NewStack", "paymentMethod": { "type": "CreditCard", "creditCard": { "brand": "Master", "holder": "Zaide da Rocha", "lastFourNumber": "8428", "expirationDate": "052024", "firstToken": "4F4F6622-A0A5-4D0C-B559-9BE2C3483446", "secondToken": "3256CA16-EFE0-48F5-B9F4-AD29B595BB4C" } } } }

    Given I set variable entityTooLarge in global scope to {     "data": {         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",         "customerAccountId": "0016t00000WRMP0AAP",     "paymentMethod": {             "type": "CreditCard",             "creditCard": {                 "brand": "Master",                 "holder": "Marco Antonio Ribeiro Vendramini",                 "lastFourNumber": "8019",                 "expirationDate": "052024",                 "firstToken": "3256CA16-EFE0-48F5-B9F4-AD29B595BB4C",                 "secondToken": "3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"             }         }     } }

    #### Basic authentication para execução dos cenários de teste ##############
    #### Cenario com Token Valido #########
    Given I set variable basicToken in global scope to Basic aW40dTlGcEFKWWJVVnJHeXB5RWFUQTRQVTRYTEFhRlU6WWRjT3BXOWZYU3FQaGpxYw==
    #### Cenario com Nopermissions 403 #########
    Given I set variable basicAuth_403 in global scope to Basic bVFKR283Z0ZxSEV5U0JPTjRnQkxQN1RHUWFmZkNWY2c6OVZCZE1jcHZjWml1TDFKag==
    #### Cenario com Noquota 429 #########
    Given I set variable basicAuth_429 in global scope to Basic eHllbm85WENoVnZIb09uVkhlQVl1M1ZHVEUyWExIekE6djVzN2x3UUY3cXViMlNWeA==

    ###########################################################
    #### Variáveis comuns (headers, valores, etc) #############
    ###########################################################
    Given I set variable API_PATH in global scope to /customerbill/v1/cec/paymentmethods
    Given I set variable API_PATH_414 in global scope to /customerbill/v1/cec/customerbill/v1/cec/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods
    Given I set variable tipo_header_Accept in global scope to Accept
    Given I set variable tipo_header_Content in global scope to Content-Type
    Given I set variable json in global scope to application/json
    Given I set variable tipo_header_Client_Auth in global scope to Authorization

  Scenario: 0. Obtém o token de autenticação
    Given I set headers to
      | name          | value        |
      | X-Client-Auth | `basicToken` |
    And I set form parameters to
      | parameter  | value              |
      | grant_type | client_credentials |
    And  I POST to /oauth2/v1/token
    And I store the value of body path $.access_token as access_token in global scope

  @customerbill-cecpaymentmethods-v1
  Scenario: 1 - Realiza uma request correta realizando criação de um método de pagamento (payment method).- code esperado : 200
    Given I set body to `request_paymentMethod`
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH`
    Then response code should be 200
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain data
    And response body path $.data.customerBill.paymentMethodId should be (.*)

  @customerbill-cecpaymentmethods-v1
  Scenario: 2 - Realiza uma request incorreta sem o campo customerAccountId - code esperado : 400
    Given I set body to `badrequest_customerAccountId`
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH`
    Then response code should be 400
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 400
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-400
    And response body path $.error.message should be Bad Request
    And response body path $.error.detailedMessage should be Invalid Request for operation. Field: \[customerAccountId\]

  @customerbill-cecpaymentmethods-v1
  Scenario: 3 - Realiza uma request incorreta sem o campo paymentMethod - code esperado : 400
    Given I set body to `badrequest_paymentMethod`
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH`
    Then response code should be 400
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 400
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-400
    And response body path $.error.message should be Bad Request
    And response body path $.error.detailedMessage should be Invalid Request for operation. Field: \[paymentMethod\]

  @customerbill-cecpaymentmethods-v1
  Scenario: 4 - Realiza uma request incorreta sem o campo type - code esperado : 400
    Given I set body to `badrequest_type`
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH`
    Then response code should be 400
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 400
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-400
    And response body path $.error.message should be Bad Request
    And response body path $.error.detailedMessage should be Invalid Request for operation. Field: \[type\]

  @customerbill-cecpaymentmethods-v1
  Scenario: 5 - Realiza uma request incorreta sem o campo creditCard - code esperado : 400
    Given I set body to `badrequest_creditCard`
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH`
    Then response code should be 400
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 400
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-400
    And response body path $.error.message should be Bad Request
    And response body path $.error.detailedMessage should be Invalid Request for operation. Field: \[creditCard\]

  @customerbill-cecpaymentmethods-v1
  Scenario: 6 - Realiza uma request incorreta sem o campo brand - code esperado : 400
    Given I set body to `badrequest_brand`
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH`
    Then response code should be 400
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 400
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-400
    And response body path $.error.message should be Bad Request
    And response body path $.error.detailedMessage should be Invalid Request for operation. Field: \[brand\]

  @customerbill-cecpaymentmethods-v1
  Scenario: 7 - Realiza uma request incorreta sem o campo holder - code esperado : 400
    Given I set body to `badrequest_holder`
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH`
    Then response code should be 400
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 400
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-400
    And response body path $.error.message should be Bad Request
    And response body path $.error.detailedMessage should be Invalid Request for operation. Field: \[holder\]

  @customerbill-cecpaymentmethods-v1
  Scenario: 8 - Realiza uma request incorreta sem o campo lastFourNumber - code esperado : 400
    Given I set body to `badrequest_lastFourNumber`
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH`
    Then response code should be 400
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 400
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-400
    And response body path $.error.message should be Bad Request
    And response body path $.error.detailedMessage should be Invalid Request for operation. Field: \[lastFourNumber\]

  @customerbill-cecpaymentmethods-v1
  Scenario: 9 - Realiza uma request incorreta sem o campo expirationDate - code esperado : 400
    Given I set body to `badrequest_expirationDate`
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH`
    Then response code should be 400
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 400
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-400
    And response body path $.error.message should be Bad Request
    And response body path $.error.detailedMessage should be Invalid Request for operation. Field: \[expirationDate\]

  @customerbill-cecpaymentmethods-v1
  Scenario: 10 - Realiza uma request incorreta sem o campo firstToken - code esperado : 400
    Given I set body to `badrequest_firstToken`
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH`
    Then response code should be 400
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 400
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-400
    And response body path $.error.message should be Bad Request
    And response body path $.error.detailedMessage should be Invalid Request for operation. Field: \[firstToken\]

  #@customerbill-cecpaymentmethods-v1
  #Scenario: 11 - Realiza uma request incorreta sem o campo secondToken - code esperado : 400
  #Given I set body to `badrequest_secondToken`
  #Given I set `tipo_header_Content` header to `json`
  #Given I set `tipo_header_Accept` header to `json`
  #Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
  #When I POST to `API_PATH`
  #Then response code should be 400
  #And response body should be valid json
  #And response body path $.apiVersion should be (.*)
  #And response body path $.transactionId should be (.*)
  #And response body should contain error
  #And response body path $.error.httpCode should be 400
  #And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-400
  #And response body path $.error.message should be Bad Request
  #And response body path $.error.detailedMessage should be Invalid Request for operation. Field: \[secondToken\]

  @customerbill-cecpaymentmethods-v1
  Scenario: 12 - Realizar um POST síncrono com um request correto sem autenticação (Authentication) - code esperado : 401
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to application/json
    When I POST to `API_PATH`
    Then response code should be 401
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 401
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-401
    And response body path $.error.message should be Unauthorized
    And response body path $.error.detailedMessage should be Unauthorized.

  @customerbill-cecpaymentmethods-v1
  Scenario: 13 - Realizar um POST síncrono com um request correto com uma chave invalida - code esperado : 403
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to application/json
    Given I set `tipo_header_Client_Auth` header to `basicAuth_403`
    When I POST to `API_PATH`
    Then response code should be 403
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 403
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-403
    And response body path $.error.message should be Forbidden
    And response body path $.error.detailedMessage should be Client authorization failed.

  @customerbill-cecpaymentmethods-v1
  Scenario: 14 - Realizar um POST síncrono com um request correto para uma URL não existente - code esperado : 404
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to application/json
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH`/errado
    Then response code should be 404
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 404
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-404
    And response body path $.error.message should be Not found
    And response body path $.error.detailedMessage should be Resource not found.

  @customerbill-cecpaymentmethods-v1
  Scenario: 15 - Realiza um DELETE síncrono com método não permitido - code esperado : 405
    Given I set `tipo_header_Content` header to application/json
    Given I set `tipo_header_Accept` header to `application/json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I DELETE `API_PATH`
    Then response code should be 405
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 405
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-405
    And response body path $.error.message should be Method Not Allowed
    And response body path $.error.detailedMessage should be Method Not Allowed

  @customerbill-cecpaymentmethods-v1
  Scenario: 16 - Realiza um PATCH síncrono com método não permitido - code esperado : 405
    Given I set `tipo_header_Content` header to application/json
    Given I set `tipo_header_Accept` header to `application/json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I PATCH `API_PATH`
    Then response code should be 405
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 405
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-405
    And response body path $.error.message should be Method Not Allowed
    And response body path $.error.detailedMessage should be Method Not Allowed

  @customerbill-cecpaymentmethods-v1
  Scenario: 17 - Realizar um POST síncrono com um request correto para Accept incorreto - code esperado : 406
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `application/javascript`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH`
    Then response code should be 406
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 406
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-406
    And response body path $.error.message should be Not acceptable
    And response body path $.error.detailedMessage should be Requested content type not acceptable.

  @customerbill-cecpaymentmethods-v1
  Scenario: 18 - Realizar um POST síncrono com um request correto e um dos campos enviado muitas vezes - code esperado : 413
    Given I set body to `entityTooLarge`
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH`
    Then response code should be 413
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 413
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-413
    And response body path $.error.message should be Request Entity Too Large
    And response body path $.error.detailedMessage should be Payload limits check failed.

  @customerbill-cecpaymentmethods-v1
  Scenario: 19 - Realizar um POST síncrono com um request correto e um dos campos enviado muitas vezes - code esperado : 413
    Given I set body to `entityTooLarge_msisdn`
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH_414`
    Then response code should be 414
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 414
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-414
    And response body path $.error.message should be Request-URI Too Large
    And response body path $.error.detailedMessage should be URI limits check failed.

  @customerbill-cecpaymentmethods-v1
  Scenario: 20 - Realizar um POST síncrono com um request correto e Content-Type incorreto - code esperado : 415
    Given I set `tipo_header_Content` header to text/plain
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I POST to `API_PATH`
    Then response code should be 415
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 415
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-415
    And response body path $.error.message should be Unsupported Media Type
    And response body path $.error.detailedMessage should be Unsupported Media Type

  @customerbill-cecpaymentmethods-v1
  Scenario: 21 - Realizar vários POST síncronos com um request correto até estourar a quota - code esperado : 429
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to application/json
    Given I set `tipo_header_Client_Auth` header to `basicAuth_429`
    When I POST to `API_PATH`
    When I POST to `API_PATH`
    When I POST to `API_PATH`
    When I POST to `API_PATH`
    When I POST to `API_PATH`
    Then response code should be 429
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 429
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-429
    And response body path $.error.message should be Too Many Requests
    And response body path $.error.detailedMessage should be Quota check failed.

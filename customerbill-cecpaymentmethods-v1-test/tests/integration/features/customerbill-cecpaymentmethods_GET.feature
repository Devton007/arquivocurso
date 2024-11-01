# Autor: Ramiro Brandão @ Spread
# Data: 02/06/2023

# Autor: Ramiro Brandão @ Spread
# Data: 11/09/2023

Feature: @customerbill-cecpaymentmethods-v1

  #API responsável por criar registros de Método de Pagamento na plataforma Salesforce/Vlocity.
  #O Cliente (Account) é a pessoa (Inicialmente Física) que solicitará a criação de seu Método de Pagamento (Payment Method).

  ########## - Preparar variáveis para os cenários de teste - #########
  @set-variables
  Scenario: Prepara variáveis

    ##### Basic authentication para execução dos cenários de teste ##############
    ##### Cenario com Token Valido #########
    Given I set variable basicToken in global scope to Basic aW40dTlGcEFKWWJVVnJHeXB5RWFUQTRQVTRYTEFhRlU6WWRjT3BXOWZYU3FQaGpxYw==
    ##### Cenario com Nopermissions 403 #########
    Given I set variable basicAuth_403 in global scope to Basic bVFKR283Z0ZxSEV5U0JPTjRnQkxQN1RHUWFmZkNWY2c6OVZCZE1jcHZjWml1TDFKag==
    ##### Cenario com Noquota 429 #########
    Given I set variable basicAuth_429 in global scope to Basic eHllbm85WENoVnZIb09uVkhlQVl1M1ZHVEUyWExIekE6djVzN2x3UUY3cXViMlNWeA==

    ############################################################
    ##### Variáveis comuns (headers, valores, etc) #############
    ############################################################
    Given I set variable API_PATH in global scope to /customerbill/v1/cec/paymentmethods
    Given I set variable API_PATH_414 in global scope to /customerbill/v1/cec/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethod/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods/paymentmethods
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
  Scenario: 1 - Realiza uma request correta realizando a consulta tipo CPF de métodos de pagamento (payment method). - code esperado : 200
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    Given I set X-Querystring header to documentType=CPF&documentNumber=38140032093
    When I GET `API_PATH`
    Then response code should be 200
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain data
    And response body path $.data.PaymentMethod[4].id should be a2o6t000000T91MAAS
    And response body path $.data.PaymentMethod[4].status should be Inactive
    And response body path $.data.PaymentMethod[4].brand should be Master
    And response body path $.data.PaymentMethod[4].holder should be Marco Antonio Ribeiro Vendramini
    And response body path $.data.PaymentMethod[4].expirationDate should be 052024
    And response body path $.data.PaymentMethod[4].firstToken should be 3256CA16-EFE0-48F5-B9F4-AD29B595BB4C
    And response body path $.data.PaymentMethod[4].secondToken should be 3256CA16-EFE0-48F5-B9F4-AD29B595BB4C

    And response body path $.data.PaymentMethod[42].id should be a2o6t000000TC4pAAG
    And response body path $.data.PaymentMethod[42].status should be Active
    And response body path $.data.PaymentMethod[42].brand should be VISA
    And response body path $.data.PaymentMethod[42].holder should be João Silva
    And response body path $.data.PaymentMethod[42].lastFourNumber should be 8019
    And response body path $.data.PaymentMethod[42].expirationDate should be 122024
    And response body path $.data.PaymentMethod[42].firstToken should be 3256CA16-EFE0-48F5-B9F4-AD29B595BB4C
    And response body path $.data.PaymentMethod[42].secondToken should be 3256CA16-EFE0-48F5-B9F4-AD29B595BB4C

    And response body path $.data.PaymentMethod[43].id should be a2o6t000000TC6WAAW
    And response body path $.data.PaymentMethod[43].status should be Active
    And response body path $.data.PaymentMethod[43].brand should be amex
    And response body path $.data.PaymentMethod[43].holder should be Maria Silva
    And response body path $.data.PaymentMethod[43].lastFourNumber should be 1090
    And response body path $.data.PaymentMethod[43].expirationDate should be 052025
    And response body path $.data.PaymentMethod[43].firstToken should be 3256CA16-EFE0-48F5-B9F4-AD29B595BB9C
    And response body path $.data.PaymentMethod[43].secondToken should be 3256CA16-EFE0-48F5-B9F4-AD29B595BB9C

  @customerbill-cecpaymentmethods-v1
  Scenario: 2 - Realiza uma request correta realizando consulta de documentType CPF sem métodos de pagamento (payment method). - code esperado : 200
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    Given I set X-Querystring header to documentType=CPF&documentNumber=08939283727
    When I GET `API_PATH`
    Then response code should be 200
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain data
    And response body path $.data.PaymentMethod should be of type array

  @customerbill-cecpaymentmethods-v1
  Scenario: 3 - Realiza uma request incorreta sem o campo X-Querystring (documentType e documentNumber)- code esperado : 400
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I GET `API_PATH`
    Then response code should be 400
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 400
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-400
    And response body path $.error.message should be Bad Request
    And response body path $.error.detailedMessage should be Invalid Request for operation. Field: \[header X-QueryString\]

  @customerbill-cecpaymentmethods-v1
  Scenario: 4 - Realizar um GET síncrono com um request correto sem autenticação (Authentication) - code esperado : 401
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to application/json
    When I GET `API_PATH`
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
  Scenario: 5 - Realizar um GET síncrono com um request correto com uma chave invalida - code esperado : 403
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to `basicAuth_403`
    When I GET `API_PATH`
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
  Scenario: 6 - Realizar um GET síncrono com um request correto para uma URL não existente - code esperado : 404
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I GET `API_PATH`/errado
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
  Scenario: 7 - Realiza um DELETE síncrono com método não permitido - code esperado : 405
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
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
  Scenario: 8 - Realiza um PATCH síncrono com método não permitido - code esperado : 405
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
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
  Scenario: 9 - Realizar um GET síncrono com um request correto para Accept incorreto - code esperado : 406
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `application/javascript`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I GET `API_PATH`
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
  Scenario: 10 - Realizar um GET síncrono com um request correto e um dos campos enviado muitas vezes - code esperado : 414
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I GET `API_PATH_414`
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
  Scenario: 11 - Realizar um GET síncrono com um request correto e Content-Type incorreto - code esperado : 415
    Given I set `tipo_header_Content` header to text/plain
    Given I set `tipo_header_Accept` header to `json`
    Given I set `tipo_header_Client_Auth` header to Bearer `access_token`
    When I GET `API_PATH`
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
  Scenario: 12 - Realizar vários GET síncronos com um request correto até estourar a quota - code esperado : 429
    Given I set `tipo_header_Content` header to `json`
    Given I set `tipo_header_Accept` header to application/json
    Given I set `tipo_header_Client_Auth` header to `basicAuth_429`
    When I GET `API_PATH`
    When I GET `API_PATH`
    When I GET `API_PATH`
    When I GET `API_PATH`
    When I GET `API_PATH`
    Then response code should be 429
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body should contain error
    And response body path $.error.httpCode should be 429
    And response body path $.error.errorCode should be API-CECPAYMENTMETHODS-429
    And response body path $.error.message should be Too Many Requests
    And response body path $.error.detailedMessage should be Quota check failed.

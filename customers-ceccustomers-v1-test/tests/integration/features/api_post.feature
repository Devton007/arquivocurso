@apiproxy
Feature: customers-ceccustomers-v1 POST

  @services @POST
  Scenario: 0. Prep variables

    Given I set variable body201 in global scope to { "customer": { "name": "KAELLY ALVES LIRIO", "partyIdentificationObject": [ { "identificationType": "CPF", "identificationId": "31242354678" } ], "phoneContacts": [ { "phoneType": "Residencial", "phoneNumber": "1122334455" } ], "emailAddress": "kaelly.lirio@email.com.br", "channelId": "Now On Line" } }

    Given I set variable body400 in global scope to { "customer": { { "identificationType": "", "identificationId": "" } ], "phoneContacts": [ { "phoneType": "", "phoneNumber": "" } ], "emailAddress": "kaelly.lirio@email.com.br", "channelId": "Now On Line"

    Given I set variable body400_1 in global scope to { "customer": { "name": "", "partyIdentificationObject": [ { "identificationType": "CPF", "identificationId": "31242354678" } ], "phoneContacts": [ { "phoneType": "Residencial", "phoneNumber": "1122334455" } ], "emailAddress": "kaelly.lirio@email.com.br", "channelId": "Now On Line" } }

    Given I set variable body400_2 in global scope to { "customer": { "name": "KAELLY ALVES LIRIO", "partyIdentificationObject": [ { } ], "phoneContacts": [ { "phoneType": "Residencial", "phoneNumber": "1122334455" } ], "emailAddress": "kaelly.lirio@email.com.br", "channelId": "Now On Line" } }

    Given I set variable body400_3 in global scope to { "customer": { "name": "KAELLY ALVES LIRIO", "partyIdentificationObject": [ { "identificationType": "", "identificationId": "31242354678" } ], "phoneContacts": [ { "phoneType": "Residencial", "phoneNumber": "1122334455" } ], "emailAddress": "kaelly.lirio@email.com.br", "channelId": "Now On Line" } }

    Given I set variable body400_4 in global scope to { "customer": { "name": "KAELLY ALVES LIRIO", "partyIdentificationObject": [ { "identificationType": "CPF", "identificationId": "" } ], "phoneContacts": [ { "phoneType": "Residencial", "phoneNumber": "1122334455" } ], "emailAddress": "kaelly.lirio@email.com.br", "channelId": "Now On Line" } }

    Given I set variable body205 in global scope to { "customer": { "name": "KAELLY ALVES LIRIO", "partyIdentificationObject": [ { "identificationType": "CPF", "identificationId": "31242354678" } ], "phoneContacts": [ { "phoneType": "Residencial", "phoneNumber": "1122334455" } ], "emailAddress": "kaelly.lirio@email.com.br", "channelId": "Now On Line" } }

  Scenario:CT111 - Campos informados corretamente - Cod. 201
    Given I use variables from app customers-ceccustomers-v1-app-ok"
    And I set body to `body201`
    And I set headers to
      | name             | value             |
      | `authHeaderName` | `authHeaderValue` |
      | Content-Type     | application/json  |
      | Accept           | application/json  |
      | X-Channel        | UNITARIO          |
    When I POST to /customers/cec/customers
    Then response code should be 201
    And response body should be valid json
    And response body path $.apiVersion should be (.*)
    And response body path $.transactionId should be (.*)
    And response body path $.data should be (.a-zA-Z)

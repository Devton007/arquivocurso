Feature: customerbill-cecpaymentmethods-v1 GET

########## - Preparar variáveis para os cenários de teste - #########
@services @GET 
Scenario: 1.0 - Variables Setup
	Given I set variable tipo_header_Accept in global scope to Accept
	Given I set variable tipo_header_Content in global scope to Content-Type
	Given I set variable json in global scope to application/json
	Given I set variable text in global scope to application/text
	Given I set variable tipo_header_Client_Auth in global scope to X-Client-Auth
	Given I set variable text in global scope to text/cmd
	Given I set variable header_Query_String in global scope to X-QueryString
	Given I set variable header_x_target in global scope to x-target
	Given I set variable header_businessUnit in global scope to businessUnit
	Given I set variable basicAuth_apiToken in global scope to Basic bVY4SlJwUDdkQ1lrakNlTEpnbWVHaHhwT29tVUQ1VUw6WTJqVnhmMlQwdnhibVY5Qw==
	Given I set variable basicAuth in global scope to Basic Vm9xS3g3bU5Dc3liTFBJVVhXU3pJc2k3UUZHa0xKZks6anpxMjVia0xFbEFkTzNvTA==
	Given I set variable NewbasicAuth in global scope to Bearer zpORtHDvAL2r2cdVNHBGQCS063Tz


Scenario: 1.1 Prep requests
	Given I set variable body200post in global scope to {"data": {"customerAccountId":"200","paymentMethod":{"type":"CreditCard","creditCard":{"brand":"Master","holder":"Marco Antonio Ribeiro Vendramini","lastFourNumber":"8019","expirationDate":"052024","firstToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C","secondToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}
	Given I set variable body400post in global scope to {"data": {"customerAccountId":"400","paymentMethod":{"type":"CreditCard","creditCard":{"brand":"Master","holder":"Marco Antonio Ribeiro Vendramini","lastFourNumber":"8019","expirationDate":"052024","firstToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C","secondToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}

	Given I set variable body200put in global scope to {"data": {"paymentMethodId":"200","paymentMethodStatus":"Inactive"}}
	Given I set variable body400put in global scope to {"data": {"paymentMethodId":"400","paymentMethodStatus":"Inactive"}}
	Given I set variable body422put in global scope to {"data": {"paymentMethodId":"a2o6t000000UJvQAAW","paymentMethodStatus":"Inactive"}}

	Given I set variable body200newPOST in global scope to {"data":{"customerAccountId":"200","businessUnit":"ClaroFlex","paymentMethod":{"type":"CreditCard","creditCard":{"brand":"Master","holder":"Marco Antonio Ribeiro Vendramini","lastFourNumber":"8019","expirationDate":"052024","firstToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C","secondToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}
	Given I set variable body400newPOST in global scope to {"data":{"customerAccountId":"","businessUnit":"ClaroFlex","paymentMethod":{"type":"CreditCard","creditCard":{"brand":"Master","holder":"Marco Antonio Ribeiro Vendramini","lastFourNumber":"8019","expirationDate":"052024","firstToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C","secondToken":"3256CA16-EFE0-48F5-B9F4-AD29B595BB4C"}}}}

	Given I set variable body200newPUT in global scope to {"data":{"paymentMethodId":"200","paymentMethodStatus":"Inactive"}}
	Given I set variable body422newPUT in global scope to {"data":{"paymentMethodId":"42222","paymentMethodStatus":"Inactive"}}

	


	Scenario: 1.1 - Token Generate
	Given I set form parameters to 
	| parameter  | value              |
	| grant_type | client_credentials |
	Given I set `tipo_header_Content` header to application/x-www-form-urlencoded
	Given I set `tipo_header_Client_Auth` header to `basicAuth_apiToken`
	When I POST /oauth2/v1/token
	Then response code should be 200
	Then response header content-type should be application/json
	Then I store the value of body path $.access_token as oauthToken in global scope


Scenario: 1.1 - Token Generate
	Given I set form parameters to 
	| parameter  | value              |
	| grant_type | client_credentials |
	Given I set `tipo_header_Content` header to application/x-www-form-urlencoded
	Given I set `tipo_header_Client_Auth` header to `basicAuth`
	When I POST /oauth2/v1/token
	Then response code should be 200
	Then response header content-type should be application/json
	Then I store the value of body path $.access_token as NewoauthToken in global scope


Scenario: 200 Realiza um NewPOST sincrono com uma request correta - code esperado : 200
 	Given I set body to `body200newPOST`
 	Given I set `tipo_header_Accept` header to `json`
 	Given I set `tipo_header_Content` header to `json`
 	Given I set Authorization header to `NewbasicAuth`
 	When I POST /customerbill/v1/cec/paymentmethods
 	Then response code should be 200
 	And response body should be valid json
 	And response body path $.apiVersion should be (.*)
 	And response body path $.transactionId should be (.*)
 	And response body path $.errorCode should be [a-zA-Z]


Scenario: 200 Realiza um NewPOST sincrono com uma request correta - code esperado : 400
 	Given I set body to `body400newPOST`
 	Given I set `tipo_header_Accept` header to `json`
 	Given I set `tipo_header_Content` header to `json`
 	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
 	When I POST /customerbill/v1/cec/paymentmethods
 	Then response code should be 400
 	And response body should be valid json
 	And response body path $.apiVersion should be (.*)
 	And response body path $.transactionId should be (.*)
 	And response body path $.errorCode should be [a-zA-Z]

Scenario: 200 Realiza um NewGET sincrono com uma request correta - code esperado : 200
 	Given I set `tipo_header_Accept` header to `json`
 	Given I set `tipo_header_Content` header to `json`
 	Given I set Authorization header to `NewbasicAuth`
	Given I set X-QueryString header to documentType=CPF&documentNumber=200
	Given I set x-target header to 2000
	Given I set businessUnit header to 200
 	When I GET /customerbill/v1/cec/paymentmethods?isActive=true&businessUnit=2000
 	Then response code should be 200
 	And response body should be valid json
 	And response body path $.apiVersion should be (.*)
 	And response body path $.transactionId should be (.*)
 	And response body path $.errorCode should be [a-zA-Z]

	Scenario: 422 Realiza um NewGET sincrono com uma request incorreta - code esperado : 422
 	Given I set `tipo_header_Accept` header to `json`
 	Given I set `tipo_header_Content` header to `json`
 	Given I set Authorization header to `NewbasicAuth`
	Given I set X-QueryString header to documentType=CPF&documentNumber=422
	Given I set x-target header to 422
	Given I set businessUnit header to 422
 	When I GET /customerbill/v1/cec/paymentmethods?isActive=true
 	Then response code should be 422
 	And response body should be valid json
 	And response body path $.apiVersion should be (.*)
 	And response body path $.transactionId should be (.*)
 	And response body path $.errorCode should be [a-zA-Z]

Scenario: 200 Realiza um NewPUT sincrono com uma request correta - code esperado : 200
 	Given I set body to `body200newPUT`
 	Given I set `tipo_header_Accept` header to `json`
 	Given I set `tipo_header_Content` header to `json`
 	Given I set `tipo_header_Client_Auth` header to Bearer `NewoauthToken`
 	When I PUT /customerbill/v1/cec/paymentmethods/status
 	Then response code should be 200
 	And response body should be valid json
 	And response body path $.apiVersion should be (.*)
 	And response body path $.transactionId should be (.*)
 	And response body path $.errorCode should be [a-zA-Z]

Scenario: 200 Realiza um NewPUT sincrono com uma request correta - code esperado : 422
 	Given I set body to `body422newPUT`
 	Given I set `tipo_header_Accept` header to `json`
 	Given I set `tipo_header_Content` header to `json`
 	Given I set `tipo_header_Client_Auth` header to Bearer `NewoauthToken`
 	When I PUT /customerbill/v1/cec/paymentmethods/status
 	Then response code should be 422
 	And response body should be valid json
 	And response body path $.apiVersion should be (.*)
 	And response body path $.transactionId should be (.*)
 	And response body path $.errorCode should be [a-zA-Z]

	Scenario: 200 Realiza um GET sincrono com uma request correta - code esperado : 200
 	Given I set `tipo_header_Accept` header to `json`
 	Given I set `tipo_header_Content` header to `json`
 	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
	Given I set X-QueryString header to documentType=CPF&documentNumber=200
 	When I GET /customerbill/v1/cec/paymentmethods
 	Then response code should be 200
 	And response body should be valid json
 	And response body path $.apiVersion should be (.*)
 	And response body path $.transactionId should be (.*)
 	And response body path $.errorCode should be [a-zA-Z]

 Scenario: 400 - Bad Request
  	Given I set `tipo_header_Accept` header to `json`
  	Given I set `tipo_header_Content` header to `json`
  	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
	Given I set X-QueryString header to documentType=CPF&documentNumber=400
  	When I GET /customerbill/v1/cec/paymentmethods
  	Then response code should be 400
  		And response body should be valid json
  		And response header content-type should be application/json

 Scenario: 401 - Unauthorized
  	Given I set `tipo_header_Accept` header to `json`
  	Given I set `tipo_header_Content` header to `json`
  	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
	Given I set X-QueryString header to documentType=CPF&documentNumber=401
  	When I GET /customerbill/v1/cec/paymentmethods
  	Then response code should be 401
  		And response body should be valid json
  		And response body path $.error.httpCode should be 401
  		And response body path $.error.errorCode should be API-(.*)-401
  		And response header X-TransactionId should be (.+)

 Scenario: 403 - Forbiden
  	Given I set `tipo_header_Accept` header to `json`
  	Given I set `tipo_header_Content` header to `json`
  	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
	Given I set X-QueryString header to documentType=CPF&documentNumber=403
  	When I GET /customerbill/v1/cec/paymentmethods
  	Then response code should be 403
  		And response body should be valid json
  		And response header content-type should be application/json

 Scenario: 404 - Not Found
  	Given I set `tipo_header_Accept` header to `json`
  	Given I set `tipo_header_Content` header to `json`
  	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
	Given I set X-QueryString header to documentType=CPF&documentNumber=404
  	When I GET /customerbill/v1/cec/paymentmethods/test
  	Then response code should be 404
  		And response body should be valid json
  		And response body path $.error.httpCode should be 404
  		And response body path $.error.errorCode should be API-(.*)-404
  		And response header X-TransactionId should be (.+)

 Scenario: 405 - Method Not Allowed
  	Given I set `tipo_header_Accept` header to `json`
  	Given I set `tipo_header_Content` header to `json`
  	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
	Given I set X-QueryString header to documentType=CPF&documentNumber=200
  	When I PATCH /customerbill/v1/cec/paymentmethods
  	Then response code should be 405
  		And response body should be valid json
  		And response header content-type should be application/json

 Scenario: 406 - Not Acceptable
  	Given I set `tipo_header_Accept` header to `text`
  	Given I set `tipo_header_Content` header to `json`
  	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
	Given I set X-QueryString header to documentType=CPF&documentNumber=406
  	When I GET /customerbill/v1/cec/paymentmethods
  	Then response code should be 406
  		And response body should be valid json
  		And response header content-type should be application/json
 
 Scenario: 415 - Not Acceptable
  	Given I set `tipo_header_Accept` header to `json`
  	Given I set `tipo_header_Content` header to `text`
  	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
	Given I set X-QueryString header to documentType=CPF&documentNumber=200
  	When I GET /customerbill/v1/cec/paymentmethods
  	Then response code should be 415
  		And response body should be valid json
  		And response header content-type should be application/json

Scenario: 422 - Business Exception
 	Given I set `tipo_header_Accept` header to `json`
 	Given I set `tipo_header_Content` header to `json`
 	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
	Given I set X-QueryString header to documentType=CPF&documentNumber=4222
 	When I GET /customerbill/v1/cec/paymentmethods
 	Then response code should be 422
 		And response body should be valid json
 		And response header content-type should be application/json

Scenario: 429 - Too Many Requests
 	Given I set `tipo_header_Accept` header to `json`
 	Given I set `tipo_header_Content` header to `json`
 	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
	Given I set X-QueryString header to documentType=CPF&documentNumber=429
 	When I GET /customerbill/v1/cec/paymentmethods
 	Then response code should be 429
 		And response body should be valid json
 		And response header content-type should be application/json

Scenario: 500 - Internal Server Error
 	Given I set `tipo_header_Accept` header to `json`
 	Given I set `tipo_header_Content` header to `json`
 	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
	Given I set X-QueryString header to documentType=CPF&documentNumber=500
 	When I GET /customerbill/v1/cec/paymentmethods
 	Then response code should be 500
 		And response body should be valid json
 		And response header content-type should be application/json



 Scenario: 400 - Bad Request
    Given I set body to `body400post`
  	Given I set `tipo_header_Accept` header to `json`
  	Given I set `tipo_header_Content` header to `json`
  	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
  	When I POST /customerbill/v1/cec/paymentmethods
  	Then response code should be 400
  		And response body should be valid json
  		And response header content-type should be application/json

Scenario: 400 - Bad Request
    Given I set body to `body400put`
  	Given I set `tipo_header_Accept` header to `json`
  	Given I set `tipo_header_Content` header to `json`
  	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
  	When I PUT /customerbill/v1/cec/paymentmethods/status
  	Then response code should be 400
  		And response body should be valid json
  		And response header content-type should be application/json

Scenario: 422 - Business Exception
   	Given I set body to `body422put`
 	Given I set `tipo_header_Accept` header to `json`
 	Given I set `tipo_header_Content` header to `json`
 	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
 	When I PUT /customerbill/v1/cec/paymentmethods/status
 	Then response code should be 422
 		And response body should be valid json
 		And response header content-type should be application/json

	


Scenario: 200 Realiza um PUT sincrono com uma request correta - code esperado : 200
 	Given I set body to `body200put`
 	Given I set `tipo_header_Accept` header to `json`
 	Given I set `tipo_header_Content` header to `json`
 	Given I set `tipo_header_Client_Auth` header to Bearer `oauthToken`
 	When I PUT /customerbill/v1/cec/paymentmethods/status
 	Then response code should be 200
 	And response body should be valid json
 	And response body path $.apiVersion should be (.*)
 	And response body path $.transactionId should be (.*)
 	And response body path $.errorCode should be [a-zA-Z]





Scenario: 200 Realiza um POST sincrono com uma request correta - code esperado : 200
 	Given I set body to `body200post`
 	Given I set `tipo_header_Accept` header to `json`
 	Given I set `tipo_header_Content` header to `json`
 	Given I set Authorization header to Bearer fofxYG7hPGY1Ma1VZwvqLUfAvKal
 	When I POST /customerbill/v1/cec/paymentmethods
 	Then response code should be 200
 	And response body should be valid json
 	And response body path $.apiVersion should be (.*)
 	And response body path $.transactionId should be (.*)
 	And response body path $.errorCode should be [a-zA-Z]
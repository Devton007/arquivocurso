@apiproxy
Feature: customers-ceccustomers-v1 POST /customers/cec/customers
  API para prover a atualização de um cliente de VAS (portabilidade ou limpeza do serviço contratado)

	# - Preparar variáveis para os cenários de teste
 	@set-variables
 	Scenario: 0 -Prepara variáveis

	# Variáveis de aplicação
	Given I set variable app_valido in global scope to Basic Z3FBR0N6YmhMUW5ETlg5MURnSnNDd1JZMU03b2kzMGc6ajE5RVlLMjZLTmtBOTRaQQ==
 	
	# Variáveis referentes a massa de teste
 	Given I set variable request_valido_201 in global scope to {"clientId":"74414c04-c493-11eb-8529-0242ac130003","customerId":"5521999999999","action":"CLEAN","transactionId":"48d9b698-c7a7-11eb-b8bc-0242ac130003","extra": {"MSISDN":"5521999999999","subscriberNo":"123"}}
	And I set variable request_valido_400 in global scope to {"clientId":"74414c04-c493-11eb-8529-0242ac130003","customerId":"5521999999999","action":"CLEAN","transactionId":"48d9b698-c7a7-11eb-b8bc-0242ac130003","extra": {"MSISDN":"5521999999999","subscriberNo":"error-400"}}
	And I set variable request_valido_401 in global scope to {"clientId":"74414c04-c493-11eb-8529-0242ac130003","customerId":"5521999999999","action":"CLEAN","transactionId":"48d9b698-c7a7-11eb-b8bc-0242ac130003","extra": {"MSISDN":"5521999999999","subscriberNo":"error-401"}}
	And I set variable request_valido_403 in global scope to {"clientId":"74414c04-c493-11eb-8529-0242ac130003","customerId":"5521999999999","action":"CLEAN","transactionId":"48d9b698-c7a7-11eb-b8bc-0242ac130003","extra": {"MSISDN":"5521999999999","subscriberNo":"error-403"}}
	And I set variable request_valido_404 in global scope to {"clientId":"74414c04-c493-11eb-8529-0242ac130003","customerId":"5521999999999","action":"CLEAN","transactionId":"48d9b698-c7a7-11eb-b8bc-0242ac130003","extra": {"MSISDN":"5521999999999","subscriberNo":"error-404"}}
	And I set variable request_valido_405 in global scope to {"clientId":"74414c04-c493-11eb-8529-0242ac130003","customerId":"5521999999999","action":"CLEAN","transactionId":"48d9b698-c7a7-11eb-b8bc-0242ac130003","extra": {"MSISDN":"5521999999999","subscriberNo":"error-405"}}
	And I set variable request_valido_406 in global scope to {"clientId":"74414c04-c493-11eb-8529-0242ac130003","customerId":"5521999999999","action":"CLEAN","transactionId":"48d9b698-c7a7-11eb-b8bc-0242ac130003","extra": {"MSISDN":"5521999999999","subscriberNo":"error-406"}}
	And I set variable request_valido_408 in global scope to {"clientId":"74414c04-c493-11eb-8529-0242ac130003","customerId":"5521999999999","action":"CLEAN","transactionId":"48d9b698-c7a7-11eb-b8bc-0242ac130003","extra": {"MSISDN":"5521999999999","subscriberNo":"error-408"}}
	And I set variable request_valido_409 in global scope to {"clientId":"74414c04-c493-11eb-8529-0242ac130003","customerId":"5521999999999","action":"CLEAN","transactionId":"48d9b698-c7a7-11eb-b8bc-0242ac130003","extra": {"MSISDN":"5521999999999","subscriberNo":"error-409"}}
	And I set variable request_valido_415 in global scope to {"clientId":"74414c04-c493-11eb-8529-0242ac130003","customerId":"5521999999999","action":"CLEAN","transactionId":"48d9b698-c7a7-11eb-b8bc-0242ac130003","extra": {"MSISDN":"5521999999999","subscriberNo":"error-415"}}
	And I set variable request_valido_422 in global scope to {"clientId":"74414c04-c493-11eb-8529-0242ac130003","customerId":"5521999999999","action":"CLEAN","transactionId":"48d9b698-c7a7-11eb-b8bc-0242ac130003","extra": {"MSISDN":"5521999999999","subscriberNo":"error-422"}}
	And I set variable request_valido_429 in global scope to {"clientId":"74414c04-c493-11eb-8529-0242ac130003","customerId":"5521999999999","action":"CLEAN","transactionId":"48d9b698-c7a7-11eb-b8bc-0242ac130003","extra": {"MSISDN":"5521999999999","subscriberNo":"error-429"}}
	And I set variable request_valido_500 in global scope to {"clientId":"74414c04-c493-11eb-8529-0242ac130003","customerId":"5521999999999","action":"CLEAN","transactionId":"48d9b698-c7a7-11eb-b8bc-0242ac130003","extra": {"MSISDN":"5521999999999","subscriberNo":"error-500"}}
	And I set variable request_valido_503 in global scope to {"clientId":"74414c04-c493-11eb-8529-0242ac130003","customerId":"5521999999999","action":"CLEAN","transactionId":"48d9b698-c7a7-11eb-b8bc-0242ac130003","extra": {"MSISDN":"5521999999999","subscriberNo":"error-503"}}

#### - Obter o token de acesso válido
	@customers-ceccustomers-v1
	Scenario: Realizar a emissão de um token com sucesso - code esperado: 200
		Given I set headers to
			| name				| value				|
			| Authorization 	| `app_valido`		|
			| Content-Type		| application/x-www-form-urlencoded |
			| Accept			| application/json  |
		And I set body to grant_type=client_credentials
		When I request an access token to /oauth2/v1/token
		Then response code should be 200
		Then response body should be valid json
		Then response body path $.access_token should be (\w+)
		And I store the value of body path $.access_token as access_token in global scope

#### - Response válido - 201
	@customers-ceccustomers-v1
	Scenario: 3 - Realizar um POST /customers/cec/customers com sucesso - code esperado: 201
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_201`
		When I POST to /configuration/v1/vas/customers
		Then response code should be 201
		And response header Content-Type should be application/json
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.data.contractId should be (\w+)
		And response body path $.data.correlationId should be (\w+)
		
#### - Response válido - 400
	@customers-ceccustomers-v1
	Scenario: 5 - Realizar um POST /vas/customers com erro de backend - code esperado: 400
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_400`
		When I POST to /configuration/v1/vas/customers
		Then response code should be 400
		And response header Content-Type should be application/json
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.error.httpCode should be (\w+)
		And response body path $.error.errorCode should be API-(\w+)-400
		And response body path $.error.message should be (.+)

#### - Response válido - 401
	@customers-ceccustomers-v1
	Scenario: 6 - Realizar um POST /vas/customers com erro de backend - code esperado: 401
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_401`
		When I POST to /configuration/v1/vas/customers
		Then response code should be 401
		And response header Content-Type should be application/json
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.error.httpCode should be (\w+)
		And response body path $.error.errorCode should be API-(\w+)-401
		And response body path $.error.message should be (.+)

#### - Response válido - 403
	@configuration-vascustomers-v1
	Scenario: 7 - Realizar um POST /vas/customers com erro de backend - code esperado: 403
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_403`
		When I POST to /configuration/v1/vas/customers
		Then response code should be 403
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.error.httpCode should be (\w+)
		And response body path $.error.errorCode should be API-(\w+)-403
		And response body path $.error.message should be (.+)

#### - Response válido - 404
	@configuration-vascustomers-v1
	Scenario: 8 - Realizar um POST /vas/customers com erro de backend - code esperado: 404
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_404`
		When I POST to /configuration/v1/vas/customers
		Then response code should be 404
		And response header Content-Type should be application/json
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.error.httpCode should be (\w+)
		And response body path $.error.errorCode should be API-(\w+)-404
		And response body path $.error.message should be (.+)

#### - Response válido - 405
	@configuration-vascustomers-v1
	Scenario: 10 - Realizar um POST /vas/customers com erro de backend - code esperado: 405
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_405`
		When I POST to /configuration/v1/vas/customers
		Then response code should be 405
		And response header Content-Type should be application/json
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.error.httpCode should be (\w+)
		And response body path $.error.errorCode should be API-(\w+)-405
		And response body path $.error.message should be (.+)

#### - Response válido - 406
	@configuration-vascustomers-v1
	Scenario: 10 - Realizar um POST /vas/customers com erro de backend - code esperado: 406
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_406`
		When I POST to /configuration/v1/vas/customers
		Then response code should be 406
		And response header Content-Type should be application/json
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.error.httpCode should be (\w+)
		And response body path $.error.errorCode should be API-(\w+)-406
		And response body path $.error.message should be (.+)

#### - Response válido - 408
	@configuration-vascustomers-v1
	Scenario: 11 - Realizar um POST /vas/customers com erro de backend - code esperado: 408
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_408`
		When I POST to /configuration/v1/vas/customers
		Then response code should be 408
		And response header Content-Type should be application/json
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.error.httpCode should be (\w+)
		And response body path $.error.errorCode should be API-(\w+)-408
		And response body path $.error.message should be (.+)

#### - Response válido - 409
	@configuration-vascustomers-v1
	Scenario: 12 - Realizar um POST /vas/customers com erro de backend - code esperado: 409
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_409`
		When I POST to /configuration/v1/vas/customers
		Then response code should be 409
		And response header Content-Type should be application/json
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.error.httpCode should be (\w+)
		And response body path $.error.errorCode should be API-(\w+)-409
		And response body path $.error.message should be (.+)

#### - Response válido - 415
	@configuration-vascustomers-v1
	Scenario: 13 - Realizar um POST /vas/customers com erro de backend - code esperado: 415
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_415`
		When I POST to /configuration/v1/vas/customers
		Then response code should be 415
		And response header Content-Type should be application/json
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.error.httpCode should be (\w+)
		And response body path $.error.errorCode should be API-(\w+)-415
		And response body path $.error.message should be (.+)

#### - Response válido - 422
	@configuration-vascustomers-v1
	Scenario: 14 - Realizar um POST /vas/customers com erro de backend - code esperado: 422
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_422`
		When I POST to /configuration/v1/vas/customers
		Then response code should be 422
		And response header Content-Type should be application/json
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.error.httpCode should be (\w+)
		And response body path $.error.errorCode should be API-(\w+)-422
		And response body path $.error.message should be (.+)

#### - Response válido - 429
	@configuration-vascustomers-v1
	Scenario: 15 - Realizar um POST /vas/customers com erro de backend - code esperado: 429
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_429`
		When I POST to /configuration/v1/vas/customers
		Then response code should be 429
		And response header Content-Type should be application/json
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.error.httpCode should be (\w+)
		And response body path $.error.errorCode should be API-(\w+)-429
		And response body path $.error.message should be (.+)

#### - Response válido - 500
	@configuration-vascustomers-v1
	Scenario: 16 - Realizar um POST /vas/customers com erro de backend - code esperado: 500
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_500`
		When I POST to /configuration/v1/vas/customers
		Then response code should be 500
		And response header Content-Type should be application/json
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.error.httpCode should be (\w+)
		And response body path $.error.errorCode should be API-(\w+)-500
		And response body path $.error.message should be (.+)

#### - Response válido - 503
	@configuration-vascustomers-v1
	Scenario: 17 - Realizar um POST /vas/customers com erro de backend - code esperado: 503
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_503`
		When I POST to /configuration/v1/vas/customers
		Then response code should be 503
		And response header Content-Type should be application/json
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.error.httpCode should be (\w+)
		And response body path $.error.errorCode should be API-(\w+)-503
		And response body path $.error.message should be (.+)

#### - Request inválido - 404
	@configuration-vascustomers-v1
	Scenario: 18 - Realizar um POST /vas/customers/naoexiste - code esperado: 404
		Given I set headers to
			| name				| value				|
			| Authorization		| Bearer `access_token` |
			| Content-Type		| application/json  |
			| Accept			| application/json  |
			| X-Channel			| UNITARIO  |
		And I set body to `request_valido_201`
		When I POST to /configuration/v1/vas/customers/naoexiste
		Then response code should be 404
		And response header Content-Type should be application/json
		And response body should be valid json
		And response body path $.apiVersion should be (\w+)
		And response body path $.transactionId should be (\w+)
		And response body path $.error.httpCode should be (\w+)
		And response body path $.error.errorCode should be API-(\w+)-404
		And response body path $.error.message should be (.+)
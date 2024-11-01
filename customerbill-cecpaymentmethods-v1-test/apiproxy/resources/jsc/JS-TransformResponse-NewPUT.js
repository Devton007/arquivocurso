validateResponse();
 function validateResponse(){
    var backendResponse = JSON.parse(context.getVariable('response.content'));
    //print(JSON.stringify(backendResponse))
    var responseStatusCode = context.getVariable('response.status.code');
    var body = JSON.parse(context.getVariable('request.content'));
    //print(JSON.stringify(body))
    if(responseStatusCode ==  200 ){
        print("Oi")
        var msg ={
                apiVersion: context.getVariable('apiVersion') || "1",
                transactionId: context.getVariable('transactionId'),
                data:{
                    customerBill:{
                        paymentMethodStatus: body.data.paymentMethodStatus,
                        paymentMethodId:backendResponse.data.customerBill.paymentMethodId
                        
                    }
                }
        }
        context.setVariable('response.content', JSON.stringify(msg));
    } else if(responseStatusCode == 422){
        var message = backendResponse.message
        print("message" + message)
        setBussinessFaultResponse(message);
    }
 }
 

function setBussinessFaultResponse(Response) {

    var jsonResponse = {
        "apiVersion": context.getVariable("apiVersion"),
        "transactionId": context.getVariable("transactionId"),
        "error": {
            "httpCode": "422",
            "errorCode": mapCodeToBusinessError(Response),
            "message": "Business fault occurred.",
            "detailedMessage":  mapCodeToErrorMessage(Response),
            "link": {
                "rel": "related",
                "href": "https://api.claro.com.br/docs"
            }
        }
    };

    var response = JSON.stringify(jsonResponse);

    context.setVariable("response.status.code", 422);
    context.setVariable("response.content", response);
 
}

function mapCodeToBusinessError(errorcode) {

    var businessCodeMap = {
    "Payment Method in use": "API-CECPAYMENTMETHODS-002",
    "Payment Method not found": "API-CECPAYMENTMETHODS-003",
    "Integration procedure execution error": "API-CECPAYMENTMETHODS-004",
    "Failed to delete payment method": "API-CECPAYMENTMETHODS-005",
    "Dataraptor execution error":"API-CECPAYMENTMETHODS-006"
    };

    var returnCode = businessCodeMap[errorcode];
    if (returnCode === undefined) returnCode = "API-CECPAYMENTMETHODS-422";

    return returnCode;
}

function mapCodeToErrorMessage(errorResponse) {

    var messageMap = {
    "Payment Method in use": "Payment Method in use",
    "Payment Method not found": "Payment Method not found",
    "Integration procedure execution error": "Integration procedure execution error",
    "Failed to delete payment method": "Failed to delete payment method",
     "Dataraptor execution error":"Dataraptor execution error."   
    };
    var returnMessage = messageMap[errorResponse];
    print("returnMessage " + returnMessage)
    if (returnMessage === undefined) returnMessage = "Business fault occurred";
    return returnMessage;
}


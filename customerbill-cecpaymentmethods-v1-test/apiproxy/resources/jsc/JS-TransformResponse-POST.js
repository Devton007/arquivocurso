    var backendResponse = JSON.parse(context.getVariable('message.content'));
    var responseStatusCode = context.getVariable('response.status.code');
    var app = context.getVariable('channel');

    if(!isEmpty(app) && responseStatusCode == 200){
       var responseNovo = {
            apiVersion: context.getVariable('apiVersion'),
    		transactionId: context.getVariable('transactionId'),
    		data: {
    		    customerBill: {
    		    paymentMethodId: backendResponse.data.customerBill.paymentMethodId
    		}
    	  }
        };
        var response = JSON.stringify(responseNovo);
        context.setVariable('response.content', response);
        
    
    } else if (responseStatusCode == 200) {
        if(backendResponse.DRFlexCreatePaymentMethodLoad.vlocity_cmt__PaymentMethod__c_1[0].Id !== undefined ) {
            responseNovo = {
                apiVersion: context.getVariable('apiVersion'),
        		transactionId: context.getVariable('transactionId'),
        		data: {
        		    customerBill: {
        		    paymentMethodId: backendResponse.DRFlexCreatePaymentMethodLoad.vlocity_cmt__PaymentMethod__c_1[0].Id
        		}
        	  }
            };
            response = JSON.stringify(responseNovo);
            context.setVariable('response.content', response);
        }
    }else if(responseStatusCode == 422){
        var message = backendResponse.message;
        setBussinessFaultResponse(message);
    }
      

function setBussinessFaultResponse(Response) {
    
    var jsonResponse = {
        "apiVersion": context.getVariable("apiVersion"),
        "transactionId": context.getVariable("transactionId"),
        "error": {
            "httpCode": "422",
            "errorCode": "API-CECBILLINGACCOUNTS-422",
            "message": "Business fault occurred.",
            "detailedMessage":  mapCodeToErrorMessage(Response),
            "link": {
                "rel": "related",
                "href": "https://api.claro.com.br/docs"
            }
        }
    };

    var responseNew = JSON.stringify(jsonResponse);
    context.setVariable("response.status.code", 422);
    context.setVariable("response.content", responseNew);
 
}


function mapCodeToErrorMessage(errorResponse) {
     var messageMap = {
    "Dataraptor execution error":"Dataraptor execution error.",
    "Customer does not exists":"Customer does not exists"
    };
    var returnMessage = messageMap[errorResponse];
    print(returnMessage)
    return returnMessage;
}

function isEmpty(x) {
  return !(typeof x !== undefined && x !== null && x !== "" && x !== [] && x !== {} && x.length !== 0);
}
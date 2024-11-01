const ON_LOG_DEBUG = true;

validateResponse();

function validateResponse(){
    var responseStatusCode = context.getVariable('response.status.code');
    var backendResponse = JSON.parse(context.getVariable('message.content'));

    if(responseStatusCode == 200 && backendResponse.data.paymentMethod[0] !== null ){
    print("backendResponse" + backendResponse.data.paymentMethod);
    
      var objData = backendResponse.data.paymentMethod.map(function(item){ 
      var  billingAccount = (item.billingAccount !== undefined && item.billingAccount[0] !== null ) ? item.billingAccount : [];
          
         
            return  {
                id: item.id,
                isactive: item.isactive,
                brand: item.brand,
                holder: item.holder,
                lastFourNumber: item.lastFourNumber,
                expirationDate: item.expirationDate,
                firstToken: item.firstToken,
                secondToken: item.secondToken,
                billingAccount: billingAccount
            };
        });
             print(JSON.stringify(objData))
        var dataArrayData = [];
        objData.forEach(function(item){
            dataArrayData.push({
                    id: item.id,
                    isActive: (item.isactive) ? 'Active' : 'Inactive',
                    brand: item.brand,
                    holder: item.holder,
                    lastFourNumber: item.lastFourNumber,
                    expirationDate: item.expirationDate,
                    firstToken: item.firstToken,
                    billingAccount: item.billingAccount
            });
            
        }); 
      var messageResponse = {
        apiVersion: context.getVariable('apiVersion'),
        transactionId: context.getVariable('transactionId'),
        data: {
            PaymentMethod: dataArrayData
        }
    };
            printDebug("messageResponse: " + messageResponse);
              print(JSON.stringify(messageResponse))
             context.setVariable('response.content', JSON.stringify(messageResponse));
            
    }  else  {      
            var messageBackend = {
                apiVersion: context.getVariable('apiVersion'),
                transactionId: context.getVariable('transactionId'),
                data: {
                    PaymentMethod: []
                }
            };
             context.setVariable('response.content', JSON.stringify(messageBackend));
             print(JSON.stringify(messageBackend))
    }
    
     if(responseStatusCode == 422){
        setBussinessFaultResponse();
    }
        
}


function setBussinessFaultResponse() {

    var jsonResponse = {
        "apiVersion": context.getVariable("apiVersion"),
        "transactionId": context.getVariable("transactionId"),
        "error": {
            "httpCode": "422",
            "errorCode": "API-CECPAYMENTMETHODS-001",
            "message": "Unprocessable Entity",
            "detailedMessage": "Customer not found.",
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

function isEmpty(x) {
    return !(typeof x != "undefined" && x !== null && x !== "" && x !== [] && x !== {} && x.length !== 0);
}

// debug conforme constante
function printDebug(message) {
    if (ON_LOG_DEBUG) {
        print(message);
    }
}
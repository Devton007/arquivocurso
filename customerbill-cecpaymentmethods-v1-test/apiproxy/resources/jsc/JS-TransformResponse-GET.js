  var responseStatusCode = context.getVariable('response.status.code');var backResponse = JSON.parse(context.getVariable('message.content'));

var item;
var messageResponse = {};
var PaymentMethod = []; 
  responseStatusCode = context.getVariable('response.status.code');
if(responseStatusCode === 200){
    var pm_used = backResponse.DRFlexGetDetailsAccountExtract.data.BillingAccount.PaymentMethosInUse;
var ba_used = backResponse.DRFlexGetDetailsAccountExtract.data.BillingAccount.BillingAccountId;
var ba_for = null;
var pm_status = null;
var pm_expdate = null;


if (backResponse.DRFlexGetDetailsAccountExtract.data.PaymentMethod) {
    print ("é Array?" + Array.isArray(PaymentMethod));
    for (var i = 0; i < backResponse.DRFlexGetDetailsAccountExtract.data.PaymentMethod.length; i++) {

        pm_expdate = backResponse.DRFlexGetDetailsAccountExtract.data.PaymentMethod[i].ExpirationMonth+backResponse.DRFlexGetDetailsAccountExtract.data.PaymentMethod[i].ExpirationYear;

        if (backResponse.DRFlexGetDetailsAccountExtract.data.PaymentMethod[i].PaymentMethodId == pm_used) {
            ba_for = ba_used;
        }
        else {
            ba_for = "null";
        }

        if(backResponse.DRFlexGetDetailsAccountExtract.data.PaymentMethod[i].IsActive == true) {
            pm_status = "Active";
        }
        else {
            pm_status = "Inactive";
        }
        
        
        item =  {
                    id: backResponse.DRFlexGetDetailsAccountExtract.data.PaymentMethod[i].PaymentMethodId,
                    status: pm_status,
                    brand: backResponse.DRFlexGetDetailsAccountExtract.data.PaymentMethod[i].CardType,
                    holder: backResponse.DRFlexGetDetailsAccountExtract.data.PaymentMethod[i].CardHolderName,
                    lastFourNumber: backResponse.DRFlexGetDetailsAccountExtract.data.PaymentMethod[i].Last4Numbers,
                    expirationDate: pm_expdate,
                    firstToken: backResponse.DRFlexGetDetailsAccountExtract.data.PaymentMethod[i].PaymentIdentifier,
                    secondToken: backResponse.DRFlexGetDetailsAccountExtract.data.PaymentMethod[i].PaymentIdentifier2,
                    billingAccountId: ba_for
                  }
                
        PaymentMethod.push(item);
    }
    messageResponse = {
        apiVersion: context.getVariable('apiVersion'),
        transactionId: context.getVariable('transactionId'),
        data: {
            PaymentMethod: PaymentMethod
        }
    };
} 

context.setVariable('response.status.code', 200);
response.content = JSON.stringify(messageResponse);


} else if( responseStatusCode == 422){
     messageResponse = {
        "apiVersion": context.getVariable("apiVersion"),
        "transactionId": context.getVariable("transactionId"),
        "error": {
            "httpCode": "422",
            "errorCode": "API-CECPAYMENTMETHODS-422",
            "message": "Unprocessable Entity",
            "detailedMessage": "Business fault occurred",
            "link": {
                "rel": "related",
                "href": "https://api.claro.com.br/docs"
            }
        }
    };
    context.setVariable('response.status.code', 422);
response.content = JSON.stringify(messageResponse);
}


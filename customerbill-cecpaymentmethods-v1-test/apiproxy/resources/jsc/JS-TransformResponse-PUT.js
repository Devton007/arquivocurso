var backResponse = JSON.parse(context.getVariable('response.content'));
var msg = {};
var httpCode = null;
var errorCode = null;
var message = null;
var detailedMessage = null;
var backCode;
var pm_status = null;

if (backResponse.DRFlexCheckPaymentMethodInUseExtract.data.CheckPaymentMethodInUse != "") {
    httpCode = "422";
    errorCode = "API-CECPAYMENTMETHODS-422";
    message = "Unprocessable Entity";
    detailedMessage = "Este Método de Pagamento não pode ser desativado pois ele está em uso por algum Produto.";
         
    msg = {
        apiVersion: context.getVariable('apiVersion') || "1",
        transactionId: context.getVariable('transactionId'),
        error: {
            httpCode: httpCode,
            errorCode: errorCode,
            message: message,
            detailedMessage: detailedMessage,
            link: {
                href: "https://api.claro.com.br/docs",
                rel: "related"
            }
        }
    };
    context.setVariable('response.status.code', 422);
}
else if (backResponse.success == false) {
    httpCode = "422";
    errorCode = "API-CECPAYMENTMETHODS-422";
    message = "Unprocessable Entity";
    detailedMessage = backResponse.result.errorsAsJson.DRError;

    msg = {
        apiVersion: context.getVariable('apiVersion') || "1",
        transactionId: context.getVariable('transactionId'),
        error: {
            httpCode: httpCode,
            errorCode: errorCode,
            message: message,
            detailedMessage: detailedMessage,
            link: {
                href: "https://api.claro.com.br/docs",
                rel: "related"
            }
        }
    };
    context.setVariable('response.status.code', 422);

}
else if (backResponse.DRFlexInativatePaymentMethodLoad.vlocity_cmt__PaymentMethod__c_1[0].UpsertSuccess == true){
    if(backResponse.DRFlexInativatePaymentMethodLoad.vlocity_cmt__PaymentMethod__c_1[0].vlocity_cmt__IsActive__c == false){ 
        pm_status = "Inactive";
    } else {
        pm_status = "Active";
    }
    msg = {
        apiVersion: context.getVariable('apiVersion'),
        transactionId: context.getVariable('transactionId'),
        data: {
            customerBill: {
                paymentMethodStatus: pm_status
            }
        }
    };
    context.setVariable('response.status.code', 200);
}


response.content = JSON.stringify(msg);

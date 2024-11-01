    var body = JSON.parse(context.getVariable('message.content'));
    var app = context.getVariable('channel');
    
    if(isEmpty(app)){
            context.setVariable('uri', '/services/apexrest/vlocity_cmt/v1/integrationprocedure/Flex_Paymentmethods');
            var x = body.data.paymentMethod.creditCard.expirationDate;
            var y = x.substring(0,2);
            var z = x.substring(2,6);
            var requestNovo = {
                
            ConsumerAccountId: body.data.customerAccountId,
            vlocity_cmt__MethodType__c: body.data.paymentMethod.type,
            vlocity_cmt__CardType__c: body.data.paymentMethod.creditCard.brand,
            vlocity_cmt__CardHolderName__c: body.data.paymentMethod.creditCard.holder,
            vlocity_cmt__Last4Numbers__c: body.data.paymentMethod.creditCard.lastFourNumber,
            vlocity_cmt__ExpirationMonth__c: y,
            vlocity_cmt__ExpirationYear__c: z, 
            vlocity_cmt__PaymentMethodIdentifier__c: body.data.paymentMethod.creditCard.firstToken,
            PaymentMethodIdentifier2__c: body.data.paymentMethod.creditCard.secondToken
            };
   
        var request = JSON.stringify(requestNovo);
          context.setVariable('request.content', request);
    } else {
       context.setVariable('uri', '/services/apexrest/vlocity_cmt/v1/integrationprocedure/NewStack_UpsertPaymentMethod/');
       context.setVariable('message.content', JSON.stringify(body));
    }
        
    function isEmpty(x) {
        return !(typeof x !== undefined && x !== null && x !== "" && x !== [] && x !== {} && x.length !== 0);
    }


    
    //api sendo transformada para devolver como está no backend
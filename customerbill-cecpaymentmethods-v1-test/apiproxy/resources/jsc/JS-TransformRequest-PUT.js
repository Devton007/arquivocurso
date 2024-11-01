var body = JSON.parse(context.getVariable('message.content'));
 context.setVariable('uri', '/services/apexrest/vlocity_cmt/v1/integrationprocedure/Flex_Paymentmethods');
        var requestNovo = {
            PaymentMethodId: body.data.paymentMethodId,
        };
    var username = 'status'; 
        context.removeVariable("request.queryparam." + username); 
    var request = JSON.stringify(requestNovo);
    context.setVariable('request.content', request);
    
    //api sendo transformada para devolver como está no backend
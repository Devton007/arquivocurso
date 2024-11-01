 validateRequest();
 
 function validateRequest(){
    
     var body = JSON.parse(context.getVariable('message.content'));
     if(!body.data){
         setvalidateRequestContext("data ", true)
     }
     if(!body.data.paymentMethodId){
         setvalidateRequestContext("paymentMethodId ", true)
     }
       
        context.setVariable('uri', '/services/apexrest/vlocity_cmt/v1/integrationprocedure/NewStack_UpsertPaymentMethod/');

 }
 
 function setvalidateRequestContext(fieldName, fail) {
  context.setVariable("validateRequest.fieldName", "[" + fieldName + "]");
  context.setVariable("validateRequest.fail", fail);
  context.setVariable("errorDescription.error", fieldName + " é obrigatório");
}
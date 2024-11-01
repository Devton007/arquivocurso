 const ON_LOG_DEBUG = true;

validateRequest();

function validateRequest(){

    
    var businessUnit = context.getVariable("request.queryparam.param_name.businessUnit");
    print(businessUnit)
    var keyValuePairs = null
    var params = {};
    var isActive = context.getVariable("request.queryparam.param_name.isActive");
    var list = [];

     var xQueryString = context.getVariable("request.header.X-QueryString");
     print(xQueryString)
     if(!xQueryString){
         setRequiredParameterMessage("xQueryString",true)
         return
     }
         keyValuePairs = xQueryString.split('&');
        if(keyValuePairs.length != 2){
            setRequiredParameterMessage("documentType and documentNumber", true);
            return
        }
        var attribs = [ 'documentType', 'documentNumber' ];
        
    if (xQueryString) {
        var paramPairs = xQueryString.split('&');
        paramPairs.forEach(paramPair => {
            if (paramPair) {
                var paramPairSplit = paramPair.split('=');
                var name = paramPairSplit[0];
                var value = paramPairSplit[1];
                if (!attribs.find(a => a == name)) throwParameterFault();
                params[name] = value;
            }
        });
    }
    
   
            if (!isEmpty(businessUnit)) {
                list.push("businessUnit = "+businessUnit);
            }
            if (!isEmpty(isActive)) {
                list.push("&isactive = "+isActive);
            }
            if(!isEmpty(params.documentType)){
                 list.push("&documentType = "+params.documentType);
            }
            if(!isEmpty(params.documentNumber)){
                 list.push("&documentNumber = "+params.documentNumber);
            }
        
        //context.setVariable("request.queryparam." + )
        
    context.setVariable('uri', '/services/apexrest/vlocity_cmt/v1/integrationprocedure/NewStack_SearchPaymentMethod/' + "?" +list.join('').replace(/\s+/g, ''));
      context.setVariable('target.verb', 'POST');
      
}


function isEmpty(x) {
    return !(typeof x != "undefined" && x !== null && x !== "" && x !== [] && x !== {} && x.length !== 0);
}

function printDebug(message) {
    if (ON_LOG_DEBUG) {
        print(message);
    }
}

function setRequiredParameterMessage(fieldName, fail) {
    context.setVariable("validateRequest.fieldName", "[" + fieldName + "]");
  context.setVariable("validateRequest.fail", fail);
  context.setVariable("errorDescription.error", fieldName + " é obrigatório");
}
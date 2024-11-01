getXQueryParam();


function getXQueryParam() {

      var xqueryString = context.getVariable("message.header.x-querystring");
      if (xqueryString) {
        var queryStringPairs = xqueryString.split("&");
        for (var i = 0; i < queryStringPairs.length; i++) {
          var nameValuePair = queryStringPairs[i];
          print("nameValuePair " + nameValuePair)
          var nameAndValue = nameValuePair.split("=");
          print("nameAndValue " + nameAndValue) 
          if (nameAndValue.length == 2){
            context.setVariable("request.queryparam."+nameAndValue[0], nameAndValue[1]);
          } 
        } 
      }
    }
function setvalidateRequestContext(fieldName, fail) {
  context.setVariable("validateRequest.fieldName", "[" + fieldName + "]");
  context.setVariable("validateRequest.fail", fail);
  context.setVariable("errorDescription.error", fieldName + " é obrigatório");
}
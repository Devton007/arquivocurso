var xqueryString = context.getVariable('request.header.X-QueryString');
var params = {};
if(xqueryString){
    var paramPairs = xqueryString.split('&');
    paramPairs.forEach(paramPair => {
        if (paramPair) {
            var paramPairSplit = paramPair.split('=');
            var name = paramPairSplit[0];
            var value = paramPairSplit[1];
            params[name] = value;
            context.setVariable("documentType", "CPF");
            context.setVariable("documentNumber", "58266739072");
            
            
        }
    });
    
    print(params);
}
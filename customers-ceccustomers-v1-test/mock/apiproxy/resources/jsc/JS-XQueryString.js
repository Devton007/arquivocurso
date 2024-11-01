 
extractParams();

function extractParams() {
    context.setVariable('x-querystring.identificationType', getXQueryParam("identificationType"));
    context.setVariable('x-querystring.identificationId', getXQueryParam("identificationId"));
}

function getXQueryParam(paramName) {
    var queryStringObj = {};
    var xqueryString = context.getVariable('message.header.x-querystring');
    if (xqueryString)
    {
        var queryStringPairs = xqueryString.split("&");
        for (var i = 0; i < queryStringPairs.length; i++)
        {
            var nameValuePair = queryStringPairs[i];
            var nameAndValue = nameValuePair.split('=');
            if (nameAndValue.length == 2)
                queryStringObj[nameAndValue[0]] = nameAndValue[1];
        }
    }

    return queryStringObj[paramName] ? queryStringObj[paramName] : "";
}
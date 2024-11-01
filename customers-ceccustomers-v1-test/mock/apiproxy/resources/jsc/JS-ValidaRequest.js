try {

    var X_ResponseSimulation = context.getVariable('apigee.reqSimulaFault');
    if (X_ResponseSimulation.indexOf("error-") != -1)
    {
        context.setVariable(X_ResponseSimulation, true);
    }
} catch (e)
{
    print("Erro JS-ValidaResponse.js", e);
    context.setVariable("error-400",true);
}



function isEmpty(str) {
    return (!str || 0 === str.length || str === "" || str === "null");
}
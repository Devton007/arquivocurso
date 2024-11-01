 try {

    var backendResponse = JSON.parse(context.getVariable('response.content'));
    var resposta = "";
    
    if (!isEmpty(backendResponse.accountResponseBody)) {
    	resposta = {
    		apiVersion: context.getVariable('apiVersion'),
    		transactionId: context.getVariable('transactionId'),
            customer: [
                {
                  customerId: backendResponse.accountResponseBody.body.id
                }
              ]
    	};
    } else {
    	resposta = {
    		apiVersion: context.getVariable('apiVersion'),
    		transactionId: context.getVariable('transactionId'),
    		data:{
    			correlationId: backendResponse.responseTransactionId
    		}
    	};
    }

	// Seta resposta
	response.content = JSON.stringify(resposta);
	
}catch (e){
	context.setVariable('validateResponse.fail', e);
	throw new Error(e);
}

/**
 * Verifica se uma string está vazia
 * @param {string} str String a validar
 * @returns boolean
 */
function isEmpty(str) {
    return (!str || 0 === str.length || str === "" || str === "null");
}
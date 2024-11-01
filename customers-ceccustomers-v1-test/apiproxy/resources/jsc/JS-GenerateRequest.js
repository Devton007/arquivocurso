createNewRequest();


function createNewRequest() {

    try {
        
        var requestApigee = JSON.parse(context.getVariable('request.content'));

        // Payload Request
        var nr = "";
        if (!isEmpty(requestApigee.customer)) {
        	nr = {
        		body:{
                		name: requestApigee.customer.name,
                		email: requestApigee.customer.emailAddress,
                		cpf: requestApigee.customer.partyIdentificationObject[0].identificationId,
                		phone: requestApigee.customer.phoneContacts[0].phoneNumber,
                		Origem: requestApigee.customer.channelId
            		}
        	};
        	
    	} 
    	// Set Payload Request
    	request.content = JSON.stringify(nr);

        
    } catch (e) {
	    context.setVariable("validateRequest.fail", e);
	    throw new Error(e);
    }
 
}

/**
 * Verifica se uma string está vazia
 * @param {string} str String a validar
 * @returns boolean
 */
 function isEmpty(str) {
    return (!str || 0 === str.length || str === "" || str === "null" || str === "undefined");
}
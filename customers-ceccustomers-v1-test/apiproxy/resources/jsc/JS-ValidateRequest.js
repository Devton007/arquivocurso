 validateRequest();

function validateRequest() {

    var apiRequest;

    context.setVariable("validateRequest.fail", false);

    try {

        // Valida Body Request
        apiRequest = request.content.asJSON;
        if (isEmpty(apiRequest)) {
            setvalidateRequestContext("Request JSON", true);
            return;
        }

        var x_name = apiRequest.customer.name;
        if (isEmpty(x_name)) {
            setvalidateRequestContext("Customer Name", true);
            return;
        }
        
        var x_cpf = apiRequest.customer.partyIdentificationObject[0].identificationId;
        if (isEmpty(x_cpf)) {
            setvalidateRequestContext("Customer CPF", true);
            return;
        }
        
        var x_phone = apiRequest.customer.phoneContacts[0].phoneNumber;
        if (isEmpty(x_phone)) {
            setvalidateRequestContext("Customer PhoneContacts", true);
            return;
        }
        
        var x_email = apiRequest.customer.emailAddress;
        if (isEmpty(x_email)) {
            setvalidateRequestContext("Customer EmailAddress", true);
            return;
        }
        
        var x_channel = apiRequest.customer.channelId;
        if (isEmpty(x_channel)) {
            setvalidateRequestContext("Customer Channel", true);
            return;
        }


    } catch (e) {
        print("Erro na operação validateRequest: " + e);
        context.setVariable("validateRequest.fail", true);
        context.setVariable("validateRequest.error", e);
    }
}

/**
 * Verifica se uma string está vazia
 * @param {string} str String a validar
 * @returns boolean
 */
function isEmpty(str) {
    return (!str || 0 === str.length || str === "" || str === "null");
}

/**
 * Configura as váriveis de contexto para refletir que a requisição
 * é inválida
 * @param {string} fieldName Nome do campo que está inválido
 * @param {boolean} fail Status de falha
 */
function setvalidateRequestContext(fieldName, fail) {
    context.setVariable("validateRequest.fieldName", "[" + fieldName + "]");
    context.setVariable("validateRequest.fail", fail);
}

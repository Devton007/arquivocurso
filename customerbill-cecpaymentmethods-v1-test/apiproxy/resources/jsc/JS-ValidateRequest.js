validateRequest();

function validateRequest() {
  var verb = context.getVariable("request.verb");
  var pathsuffix = context.getVariable("proxy.pathsuffix");
  var apiRequest;
  var errorDescription = null;

  context.setVariable("validateRequest.fail", false);

  try {
    if (pathsuffix === "" && verb == "GET") {
      var xQueryString = context.getVariable("request.header.X-QueryString");
      var businessUnit = context.getVariable("request.header.businessUnit");

      if (isEmpty(xQueryString)) {
        setvalidateRequestContext("header X-QueryString", true);
      } else if (!businessUnit) {
        var documentType = context.getVariable(
          "request.queryparam.documentType"
        );
        var documentNumber = context.getVariable(
          "request.queryparam.documentNumber"
        );

        if (!documentType && !documentNumber) {
          setvalidateRequestContext("documentType" & "documentNumber", true);

          context.setVariable("documentType", documentType);
          context.setVariable("documentNumber", documentNumber);
        }
        if (errorDescription) {
          context.setVariable("validatePayloadValues.error", errorDescription);
          context.setVariable("validatePayloadValues.fail", true);
          context.setVariable("errorDescription.error", errorDescription);
        }

        context.setVariable(
          "uri",
          "/services/apexrest/vlocity_cmt/v1/integrationprocedure/Flex_Paymentmethods"
        );
      }
    } else if (pathsuffix === "" && verb == "POST") {
      apiRequest = JSON.parse(context.getVariable("message.content"));

      if (isEmpty(apiRequest) || isEmpty(apiRequest.data)) {
        setvalidateRequestContext("data", true);
      } else {
        if (apiRequest.data) {
          if (!apiRequest.data.customerAccountId) {
            setvalidateRequestContext("customerAccountId", true);
          }
          if (!apiRequest.data.paymentMethod) {
            setvalidateRequestContext("paymentMethod", true);
          }
          if (!apiRequest.data.paymentMethod.type) {
            setvalidateRequestContext("type", true);
          }
          if (!apiRequest.data.paymentMethod.creditCard) {
            setvalidateRequestContext("creditCard", true);
          }
          if (!apiRequest.data.paymentMethod.creditCard.brand) {
            setvalidateRequestContext("brand", true);
          }
          if (!apiRequest.data.paymentMethod.creditCard.holder) {
            setvalidateRequestContext("holder", true);
          }
          if (!apiRequest.data.paymentMethod.creditCard.lastFourNumber) {
            setvalidateRequestContext("lastFourNumber", true);
          }
          if (!apiRequest.data.paymentMethod.creditCard.expirationDate) {
            setvalidateRequestContext("expirationDate", true);
          }
          if (!apiRequest.data.paymentMethod.creditCard.firstToken) {
            setvalidateRequestContext("firstToken", true);
          }
        }

        if (errorDescription) {
          context.setVariable("validatePayloadValues.error", errorDescription);
          context.setVariable("validatePayloadValues.fail", true);
          context.setVariable("errorDescription.error", errorDescription);
        }
      }
    }
    else if (pathsuffix === "/status" && verb == "PUT") {
      apiRequest = JSON.parse(context.getVariable("message.content"));
    
      if (isEmpty(apiRequest) || isEmpty(apiRequest.data)) {
        setvalidateRequestContext("data", true);
      } else {

        if (apiRequest.data) {
          if (!apiRequest.data.paymentMethodId) {
            setvalidateRequestContext("paymentMethodId", true);
          }
          if (!apiRequest.data.paymentMethodStatus) {
              setvalidateRequestContext("paymentMethodStatus", true);
            }
          }
        }
      }
  } catch (e) {
    print("Erro na operação validateRequest: " + e);
    context.setVariable("validateRequest.fail", true);
    context.setVariable("validateRequest.error", e);
  }
}
function isEmpty(x) {
  return !(
    typeof x !== undefined &&
    x !== null &&
    x !== "" &&
    x !== [] &&
    x !== {} &&
    x.length !== 0
  );
}

function setvalidateRequestContext(fieldName, fail) {
  context.setVariable("validateRequest.fieldName", "[" + fieldName + "]");
  context.setVariable("validateRequest.fail", fail);
  context.setVariable("errorDescription.error", fieldName + " é obrigatório");
}

function removeEmptyOrNull(obj) {
  Object.keys(obj).forEach((k) => {
    (obj[k] && typeof obj[k] === "object" && removeEmptyOrNull(obj[k])) ||
      (obj[k] === "" && obj[k] === null && delete obj[k]);
  });
  return obj;
}
context.removeVariable("request.header.X-QueryString");

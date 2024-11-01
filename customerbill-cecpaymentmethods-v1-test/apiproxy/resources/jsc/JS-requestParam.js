  validate();
 function validate(){
    var channel = context.getVariable('clientAuth.Data.channel');

    if(channel == "nowonlineclarotvavs"){
        channel = context.setVariable('channel',channel);
        context.setVariable("validateRequest.APP", true);

    } else {
         context.setVariable("validateRequest.APP", false);
    }
 }
 
 
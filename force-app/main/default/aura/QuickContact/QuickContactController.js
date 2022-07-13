({
	doSave : function(component, event, helper) {
		var action = component.get('c.createContact');
        var contc = component.get('v.CreateContact');
       /* if(contc.FirstName === null||contc.FirstName === ''||contc.FirstName === undefined){
            alert('Please Enter FirstName');
            return;
        }
        */
        
        var validcontact = component.find('contactform').reduce(function(validSoFar, inputcmp){
            inputcmp.showHelpMessageIfInvalid();
            inputcmp.set('v.validity',{valid:false,badInput:true});
            return validSoFar && inputcmp.get('v.validity').valid;
            
        },true);
        console.log('validcontact', validcontact);
        
        if(validcontact){
        action.setParams({
            con : component.get('v.CreateContact'),
            AccountId : component.get('v.accountId')            
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
           
            if(state === 'SUCCESS'|| state ==='DRAFT'){
                var responsevalue = response.getReturnValue();
                var contCompEvent = component.getEvent('RegContactEvent');
                contCompEvent.setParams({
                    ContactRecord : responsevalue
                });
                contCompEvent.fire();
                
            }else if(state === 'INCOMPLETE'){
                
            }else if(state === 'ERROR'){
                var errors = response.getError();
                console.log('Errors', errors[0].duplicateResults);
                  console.log('Errors', errors[0].fieldErrors);
                  console.log('Errors', errors[0].pageErrors);
                
                if(errors || errors[0].message){
                    
                }
            }
                    
        },'ALL');
        
        $A.enqueueAction(action);
        }
        else{
            console.log('Please Enter all the Input values');
        }
	}
})
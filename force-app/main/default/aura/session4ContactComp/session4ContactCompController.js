({
	doInit : function(component, event, helper) {
		
        var action = component.get('c.getcontact');
        
        action.setParams({
            accountID : component.get('v.recordId'),
        });
        
       action.setCallback(this,function(response){
            var responsevalue = response.getReturnValue();
           
           console.log('responsevalue',responsevalue);
           component.set("v.contactList",responsevalue)
        },'SUCCESS')

        $A.enqueueAction(action);
	},
    
    doRedirect  : function(component, event, helper) {
    
        var eventsource = event.getSource();
        var id = eventsource.get('v.name');
  
         var navEvt = $A.get("e.force:navigateToSObject");
    	navEvt.setParams({
      	"recordId": id,
      	"slideDevName": "detail"
    });
    navEvt.fire();

        
	},
    
    
    handleEvent1 : function(component, event, helper) {
     
        var Availablecontact= component.get("v.contactList")
        var ContactRecord = event.getParam('ContactRecord');
        Availablecontact.push(ContactRecord);
        component.set("v.contactList",Availablecontact);
    } 
})
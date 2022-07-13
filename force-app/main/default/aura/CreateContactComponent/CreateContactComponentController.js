({
	handleReview : function(component, event, helper) {
        var isValid = helper.validateForm(component, event, helper);
        if(isValid){
            var componentEvent = component.getEvent('CreateContacts');
            component.set('v.ContactRecord.AccountId',component.get('v.recordId'));
            componentEvent.setParams({
                conRecord : component.get('v.ContactRecord')
            });
            componentEvent.fire();           
            
        }else{
            alert('please fill all the fields');
        }
		
	},
    
    selectRecord : function(component, event, helper) {
        var params = event.getParam('arguments');
        if(params){
            var contactRecord = params.contact;
           
            console.log('contactRecord', contactRecord.LastName);
            
         
            component.set('v.ContactRecord',contactRecord);
            
        }
        
    }
})
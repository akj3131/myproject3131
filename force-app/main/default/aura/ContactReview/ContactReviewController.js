({
	RemoveRecord : function(component, event, helper) {
		var index = event.currentTarget.id;
        var existingRecords = component.get('v.ContactRecords');
        existingRecords.splice(index,1);
        component.set('v.ContactRecords',existingRecords);
	},
    editRecord : function(component, event, helper) {
		var index = event.currentTarget.id;
        var existingRecords = component.get('v.ContactRecords');
    
        var selectedRecords = existingRecords[index];
       /*existingRecords.splice(index,1);
        component.set('v.ContactRecords',existingRecords); */
        var selRecordEvent = component.getEvent('SelectRecordEvent');
        
        selRecordEvent.setParams({
           contact :selectedRecords,
            
        });
        selRecordEvent.fire();
        
	},
})
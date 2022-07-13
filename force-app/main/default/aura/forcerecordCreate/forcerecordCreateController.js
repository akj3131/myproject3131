({
	createContact : function(component, event, helper) {
        var createRecord = $A.get("e.force:createRecord");
        createRecord.setParams({
            "entityApiName": "Contact", 
            "defaultFieldValues": {
                'Phone' : '415-240-6590',
                'AccountId' : component.get('v.recordId')
            }
        });
        createRecord.fire();
    },
    editRecord : function(component, event, helper) {
        var editRecord = $A.get("e.force:editRecord");
        editRecord.setParams({
            'recordId' : component.get('v.recordId')
        });
        editRecord.fire();
    },
})
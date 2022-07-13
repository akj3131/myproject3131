({
	doAction : function(component, event, helper) {
		alert('Value Changed');
	},
    
    changeValue : function(component, event, helper) {
		component.set('v.test','test123');
        var aeEvent = $A.get('e.c:aeApplication');
        aeEvent.fire();
	},
    doInit : function(component, event, helper) {
		component.set('v.test','test-1');
	},
    
})
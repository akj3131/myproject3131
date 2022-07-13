({
	doParent : function(component, event, helper) {
		var childcmp = component.find('childcmp');
        childcmp.child('I am from parent cmp');
	}
})
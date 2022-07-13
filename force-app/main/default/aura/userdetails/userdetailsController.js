({
	doInit : function(component, event, helper) {
        var username= $A.get("$SObjectType.CurrentUser.Id");
        component.set('v.LoginUser',username);
		
	}
})
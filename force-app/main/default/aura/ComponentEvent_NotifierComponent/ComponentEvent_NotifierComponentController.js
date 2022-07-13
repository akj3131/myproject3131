({
	/* firecomponentevent : function(component, event) {
        
        var varCmpEvent = component.getEvent("CompName");
        varCmpEvent.setParams({
            "message":"This is message passed by component event"
        });
        
        varCmpEvent.fire();
		*/
    firecomponentevent : function(component, event) {
        
        var varCmpEvent = $A.get("e.c:TrainingComponentEvent_Event");
        varCmpEvent.setParams({
            "message":"This is message passed by component event",
            "message1":"This is message passed by component event1"
        });
        
        varCmpEvent.fire();
	
	}
})
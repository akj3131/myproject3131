({
	handleComponentEvent : function(component, event) {
		var varMessage = event.getParam("message");
        
        component.set("v.messageFromEvent",varMessage);
        
        var varMessage1 = event.getParam("message1");
                component.set("v.messageFromEvent1",varMessage1);
        
        
        var varNumEventsHandled = parseInt(component.get("v.numofEventsCalled")) +1;
        
        component.set("v.numofEventsCalled",varNumEventsHandled);
        
	}
})
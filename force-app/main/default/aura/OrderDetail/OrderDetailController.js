({
	doInit : function(component, event, helper) {
        var pageref = component.get('v.pageReference');
        if(pageref){
            var state =pageref.state;
            component.set('v.orderId',state.c__orderId);
            component.find('recordViewer').reloadRecord();            
        }
		
	}
})
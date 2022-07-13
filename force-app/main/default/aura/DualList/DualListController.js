({
    
    doInit: function(component, event, helper) {
        var options = [
        { label: 'English', value: 'en' },
        { label: 'German', value: 'de' },
        { label: 'Spanish', value: 'es' },
        { label: 'French', value: 'fr' },
        { label: 'Italian', value: 'it' },
        { label: 'Japanese', value: 'ja' }];
        
        component.set('v.options',options);
        
        
    },
	handleChange : function(component, event, helper) {
		var selectedOptionValue = event.getParam("value");
        alert("Option selected with value: '" + selectedOptionValue.toString() + "'");
	}
})
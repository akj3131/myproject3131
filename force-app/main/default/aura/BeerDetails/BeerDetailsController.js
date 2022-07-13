({
	 doOrder : function(component, event, helper) {
        
        var pageReference = component.find("navigation");
        var pageReferenceNav = {    
            "type": "standard__component",
            "attributes": {
                "componentName": "c__CreateBeerOrder"    
            },    
            "state": {
              "beerId__c": component.get('v.beerId')
               // "Ashween__c" :component.get('v.beerId')
               }
        };
        
        pageReference.navigate(pageReferenceNav);
    },
    
})
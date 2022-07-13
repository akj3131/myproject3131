({
	getEligibility : function(component) {
		var vAge=component.find("Age").get("v.value");
        
        if(vAge >=18)
            component.set("v.EligibleorNot", true);
         else
             component.set("v.EligibleorNot", false);
            
            
	}
})
({
	getInfo : function(component) {
        
      /*  sscneairo1
       *var enteredFvalue = component.find("FName").get("v.value");
        var enteredLvalue = component.find("LName").get("v.value");
        var contvalue = enteredLvalue + " , " + enteredFvalue;
		var displayvalue = component.find("DisplayName");
        displayvalue.set("v.value", contvalue);
        -->
        */
        
        var enteredAge = component.find("UAge").get("v.value");
              
            if(enteredAge>18)
                component.set("v.EligileorNot",true);
            else
                component.set("v.EligileorNot",false);
    
	}
})
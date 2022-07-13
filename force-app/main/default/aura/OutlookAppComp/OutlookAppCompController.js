({
	getOutlook : function(component) {
		var FName=component.find("FN").get("v.value");
        var LName=component.find("LN").get("v.value");
        var Final= LName + ',' + FName;
        var OName=component.find("FinalName");
        OName.set("v.value", Final);
        
	}
})
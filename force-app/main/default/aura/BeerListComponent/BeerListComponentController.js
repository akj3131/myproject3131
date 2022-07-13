({
	ShowInfo : function(component, event, helper) {
   var Eventsource = event.getSource();
      var beerObj = Eventsource.get('v.name');
        component.set('v.beerId',beerObj );
        
        $A.createComponent("c:BeerDetails",
            {
                "beerId" : beerObj,
                     },
            function(beerDetails, status, errorMessage){
                //Add the new button to the body array
           
                if (status === "SUCCESS") {
                    component.find('overlayLib1').showCustomModal({
                        header: "Beer Details",
                        body: beerDetails,
                        footer: "footer",
                        showCloseButton: true,
                        closeCallback: function() {
                            
     							   }
                    });
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                    // Show offline error
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                    // Show error message
                }
            }
        );
    }, 
    
    addToCart : function(component, event, helper) {
        
   var Eventsource = event.getSource();
      var beerId = Eventsource.get('v.name');
       var index = Eventsource.get('v.value'); 
      
        var selectedBeer = component.get('v.recordList')[index];
         console.log('selected Beer', selectedBeer.Id);
      var addToCartEvent = component.getEvent('addToCart');
        addToCartEvent.setParams({
            beerRecord: selectedBeer,
          
        });
      addToCartEvent.fire();
    }
})
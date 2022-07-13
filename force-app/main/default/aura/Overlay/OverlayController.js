({
    handleShowModal : function(component, event, helper) {
        component.find('overlayLib1').showCustomModal({
            header: "Application Confirmation",
            body: "This is Test",
            footer: "This is footer",
            showCloseButton: true,
            closeCallback: function() {
            alert('You closed the alert!');
        }
                                                      });
    },
    
    
    navigateUrl : function(component, event, helper) {

        var pageReference = component.find("navigation");
        var pageReferenceNav = {    
            "type": "standard__component",
            "attributes": {
                "componentName": "c__BeerExplorer"    
            },    
            "state": {
                "c__myAttr": "attrValue"    
            }
        }
      pageReference.navigate(pageReferenceNav);  
    },
    
    createButton: function(component, event, helper) {
        
      $A.createComponent("lightning:button",
            {
                "aura:id" : "findableAuraId",
                "label" : "Press Me",
                "onclick" : component.getReference("c.handlePress")
            },
            function(newButton, status, errorMessage){
                //Add the new button to the body array
                
                if (status === "SUCCESS") {
                    var body = component.get("v.body");
                    body.push(newButton);
                    component.set("v.body", body);
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
           
    handlePress : function(component){
          console.log("button: " + component.find("findableAuraId"));
        console.log("button pressed");
    }

})
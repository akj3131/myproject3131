({
    doInit : function(component, event, helper) {
        component.find('recordCreator').getNewRecord(
            'Beer__c',
            null,
            false,
            $A.getCallback(function(){
                
                var record = component.get('v.record');
                var error = component.get('v.recordError');
                if(error || (record===null)){
                    console.log('Error while creating the template' + error)
                }else{
                    console.log('Successfully created');
                   // alert('Template Initiated');
                	}               
            }));
        
    },
    
    handleSave : function(component, event, helper) {
        component.set('v.recordFields.Id__c','9494643131');
        component.find('recordCreator').saveRecord(function(saveResult){
          console.log(JSON.stringify(saveResult));
            if(saveResult.state==='SUCCESS'||saveResult.state==='DRAFT'){
                var showToast = $A.get('e.force:showToast'); 
                showToast.setParams({
                    "title": "Record Saved!",
                    "type": "success",
                    "message": "Beer record has been saved with Record ID:" + saveResult.recordId
                });
                showToast.fire();
            }else if (saveResult.state==='INCOMPLETE'){
                
            }else if (saveResult.state==='ERROR'){
                
            }else {
                
            }
            
        })
    },
})
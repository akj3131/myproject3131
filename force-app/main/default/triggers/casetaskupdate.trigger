trigger casetaskupdate on Case (before update) {

   Set<Id> setCaseId = new Set<Id>();
    for (Case theCase:trigger.new) {
        if(theCase.status=='Closed'){
            setCaseId.add(theCase.id);
        }
    }
    
    if(setCaseId.size() > 0 ){
    
        List<Task> lstTask = [SELECT WhatId,id FROM Task WHERE WhatId in :setCaseId and IsClosed  = false];
        
            List<Task> TaskUpdate = new List<Task>();         
                                for(Task t: lstTask)                       
                                {
                                t.Status = 'Completed';
                                TaskUpdate.add(t);
                                }
                                update TaskUpdate ;
                                                            
                          
    }
    
    }
global class ContactBatch implements Database.Batchable<sObject>, Database.stateful{
    global integer Total_Size= 0;
    global integer Failure_Size= 0;
    global integer Success_Size= 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc){
          String Query = 'SELECT Id,Name,Email,Fax,Description,Account.Fax,Account.Name,Account.Rating,Account.Industry FROM contact where AccountId !=null';
          // 'Where Name ='+'\''+'Andy Young'+'\'';
        System.debug(Query);
        
        AsyncApexJob[] apexJobs =[Select Id, ApexClassId, ApexClass.Name,
                                  NumberOfErrors, JobItemsProcessed,
                                  TotalJobItems,Status,JobType From AsyncApexJob where Id =:bc.getJobId()];
        system.debug('#### Batch Status Start Method '+apexJobs );
        return Database.getQueryLocator(Query);
        
    }
    global void execute(Database.BatchableContext bc, List<contact> contactList){
        
        AsyncApexJob[] apexJobs = [Select Id, ApexClassId, ApexClass.Name,
                                  NumberOfErrors, JobItemsProcessed,
                                  TotalJobItems,Status,JobType From AsyncApexJob where Id =:bc.getJobId()];
        system.debug('#### Batch Status Execute Parent Method '+apexJobs );
        
        
        AsyncApexJob[] apexJobs_Child =[Select Id, ApexClassId, ApexClass.Name,
                                        NumberOfErrors, JobItemsProcessed,
                                        TotalJobItems,Status,JobType From AsyncApexJob where Id =:bc.getChildJobId()];
        system.debug('#### Batch Status Execute Child Method '+apexJobs_Child );  
        
        Integer size = contactList.size();
        Total_Size = Total_Size + size;
        //try{
            
            for(Integer i=0; i<size; i++){
                Contact con = contactList.get(i);
                
                con.Description = con.Account.Name+' '+con.Account.Rating+' '+con.Account.Industry+' '+con.Email;
            
                
               if(con.Fax == null || con.Fax == ''){
                    con.Fax = con.Account.Fax;
                }
                
            }
       /* }catch (System.Exception Ex){
            system.debug(Ex.getMessage()+' '+Ex.getCause());
        }*/
        
        //Update contactList;
        Database.SaveResult[] result =  Database.update(contactList, false);
        Integer size_result = result.size();
        for(Integer i=0; i<size; i++){
            Database.SaveResult sr = result.get(i);
            if(sr.isSuccess()){
                Success_Size +=1;
            }else{
                Failure_Size +=1;
            }
        }
        
        
    }
    global void finish(Database.BatchableContext bc){
        AsyncApexJob[] apexJobs =[Select Id, ApexClassId, ApexClass.Name,
                                  NumberOfErrors, JobItemsProcessed,
                                  TotalJobItems,Status,JobType From AsyncApexJob where Id =:bc.getJobId()];
        system.debug('#### Batch Status Finish Method '+apexJobs );
        
        Messaging.singleEmailMessage email = new Messaging.singleEmailMessage();
        email.setSubject('Status of Batch Class : ContactBatch');
        email.setSenderDisplayName('AKJ3131');
        email.setHtmlBody('Dear User, </br> Batch Processed'+
                          '</br> Total Records : '+Total_Size +
                          '</br> Success Records : '+Success_Size+
                          '</br> Failure Records : '+Failure_Size);
        // email.setToAddresses(new List<String> {'iamashween@gmail.com'});
        List<String> emailTo = new List<String>();
        emailTo.add('iamashween@gmail.com');
        email.setToAddresses(emailTo);
        
        Messaging.singleEmailMessage[] emailList = new List<Messaging.singleEmailMessage>();
        emailList.add(email);
        
        Messaging.sendEmail(emailList, false);
        
    }
    
}
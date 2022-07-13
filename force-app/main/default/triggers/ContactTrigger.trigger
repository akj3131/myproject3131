trigger ContactTrigger on Contact (before insert, after insert, before update, after update, before delete, after undelete, 
                                   after delete) {
    
    TriggerDispatcher.run( new ContactTriggerHandler() , Trigger.OperationType );
    
}
    
    
    /*
    if(Trigger.IsAfter){
        List<Contact> newcontactList = new List<Contact>();
        Set<Id> accountIdsSet = new  Set<Id>();
        if(Trigger.IsDelete) {
            newcontactList = Trigger.old;
        }else{
            newcontactList = Trigger.new;
        }
        
        /*
* To Hold List of Account Id where AccountID is not null for the individual contact
* Hence using Set with Id
*/
    /*
        for(Contact con : newcontactList){
            if(con.AccountId!=null)  {
                accountIdsSet.add(con.AccountId);
            }
            if(Trigger.IsUpdate){
                Contact oldcontact = (Contact)Trigger.oldMap.get(con.Id);
                if(oldcontact.AccountId!=con.AccountId){
                    accountIdsSet.add(oldcontact.AccountId);
                }
                
            }
        }
      */
        /*
* SOQL to get Account and its related contacts 
*/
        
        /*Solution 1
        List<Account> queriedAccountList = [SELECT Id,Name,No_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN: accountIdsSet];
        
        for(Account acc : queriedAccountList){
            List<Contact> relatedContact = acc.Contacts;
            if(relatedContact!=null){
                acc.No_Of_Contacts__c = relatedContact.size();  
            }
            else{
                acc.No_Of_Contacts__c = 0;  
            }
        }
        
        Update queriedAccountList;
        */
        
        /*Solution 2
       List<Account> accountList = new List<Account>();
       List<AggregateResult> agrResult =[SELECT AccountId,Count(Id) FROM Contact WHERE AccountId IN:accountIdsSet
                                  GROUP BY AccountId];
        if(agrResult!=null){
            for(AggregateResult agr : agrResult){
                Id accountId = (Id)agr.get('AccountId');
                Decimal Count = (Decimal)agr.get('expr0'); // Other way - use alias beside aggregate function and call it in get func
                
               // system.debug('accountid' +accountId );
                Account acc = new Account(Id=accountId,No_Of_Contacts__c=Count);
                accountList.add(acc);
                
                if(accountIdsSet.contains(accountId)){
                    accountIdsSet.remove(accountId);
                }
            }
            for(Id accid :accountIdsSet ){
                 Account acc = new Account(Id=accid,No_Of_Contacts__c=0);
                accountList.add(acc);
            }
        }
        Update accountList;
        
      */
       
       /* Solution 3 */
       /* 
        Map<Id,Account> accountMap = new Map<Id,Account>();
        List<Contact> contactList = [Select Id,Name,AccountId from Contact where Id IN :accountIdsSet];
        
        
        for(contact con :contactList){
            if(!accountMap.containskey(con.AccountId)){
                accountMap.put(con.AccountId, new Account (Id=con.AccountId,No_Of_Contacts__c=1));
            }else{
                Account tempAccount = accountMap.get(con.AccountId);
                tempAccount.No_Of_Contacts__c+=1;
                accountMap.put(con.AccountId, tempAccount); 
            }
        }
        
        Update accountMap.values();
        */
    
    
    //Checkduplicate
    /* Set<String> newEmailSet = new Set<String>();
        Set<String> existingEmailSet = new Set<String>();
      if (Trigger.isBefore && ( Trigger.isInsert || Trigger.isUpdate )) {
            contactList = Trigger.New;
        } 
        if ( Trigger.IsAfter && Trigger.isUndelete ) {
            contactList = Trigger.New;
        }
        for ( Contact con : contactList ) {
            if ( con.Email != null ) {
                newEmailSet.add( con.Email );
            }
        }
        List<Contact> existingContactList = [Select Id, Email From Contact 
                                             Where Email IN: newEmailSet];
        for (Contact con : existingContactList ) {
            existingEmailSet.add( con.Email );
        }
        
        for ( Contact con : contactList ) { 
            if ( existingEmailSet.contains( con.Email ) ) {
                con.Email.AddError('Duplicate Email is not Allowed ');
            } else {
                existingEmailSet.add(con.Email);
            }
        }
    }
}
*/
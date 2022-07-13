public class ContactTriggerHandler implements TriggerInterface {
    
    public static void beforeInsert(List<sObject> newRecordsList){
        
        
        ContactTriggerHelper.checkDuplicate ((List<Contact>)newRecordsList);
        List<Contact> contactList = (List<Contact>)newRecordsList;
        
        Map<String,Account> AccountMap = new Map<String,Account>();
        
        for(contact con:contactList)
        {
            if(con.AccountId==null)
            {
                Account Acc= new Account();
                Acc.Name=con.Email;
                AccountMap.put(con.Email, acc);
            }
        }
        
        insert AccountMap.values();
        
        
        for(contact con:contactList)
        {    
            if(con.AccountId==null && AccountMap.containskey(con.Email))
                
            {
                
                Account acc = AccountMap.get(con.Email);
                system.debug(acc);
                con.AccountId = acc.Id;
            }
        }
        /*
for(contact con:contactList){
if(con.Phone!=null){
VerifyPhoneNumbers.sobjectasParam(JSON.serialize(Con));
//VerifyPhoneNumbers.doFuture(con.Id);
}
}*/
    }
    
    public static void afterInsert(List<sObject> newRecordsList , Map<Id, sObject> newRecordsMap){
        List<Contact> contactList = (List<Contact>)newRecordsList; //TypeCast
        ContactTriggerHelper.updateCount(contactList);
    }
    
    public static void beforeUpdate(Map<Id, sObject> newRecordsMap, Map<Id, sObject> oldRecordsMap){
        
        List<Contact> contactList = (List<Contact>)newRecordsMap.values();
        for (Contact con : contactList) {
            Contact oldContact = (Contact)oldRecordsMap.get(con.Id);
            if ( oldContact.Email != con.Email ) {
                ContactTriggerHelper.checkDuplicate (contactList);
            }
        }
            
            /*List<Contact> contactList = (List<Contact>)newRecordsMap.values();
for(contact con:contactList){
if(con.Phone!=null){
VerifyPhoneNumbers.doFuture(con.Id);
}
}*/
        }
        
        public static void afterUpdate(Map<Id, sObject> newRecordsMap,  Map<Id, sObject> oldRecordsMap){
            List<Contact> contactList = new List<Contact>();
            List<Contact> existingRecors = (List<Contact>)newRecordsMap.values();
            for (Contact con : existingRecors ) {
                Contact oldContact = (Contact)oldRecordsMap.get(con.Id);
                if ( oldContact.AccountId != con.AccountId ) {
                    contactList.add(con);
                }
            }
            ContactTriggerHelper.updateCount(contactList);
        }
        public static void beforeDelete(List<sObject> oldRecordsList , Map<Id, sObject> oldRecordsMap){
            
        }
        
        public static void afterDelete(Map<Id, sObject> oldRecordsMap){
            List<Contact> contactList = (List<Contact>)oldRecordsMap.values();
            ContactTriggerHelper.updateCount(contactList);
        }
        
        public static void afterUnDelete(List<sObject> newRecordsList , Map<Id, sObject> newRecordsMap) {
            List<Contact> contactList = (List<Contact>)newRecordsList;
            ContactTriggerHelper.updateCount(contactList);
            ContactTriggerHelper.checkDuplicate (contactList);
        }
    }
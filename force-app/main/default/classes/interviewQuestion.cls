public class interviewQuestion {
  //@AuraEnabled
    public List<Account> getDetails(){
        
       List<Account> Account1 = ([SELECT Id, Name, (SELECT Id,Name FROM Contacts)
                    FROM Account]);
        
        system.debug(Account1);
        
        return Account1;

    }
    
    
}
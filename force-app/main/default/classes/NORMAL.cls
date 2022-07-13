public class NORMAL {
    
    public void info(){

        
        system.debug(UserInfo.getName());
    /*
        Map<Id,Account> accMap = new Map<Id,Account>([Select Id,Name, (Select Id, FirstName,Phone From Contacts) From Account]);
 		 Set<Id> KeyID = accMap.keyset();
        for(Id rid:KeyID){
            system.debug('Account Name'+ ' ' +accMap.get(rid).Name);
             for(contact c: accMap.get(rid).contacts){
                   System.debug(c.FirstName+ ' '+c.Phone);
        }
        }
        
      */  
         List<Account> Accountlist = new List<Account>([Select Id,Name, (Select Id, FirstName,Phone From Contacts) From Account]);
        
        //system.debug(Accountlist.Name);
        
        for(Account a:Accountlist){
            system.debug('Account Name'+ ' ' +a.Name);
             for(contact c1: a.contacts){
                   System.debug(c1.FirstName+ ' '+c1.Phone);
        }
        }
        
     

       // List<Contact> contactlist = new List<Contact>([Select Id,Name,Account.Name From Contact]);
        
      //  system.debug(contactlist[0].Account.Name);
     
/*
 * 
 *  // system.debug(accMap);
        
 		//system.debug(accMap.get('0015g00000NU9XxAAL').Phone);
   

         // List<Contact> contactlist = new List<Contact> ();
         List<Account> accList = new List<Account>([Select Id, Phone, (Select Id, FirstName,Phone From Contacts) From Account where Id ='0015g00000NU9Y0AAL']);
        
        for(Account a : accList){
            
            for(Contact c1 : a.Contacts){
                system.debug(c1.FirstName);
            }
        }
        
   */

            
            /*
        List<String> LName = new List<String>{'AMAZON','TAD'};
    System.debug(LName);
    
    Account NewID = [Select Id from Account where Name = : LName Limit 1];
     System.debug(NewID.Id); 
*/
        
    }

}
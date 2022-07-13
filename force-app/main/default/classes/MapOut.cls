public class MapOut {
    public void method1(){
    Map<Id, Account> accts = new Map<Id, Account>([Select Id, Phone,(Select Id,FirstName from contacts) from Account where id = '0015g00000gYo9mAAC']);
    system.debug(accts);
        system.debug(accts.get('0015g00000gYo9mAAC'));
        
        system.debug(accts.get('0015g00000gYo9mAAC').contacts.size());
        system.debug(accts.get('0015g00000gYo9mAAC').Phone);
        
        
    }
    
}
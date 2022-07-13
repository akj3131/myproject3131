public class MixedDMLFuture {
    
    public static void useFutureMethod(){
        Account acc= new Account(Name='Acme');
        insert acc;
        Util.insertwithrole('acme','ac','email@email.com','jain');
           
    }
       
    public static void usenoFutureMethod(){
        Account acc= new Account(Name='Acme');
        insert acc;
        Util.insertwithnorole('acme','ac','email@email.com','jain');
           
    }

}
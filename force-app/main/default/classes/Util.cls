public class Util {
    
    public static void insertwithrole(String uname, String al, String em, String lname){
         Profile p = [Select Id from Profile where Name ='Standard User'];
        UserRole r = [Select Id from UserRole where Name ='COO'];
        User u = new User(alias=al,email=em,
                         emailencodingkey='UTF-8', lastname=lname,
                         languagelocalekey='en_US',
                         localesidkey='en_US',profileid=p.Id,userroleid=r.Id,
                         timezonesidkey='America/Los_Angeles',username=uname);
        insert u;
    }
    
       public static void insertwithnorole(String uname, String al, String em, String lname){
         Profile p = [Select Id from Profile where Name ='Standard User'];
      
        User u = new User(alias=al,email=em,
                         emailencodingkey='UTF-8', lastname=lname,
                         languagelocalekey='en_US',
                         localesidkey='en_US',profileid=p.Id,
                         timezonesidkey='America/Los_Angeles',username=uname);
        insert u;
    }

}
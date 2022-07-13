@IsTest
public class TestUtility {

    Public static Account prepareAccount(String Name){
        Account acc = new Account(Name=Name,Description='Account with Setup method',
                                 Phone='9876543210',Fax='136900');
        return acc;
    }
    
    Public static List<Account> prepareAccount(String Name,Integer no){
        List<Account> accountList = new List<Account>();
        for(Integer i=0; i<no;i++){
        Account acc = new Account(Name=Name+' '+String.valueOf(i),Description='Account with Setup method');
        accountList.add(acc);
    }
        return accountList;
    }
    Public static Contact prepareContact(String AccountId, String FirstName,String LastName,String Email){
        Contact con = new Contact(AccountId=AccountId,FirstName=FirstName,LastName=LastName,Email=Email);
        return con;
    }
    
    Public static List<Contact> prepareContact(String AccountId, String FirstName,String LastName,Integer No){
        List<Contact> ContactList = new List<Contact>();
        for(Integer i=0; i<no;i++){
        Contact con = new Contact(AccountId=AccountId,FirstName=FirstName,LastName=LastName+' '+String.valueOf(i),Email=
                                  'AKJ3131-'+i+'@gmail.com');
        ContactList.add(con);
    }
        return ContactList;
    }
}
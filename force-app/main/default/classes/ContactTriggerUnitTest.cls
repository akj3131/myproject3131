@IsTest
public class ContactTriggerUnitTest {
    
    
    @TestSetup
    Public static void testdata(){
        Account acc = new Account(Name='Account 3131',Description='Account from setup method');
        insert acc;
        Account acc1 = new Account(Name='Account 3132 update',Description='Account from setup method 2');
        insert acc1;
        Contact con = new Contact(FirstName='King',LastName='3131',AccountId= acc.Id, Email='3131@3131.com');
        insert con;
        Contact con1 = new Contact(FirstName='King',LastName='3131', Email='3132@3131.com');
        insert con1;
        Contact con2 = new Contact(FirstName='King',LastName='3132',AccountId= acc.Id, Email='3141@3131.com');
        insert con2;
    }

    
    // as we are inserting data in test setup method, trigger will be executed automatically
    /*
public static testmethod void beforeInsert(){

}
public static testmethod void afterInsert(){

}
*/
    
    public static testmethod void beforeUpdate(){ 
        
        Contact con = [Select Id,Name,Phone,Email From Contact where Email='3131@3131.com'];
        con.Phone = '9494643131';
        Con.Email = '3132@3131.com';
        Test.startTest();
        Update con;
        Test.stopTest();
    }
    public static testmethod void afterUpdate(){ 
        Account acc = [Select Id,Name From Account where Name='Account 3132 update'];
       Contact con = [Select Id,Name,Phone,Email From Contact where Email='3131@3131.com'];
        con.AccountId = acc.Id;
        Test.startTest();
        Update con;
        Account accUpdated = [Select Id,Name,No_Of_Contacts__c From Account where Name='Account 3132 update'];
        System.assertEquals(1, accUpdated.No_Of_Contacts__c);
        Test.stopTest();
    }
    public static testmethod void beforeDelete(){ 
    }
    public static testmethod void afterDelete(){ 
        Contact con = [Select Id,Name,Phone,Email From Contact where Email='3131@3131.com'];
        Test.startTest();
        delete con;
        Account acc = [Select Id,Name,No_Of_Contacts__c From Account where Name='Account 3131'];
        // System.assertEquals(0, acc.No_Of_Contacts__c);
        Test.stopTest();
        
    }
    public static testmethod void afterUnDelete(){ 
       Contact con = [Select Id,Name,Phone,Email From Contact where Email='3131@3131.com'];
        delete con;
        Test.startTest();
        try{
            undelete con;
        }catch(System.Exception ex){
            
        }
        
        Test.stopTest();
         
    }
    
}
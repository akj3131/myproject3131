@IsTest
public class ContactBatchUnitTest {

    @TestSetup
    public static void setupData(){
        Account acc = TestUtility.prepareAccount('James');
        insert acc;
        
        List<Contact> contactList = TestUtility.prepareContact(acc.Id, 'Lebron', 'James', 50);
        insert contactList;
    }
    
    public static testmethod void batchContactTest(){
        Test.startTest();
        Id batchId = Database.executeBatch(new ContactBatch(), 55);        
        Test.stopTest();
    }
}
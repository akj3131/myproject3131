@IsTest
public class VerifyPhoneNumbersUnitTest {

    @TestSetup
    public static void setupData(){
        Account acc = TestUtility.prepareAccount('verifyNum');
        insert acc;
        Contact con = TestUtility.prepareContact(acc.Id, 'FirstName', 'LastName', 'verifyNum@gmail.com');
        insert con;
    }
    
    public static testmethod void doFutureTest(){
        Contact con = [Select Id,Name From Contact LIMIT 1];
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new VerifyPhoneNumbersMock());
        VerifyPhoneNumbers.doFuture(con.Id);
        Test.stopTest();
    }
       public static testmethod void sobjectasParamTest(){
        Contact con = [Select Id,Name From Contact LIMIT 1];
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new VerifyPhoneNumbersMock());
        VerifyPhoneNumbers.sobjectasParam(JSON.serialize(con));
        Test.stopTest();
       }
     public static testmethod void errorTest(){
        Contact con = [Select Id,Name From Contact LIMIT 1];
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new VerifyPhoneNumbersErrorMock());
        VerifyPhoneNumbers.doFuture(con.Id);
        Test.stopTest();
    }
    
}
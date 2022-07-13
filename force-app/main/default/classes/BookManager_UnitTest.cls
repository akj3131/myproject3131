@isTest
public class BookManager_UnitTest {
 
    @isTest
    public static void unitTest_PostMethod(){
        RestRequest request = new RestRequest();
        request.requestURI = '/services/apexrest/v1/BookManagement/';
        request.httpMethod = 'POST';
        
        request.addHeader('Content-Type', 'application/json');
		request.addHeader('Accept', 'application/json');        
        
        BookManager.BooksInfo bInfo = new BookManager.BooksInfo();
        bInfo.wrpbook = new Book__c(Name='test name', Price__c=145);
        String requestBody = JSON.serialize(bInfo);
       // System.debug(requestBody);
        
        request.requestBody = Blob.valueOf(requestBody);
        
        Test.startTest();
        Book__c book = BookManager.doCreateBook(bInfo);
        System.assertEquals('test name', book.Name);
        Test.stopTest();
    }
}
@RestResource(urlMapping='/v1/BookManagement/')
global class BookManager {

   /*services/apexrest/v1/BookManagement/?Id=a055g000002JEniAAG */
    @httpGet
    global static Book__c doGetBook(){
        Book__c book = new Book__c();
        Map<String, String> paramsMap = RestContext.request.params;
        String bookId = paramsMap.get('Id');
        book = [Select Id,Name, Price__c From Book__c where Id= :bookID];
        return book;     
    }
    
     @httpDelete
    global static String doDeleteBook(){
        Book__c book = new Book__c();
        Map<String, String> paramsMap = RestContext.request.params;
        String bookId = paramsMap.get('Id');
        book = [Select Id,Name, Price__c From Book__c where Id= :bookID];
        delete book;
        return 'Record Deleted';     
    }
    
    /* 
Json format: 
    {
 		"Name" : "Program of Apex"
	}
*/

/*
XML format:
    <request>
 	<Name>Half Girl Friend </Name>
 	<price>133.00</price>
	</request>
*/ 

/*
    @httpPost
    global static Book__c doCreateBook(String Name, Decimal price){
        Book__c book = new Book__c(Name = Name, Price__c = price);
        insert book;
        return book;     
    }
*/
    
/*wrapclass deserialise
 <request>
  <bookInfo> -- object of wrapclass
    <wrpbook> -- variable of wrapclass
       <Name>God Father</Name>
       <Price__c>198.00</Price__c>
       </wrpbook>
  </bookInfo>
</request>
*/
    
        
/* 
Json format: 
{
 "bookinfo" :{
	"book" :{
		"Name" :"god father"
		}
	}
}
*/
     @httpPost
    global static Book__c doCreateBook(BooksInfo bookInfo){
        Book__c book = bookinfo.wrpbook;
        insert book;
        return book;
        
    }
      @httpPut
    global static Book__c doUpdateBook(String Name){
        Map<String, String> paramsMap = RestContext.request.params;
        String bookId = paramsMap.get('Id');
        Book__c book = new Book__c(Name = Name, Id=bookId);
        update book;
        return book;     
    }

  
    global class BooksInfo{
     global  Book__c wrpbook {get;set;}
    }    
}
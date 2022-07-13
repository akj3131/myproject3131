public class VerifyPhoneNumbers {
    
      
 
    @future(callout=true)
    public static void doFuture(Id recordId){
      contact con = [select Id, Name, Phone, Phone_Status__c from contact where id=:recordId];
        verifyNum(con,'Phone');
       }
    
    /*
     * In order to pass sobject as an paramter
     * -JSON.serailise -String
     * -Inside future mthod - JSON.deserailise 
     * 
     */
    
    @future(callout=true)
    public static void sobjectasParam(String SobjectData){
        
      contact con = (contact)JSON.deserialize(SobjectData, contact.class);
        System.debug('### contactdebug'+ con);
        verifyNum(con,'Phone');
       }
    
   
    
    
    Public static String verifyNum(Sobject Sobj, String PhoneField){
        String  endPointURL = System.Label.VerifyNumUrl+System.Label.VerifyNumAPI;
        // https://api.apilayer.com/number_verification/validate?apikey=7do5T4y630vdpZkDAvNTSDMgR9QuAbLW
        // &number=9494643131&country_code=IN&format=1
        
        /*
        String Query = 'Select Id' +','+ PhoneField+','+StatusField+' From '+objectName+' where Id =:recordId';
        System.debug('####Query'+Query);
        
        Sobject Sobj = Database.query(Query);
        */
        String PhoneNo = (string)Sobj.get(PhoneField);
        System.debug('####PhoneNo'+PhoneNo);
        
        
        endPointURL += '&number='+ PhoneNo+'&country_code=IN&format=1';
        
        
        HttpRequest httpReq = new HttpRequest();
        httpReq.setEndpoint(endPointURL);
        httpReq.setMethod('GET');
        httpReq.setHeader('Content-Type', 'application/json');
        
        Http http = new Http();
        HttpResponse resp = new HttpResponse();
        
        
        try{
            resp= http.send(httpReq)   ;
            if(resp.getStatusCode() == 200){
                String response = resp.getBody();
                System.debug(response);
                return response;
            }else{
                String response = resp.getBody();
                System.debug(response);
                return response;
            }
            
            
        }catch(System.CalloutException ex){
           System.debug('####exceptions'+ ex); 
        }
        
            
         return null;
    }
}
public class VerifyPhoneNumbersBatch implements Database.Batchable<sObject>, Database.AllowsCallouts{
    public String objectName;
    public String PhoneField;
    public String StatusField;
    
    public VerifyPhoneNumbersBatch(String objectName, String PhoneField,String StatusField){
        this.objectName = objectName;
        this.PhoneField = PhoneField;
        this.StatusField = StatusField;
        
    }
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        String Query = 'Select Id' +','+ PhoneField+','+StatusField+' From '+objectName;
        
        return Database.getQueryLocator(Query);
        
    }
    public void execute(Database.BatchableContext bc, List<Sobject> scope){
        Integer size = scope.size();
        for(Integer i=0; i<size; i++){
            String recordId= (String)scope.get(i).get('Id');
            String response = VerifyPhoneNumbers.verifyNum(scope.get(i), PhoneField);
            scope.get(i).put(StatusField, response);
            
        }
        Update scope;
    }
    public void finish(Database.BatchableContext bc){
        
        
    }
    
    
    
}
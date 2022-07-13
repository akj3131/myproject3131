public class BeerSearchAuraService {
   @AuraEnabled
    public static List<sObject> searchBeer(String searchParam){
        String likeParam = '%'+searchParam+'%';
        String Query;
        if(searchParam!=null){
         Query  = 'Select Id,Name,Alochol__c,brewery_id__c,	brewery_Name__c,	Id__c,Price__c,Remaining_Quantity__c,Tags__c,Total_Quantity__c from Beer__c where Name like : likeParam LIMIT 50';
        }else{
              Query  = 'Select Id,Name,Alochol__c,brewery_id__c,	brewery_Name__c,	Id__c,Price__c,Remaining_Quantity__c,Tags__c,Total_Quantity__c from Beer__c LIMIT 50';
        }
        List<sObject> sObjectList = Database.query(Query);
            return sObjectList;
    }

}
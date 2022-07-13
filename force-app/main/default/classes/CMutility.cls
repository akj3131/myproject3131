public class CMutility {
    
    
    public static void before(){
        List<Items__mdt> listdata =  [SELECT Id, DeveloperName, MasterLabel, Language, 
                                      NamespacePrefix, Label, QualifiedApiName, Brand__c FROM Items__mdt];
        System.debug(listdata);
    }
    
    
    public static void getalltest(){
        Map<String,Items__mdt> datalist = Items__mdt.getAll();
        System.debug(datalist);
    }
    
     public static void getInstance(String recordId){
        Items__mdt record = Items__mdt.getInstance(recordId);
        System.debug(record);
    }
    
     public static void getInstanceByLabel(String label){
        Items__mdt record = Items__mdt.getInstance(label);
        System.debug(record);
    }
    
    public static void name(){
        System.debug("hello");
    }
    
    
}
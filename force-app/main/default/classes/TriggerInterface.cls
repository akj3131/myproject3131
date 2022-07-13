public interface TriggerInterface {
    
    void beforeInsert(List<sObject> newRecordsList);  //New

    void afterInsert(List<sObject> newRecordsList , Map<Id, sObject> newRecordsMap); //New and NewMap

    void beforeUpdate(Map<Id, sObject> newRecordsMap, Map<Id, sObject> oldRecordsMap); // New and NewMap; Old and OldMap
    																					// Map.values - Sobject

    void afterUpdate(Map<Id, sObject> newRecordsMap,  Map<Id, sObject> oldRecordsMap); // New and NewMap; Old and OldMap
          
    void beforeDelete(List<sObject> oldRecordsList , Map<Id, sObject> oldRecordsMap); //old and oldMap

    void afterDelete(Map<Id, sObject> oldRecordsMap); //old and oldMap
    
    void afterUnDelete(List<sObject> newRecordsList , Map<Id, sObject> newRecordsMap); //New and NewMap
    
}
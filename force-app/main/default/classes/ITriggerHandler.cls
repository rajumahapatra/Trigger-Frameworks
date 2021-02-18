// trigger framework using interface
// sObjectTriggerHandlers implement these methods and provide the defination
public interface ITriggerHandler {
    void beforeInsert(List<sObject> newRecords);
    void beforeUpdate(Map<Id, sObject> newRecordsMap, Map<Id, sObject> oldRecordsMap);
    void beforeDelete(Map<Id, sObject> oldRecordsMap);
    void afterInsert(Map<Id, sObject> newRecords);
    void afterUpdate(Map<Id, sObject> newRecordsMap, Map<Id, sObject> oldRecordMap);
    void afterDelete(Map<Id, sObject> oldRecordsMap);
    void afterUndelete(Map<Id, sObject> newRecordsMap);
}

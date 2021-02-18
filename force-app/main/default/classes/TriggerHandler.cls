public virtual inherited sharing class TriggerHandler {
    
    public void run() {
        System.debug('In TriggerHandler.run method');
        if(Trigger.isBefore) {
            if(Trigger.isInsert) BeforeInsertHandler(Trigger.new);
            if(Trigger.isUpdate) BeforeUpdateHandler(Trigger.newMap, Trigger.oldMap);
            if(Trigger.isDelete) BeforeDeleteHandler(Trigger.oldMap);
        }
        if(Trigger.isAfter) {
            if(Trigger.isInsert) AfterInsertHandler(Trigger.new);
            if(Trigger.isUpdate) AfterUpdateHandler(Trigger.oldMap, Trigger.newMap);
            if(Trigger.isDelete) AfterDeleteHandler(Trigger.oldMap);
            if(Trigger.isUndelete) AfterUndeleteHandler(Trigger.new);
        }
    }

    protected virtual void BeforeInsertHandler(List<sObject> newRecords) {}
    protected virtual void BeforeUpdateHandler(Map<Id, sObject> newRecordsMap, Map<Id, sObject> oldRecordsMap) {}
    protected virtual void BeforeDeleteHandler(Map<Id, sObject> oldRecordsMap) {}
    protected virtual void AfterInsertHandler(List<sObject> newRecords) {}
    protected virtual void AfterUpdateHandler(Map<Id, sObject> newRecordsMap, Map<Id, sObject> oldRecordsMap) {}
    protected virtual void AfterDeleteHandler(Map<Id, sObject> oldRecordsMap) {}
    protected virtual void AfterUndeleteHandler(List<sObject> newRecords) {}

}

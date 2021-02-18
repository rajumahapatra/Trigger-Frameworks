public class AccountTriggerHandler extends TriggerHandler implements ITriggerHandler{
    
    /******************* TRIGGER FRAMEWORK USING VIRTUAL ***********************/
    // override methods of TriggerHandler to hadle the database events
    public override void BeforeInsertHandler(List<sObject> newRecords) {
        System.debug('In AccountBeforeInsertHandler');
        List<Account> accountsInContext = (List<Account>) newRecords;
        System.debug('accountsInContext: ' + accountsInContext);
    }
    /****************************************************************************/

    
    /***************************** TRIGGER FRAMEWORK USING INTERFACE *******************************/
    // give a defination to all the methods of the interface ITriggerHandler
    public void beforeInsert(List<sObject> newRecords) {
        System.debug('In AccountBeforeInsertHandler');
        List<Account> newAccounts = (List<Account>) newRecords;
        System.debug('newAccounts: ' + newAccounts);
    }
    
    public void beforeUpdate(Map<Id, sObject> newRecordsMap, Map<Id, sObject> oldRecordsMap) {

    }

    public void beforeDelete(Map<Id, sObject> oldRecordsMap) { 

    }

    public void afterInsert(Map<Id, sObject> newRecords) { 

    }

    public void afterUpdate(Map<Id, sObject> newRecordsMap, Map<Id, sObject> oldRecordMap) { 

    }

    public void afterDelete(Map<Id, sObject> oldRecordsMap) { 

    }

    public void afterUndelete(Map<Id, sObject> newRecordsMap) { 

    }
    /**********************************************************************************************/

}
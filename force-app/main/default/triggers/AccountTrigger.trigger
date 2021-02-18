trigger AccountTrigger on Account(before insert) 
{
    System.debug('Account Triggers Starts'); 
    (new AccountTriggerHandler()).run();

    TriggerDispatcher.run(new AccountTriggerHandler());
    
    /* if(trigger.isBefore) 
    {
        if(trigger.isInsert) 
        {
            //AccountTriggerHandler.preventDuplicateAccount(trigger.new, null);
        }
        if(trigger.isUpdate) 
        {
            //AccountTriggerHandler.preventDuplicateAccount(trigger.new, trigger.old);
            
        }
        if(trigger.isInsert || trigger.isUpdate) 
        {
            AccountTriggerHandler.updateHelloWithWorld(trigger.new);
        }
        if(trigger.isInsert) 
        {
            //AccountTriggerHandler.CreateAccounts(trigger.new);
        }
        if(trigger.isDelete) 
        {
            AccountTriggerHandler.preventDeletion(trigger.old);
        }
    }
    if(trigger.isAfter) {
        if(trigger.isInsert)
        {
            //AccountTriggerHandler.createContacts(trigger.new);
            AccountTriggerHandler.updateSalesRep(trigger.new);
        }
        if(trigger.isUpdate)
        {
            AccountTriggerHandler.updatePhoneFromPrimaryContact(trigger.new);
        }
    } */
    System.debug('Account Triggers Ends'); 
}
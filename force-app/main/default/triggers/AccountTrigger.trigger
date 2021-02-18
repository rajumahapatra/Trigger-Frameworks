trigger AccountTrigger on Account(before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    System.debug('Account Triggers Starts'); 
    
    // trigger framework using virtual method
    (new AccountTriggerHandler()).run();

    // trigger framework using interface
    TriggerDispatcher.run(new AccountTriggerHandler());
    
    System.debug('Account Triggers Ends'); 
}
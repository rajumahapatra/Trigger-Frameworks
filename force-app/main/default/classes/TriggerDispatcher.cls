public inherited sharing class TriggerDispatcher {
    
    public static void run(ITriggerHandler handler) {
        if(Trigger.isBefore) {
            if(Trigger.isInsert) {
                handler.beforeInsert(Trigger.New);
            }
        }
    }

}

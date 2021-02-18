public class AccountTriggerHandler extends TriggerHandler implements ITriggerHandler{
    
    public override void BeforeInsertHandler(List<sObject> newRecords) {
        System.debug('In AccountBeforeInsertHandler');
        List<Account> accountsInContext = (List<Account>) newRecords;
        System.debug('accountsInContext: ' + accountsInContext);
    }

    public void beforeInsert(List<sObject> newRecords) {
        System.debug('In AccountBeforeInsertHandler');
        List<Account> newAccounts = (List<Account>) newRecords;
        System.debug('newAccounts: ' + newAccounts);
    }
    public void beforeUpdate(Map<Id, sObject> newRecordsMap, Map<Id, sObject> oldRecordsMap) { }
    public void beforeDelete(Map<Id, sObject> oldRecordsMap) { }
    public void afterInsert(Map<Id, sObject> newRecords) { }
    public void afterUpdate(Map<Id, sObject> newRecordsMap, Map<Id, sObject> oldRecordMap) { }
    public void afterDelete(Map<Id, sObject> oldRecordsMap) { }
    public void afterUndelete(Map<Id, sObject> newRecordsMap) { }

    //Sets the Shipping State to Billing State of Account
    public static void CreateAccounts(List<Account> listOfAccount)
    {
        for(Account a : listOfAccount)
        {
            if(a.BillingState != NULL && a.ShippingState == NULL)
            {
                a.ShippingState = a.BillingState;
            }
        }
    }
    
    //prevents user from creating duplicate Accounts considering only the Account name
    //invoked in the events before insert and before update
    /**********************************************************************************************
    public static void preventDuplicateAccount(List<Account> newAccounts, List<Account> oldAccounts) 
    {
        if(oldAccounts == NULL) 
        {
            List<String> accountNames = new List<String>();
            for(Account a : newAccounts) 
            {
                accountNames.add(a.Name);
            }
            List<Account> existingAccounts = new List<Account>([SELECT Id, Name FROM Account WHERE Name IN : accountNames]);
            if(existingAccounts.size() > 0) 
            {
                newAccounts[0].Name.addError('Account name already exists');
            }
        }
        else
        {
            List<String> oldAccountsNames = new List<String>();
            List<String> newAccountsNames = new List<String>();
            for(Account a : oldAccounts) 
            {
                oldAccountsNames.add(a.Name);
            }
            for(Account a : newAccounts) 
            {
                newAccountsNames.add(a.Name);
            }
            List<Account> existingAccounts = new List<Account>([SELECT Id, Name FROM Account WHERE Name IN : newAccountsNames]);
            if(existingAccounts.size() > 0) 
            {
                for(String a : newAccountsNames) 
                {
                    for(String b : oldAccountsNames) 
                    {
                        if(a == b) 
                        {
                            break;
                        } else 
                        {
                            newAccounts[0].Name.addError('Account name already exists');
                        }
                    }  
                }
        
            }
        }
    }
    ****************************************************************************************************************************/
    
    //Updates 'Hello' field with the value 'World'
    public static void updateHelloWithWorld(List<Account> accountsToUpdate) {
        for(Account a : accountsToUpdate) {
            if(a.Hello__c != 'World') {
                a.Hello__c = 'World';
            }
        }
    }
    
    //Prevent users from deleting Accounts
    //invoked on before delete
    public static void preventDeletion(List<Account> listOfAccounts)
    {
        for(Account a : listOfAccounts)
        {
            a.addError('You can not delete an Account');
        }
    }
    
    //creates same number of Contacts as Number Of Locations in Account
    /*public static void createContacts (List<Account> listOfAccounts)
    {
        List<Contact> listOfContacts = new List<Contact>();
        for(Account a : [SELECT Id, NumberofLocations__c FROM Account WHERE Id IN : listOfAccounts])
        {
            Decimal numberOfContacts = a.NumberofLocations__c;
            for(Integer i = 0; i < numberOfContacts; i++)
            {
                Contact c = new Contact(lastName = 'Contact ' + i, AccountId = a.Id);
                listOfContacts.add(c);
            }
        }
        insert listOfContacts;
    }*/
    
    //Updates the Sales Rep field of Account with it's owner
    public static void updateSalesRep(List<Account> listOfAccount)
    {
        List<Id> listOfOwnerId = new List<Id>();
        List<User> listOfUser = new List<User>();
        List<Account> listOfAccount1 = new List<Account>();
        listOfAccount1 = [SELECT Id, OwnerId, Sales_Rep__c FROM Account WHERE Id IN : listOfAccount];
        for(Account a : listOfAccount1)
        {
            listOfOwnerId.add(a.OwnerId);
        }
        listOfUser = [SELECT Id, Name FROM User WHERE Id IN : listOfOwnerId];
        for(Account a : listOfAccount1)
        {
            for(User u : listOfUser)
            {
                if(a.OwnerId == u.Id)
                {
                    a.Sales_Rep__c = u.Name;
                }
            }
        }
        update listOfAccount1;
    }
    
    public static void updatePhoneFromPrimaryContact(List<Account> listOfAccount)
    {
        List<AccountContactRole> ls = new List<AccountContactRole>();
        for(Account a : [SELECT Id, (SELECT Id, ContactId, IsPrimary FROM AccountContactRoles) FROM Account WHERE Id IN : listOfAccount])
        {
            ls = a.AccountContactRoles;
            System.debug('ls');
            if(!(ls.isEmpty()))
            {
                for(AccountContactRole acr : ls)
                {
                    if(acr.IsPrimary == true)
                    {
                        Contact c = new Contact();
                        c = [SELECT Id FROM Contact WHERE Id = :acr.ContactId];
                        if(c.Phone != NULL)
                        {
                            a.Phone = c.Phone;
                        }
                    }
                }
            }
        }
    }
}
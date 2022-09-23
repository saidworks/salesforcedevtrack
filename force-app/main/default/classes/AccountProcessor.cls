public with sharing class AccountProcessor {

    @future
    public static void countContacts(List<String> acctIds){
        List<Account> accts = new List<Account>();
        //The method counts the number of Contact records associated to each Account ID
        // passed to the method and updates the 'Number_Of_Contacts__c' field with this value
        for(Account acct:[SELECT Number_Of_Contacts__c FROM Account WHERE Id in :acctIds]){
            Integer contacts = acct.Contacts.size();
            System.debug(contacts);
            acct.Number_Of_Contacts__c = contacts;
            accts.add(acct);

        }
        update accts;
    }
    // @future
    
    // public static void countContacts(List<ID> accountId){
    //     //this list we have created to bulkified the trigger
    //     List<Account> accountToUpdate = new  List<Account>();
        
    //     //here we have added the account and associacted account to a list via soql
    //     List<Account > accounts = [SELECT id, name, (SELECT ID FROM contacts) from Account where id in :accountId];
    //     //Now ittrate all the account one by one
    //     for(Account acc : accounts){
    //         // contacts from the above list will be here in this list
    //         List<Contact> contactlist = acc.contacts; 
    //         //size of the list in this filed 
    //         acc.Number_of_Contacts__c = contactList.size();
    //         // added to the list = accountToUpdate 
    //         accountToUpdate.add(acc);
    //     }
    //     update accountToUpdate;
    // }
}

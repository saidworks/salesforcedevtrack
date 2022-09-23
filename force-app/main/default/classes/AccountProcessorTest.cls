@IsTest
private class AccountProcessorTest {
    @IsTest
    static void testCountContacts(){
        Account acct = new Account(Name='SaidCorp',Number_Of_Contacts__c =0);
        insert acct;
        Contact ct = new Contact(FirstName='Said',LastName='Apex');
        ct.AccountId = acct.Id;
        insert ct;
        Contact cts = new Contact(FirstName='Said',LastName='Async');
        cts.AccountId = acct.Id;
        insert cts;
        List<String> acctIds = new List<String>();
        acctIds.add(acct.Id);
       
        Test.startTest();
             AccountProcessor.countContacts(acctIds);
        Test.stopTest();
        Account acctTest = [select Number_of_Contacts__c from Account where Id = :acct.Id];
        System.assertEquals ( Integer.valueOf(acctTest.Number_of_Contacts__c) ,2);
    }

}

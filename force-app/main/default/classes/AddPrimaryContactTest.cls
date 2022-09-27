@isTest
public with sharing class AddPrimaryContactTest {
    @TestSetup
    static void setup(){
        List<Account> acctsNY = new List<Account>();
        List<Account> acctsCA = new List<Account>();
        For(Integer i=0;i<50; i++){
            acctsCA.add(new Account(Name='CA Corp' + i,BillingState='CA'));
            acctsNY.add(new Account(Name='NY Corp' + i,BillingState='NY'));
        }
        insert acctsCA;
        insert acctsNY;
    }
    static testmethod void test(){
        Contact ct = new Contact(FirstName='Demo', LastName='Test');
        String state = 'CA';
        AddPrimaryContact job = new AddPrimaryContact(ct,state);
        Test.startTest();
        System.enqueueJob(job);
        Test.stopTest();
        System.assertEquals(50, [SELECT count() FROM Contact 
                                 WHERE AccountId IN (SELECT Id FROM Account WHERE BillingState=:state)]);
    } 
}

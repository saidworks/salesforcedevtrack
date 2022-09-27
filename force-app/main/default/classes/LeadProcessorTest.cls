@isTest
public with sharing class LeadProcessorTest {
   @TestSetup
   static void setup(){
    List<Lead> leads = new List<Lead>();
    for(Integer i=0; i<200; i++){
        Leads.add( new Lead(FirstName = 'Pro'+ i,LastName = 'Pro'+ i,Company='Company' + 1));
    }
    insert leads;
    }
    @isTest static void test(){
        Test.startTest();
        LeadProcessor lProcess = new LeadProcessor();
        Id batchId = Database.executeBatch(lProcess);
        Test.stopTest();
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}

@isTest
public with sharing class UnqualifyLeadTest {
    @TestSetup
    static void setup(){
     List<Lead> leads = new List<Lead>();
       for(Integer i=0; i<10; i++){
         Leads.add( new Lead(FirstName = 'Pro'+ i,LastName = 'Pro'+ i,Company='Company' + 1,Status= 'Open - Not Contacted'));
     }
     insert leads;
     Date today = Date.today();
     Date expired = today - 91;
     for(Lead lead:leads){
         Test.setCreatedDate(lead.id, expired);
     }
     }

     @isTest static void test(){
        Test.startTest();
        UnqualifyLead.unqualify();
        Test.stopTest();
        System.assertEquals(10, [SELECT count() FROM Lead WHERE Status = 'Closed - Not Converted'],'There are 10 unqualified lead');
    }
}

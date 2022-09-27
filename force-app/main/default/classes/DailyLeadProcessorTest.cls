@isTest
private class DailyLeadProcessorTest {
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    // second minutes hour then day then month then year
    public static String CRON_EXP = '0 0 8 26 09 ? 2022';
    @IsTest
    static void testScheduleJob(){
        List<Lead> leads = new List<Lead>();
        for(Integer i=0; i<200; i++){
            leads.add(new Lead(LastName='Test lead' + i,Company = 'Company Test' + i,Status = 'Open - Not Contacted'));
        }
        insert leads;
        Test.startTest();
        String jobId = System.schedule('Update lead Source', CRON_EXP,new DailyLeadProcessor());
        Test.stopTest();
        System.assertEquals(200, [
            SELECT COUNT() FROM Lead
            WHERE LeadSource = 'Dreamforce' 
        ], 'Testing if number of records match');
    }

}

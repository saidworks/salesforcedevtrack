@isTest
public class AccountTriggerTest {
    // @TestSetup
    // static void makeData(){
    //     List<Account> acctsCA = new List<Account>();
    //     For(Integer i=0;i<200; i++){
    //         acctsCA.add(new Account(Name='CA Corp' + i,BillingState='CA'));
    //     }
    //     insert acctsCA;
    // }
    @isTest
    static void createAcctsTest(){
        String state = 'CA';
        List<Account> acctsCA = new List<Account>();
        For(Integer i=0;i<200; i++){
            acctsCA.add(new Account(Name='CA Corp' + i,BillingState='CA'));
        }
        Test.startTest();
        insert acctsCA;
        Test.stopTest();
        System.assertEquals(200,[SELECT COUNT() FROM Account WHERE ShippingState=:state]);
        
    }
}
public with sharing class UnqualifyLead {

    // R024 : If a lead is not converted to an Opportunity after 90 days automatically change the lead status
    // to Unqualified
    public static void unqualify(){
        Date today = Date.today();
        Date expiring = today - 90;
        List<Lead> unqualified = new List<Lead>();
        
        for(Lead l:[SELECT LastTransferDate,Status FROM Lead WHERE Status != 'Closed - Not Converted' AND (LastTransferDate > :expiring) ]){
            l.status = 'Closed - Not Converted';
            unqualified.add(l); 
        }
        update unqualified;
    }

}

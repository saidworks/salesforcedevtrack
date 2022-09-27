public with sharing class LeadProcessor implements Database.Batchable<SObject>, Database.Stateful {
    public Integer counter = 0;
    public LeadProcessor() {

    }
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            'SELECT LeadSource FROM Lead'
        );
    }

    public void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> leadsToUpdate = new List<Lead>();
        for(Lead l:scope){
            l.LeadSource = 'Dreamforce';
            leadsToUpdate.add(l);
            counter++;
           
        }
        update leadsToUpdate;
    }
    public void finish(Database.BatchableContext bc){
        System.debug(counter + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
    }
    
}

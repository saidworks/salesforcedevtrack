global class RemindOpptyOwners implements Schedulable{
    global void execute(SchedulableContext cntxt){
        List<Opportunity> oppList = [SELECT ID, Name, OwnerId, CloseDate FROM Opportunity WHERE 
                                     IsClosed= FALSE AND CloseDate<Today];
        RemindOpportunityOwners.createTaskforOpp(oppList);
    }

}
//execute example 

// RemindOpptyOwners reminder = new RemindOpptyOwners();
// // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
// String sch = '20 30 8 10 2 ?';
// String jobID = System.schedule('Remind Opp Owners', sch, reminder);
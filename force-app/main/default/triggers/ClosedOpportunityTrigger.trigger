trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasks = new List<Task>();

    for(Opportunity opp:Trigger.new){
        if(opp.StageName=='Closed Won' ){
            Task task = new Task(Subject='Follow Up Test Task',WhatId=opp.Id);
            tasks.add(task);
        }
    }
    upsert Tasks;
}
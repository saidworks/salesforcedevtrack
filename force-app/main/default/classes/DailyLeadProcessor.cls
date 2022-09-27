global class DailyLeadProcessor implements Schedulable{
    global static void execute(SchedulableContext sc){
        List<Lead> leads = new List<Lead>();
        for(Lead l:[SELECT Id from Lead WHERE LeadSource='']){
            l.LeadSource='Dreamforce';
            leads.add(l);
        }
        update leads;
    }

}

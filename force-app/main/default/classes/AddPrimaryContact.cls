public with sharing class AddPrimaryContact implements Queueable{
    private Contact contact;
    private String state;
    public AddPrimaryContact(Contact contact,String state) {
            this.contact = contact;
            this.state = state;
    }
    public void execute(QueueableContext context){
        List<Account> accts = [SELECT NAME,BillingState, (Select id,FirstName,LastName from contacts ) FROM Account WHERE BillingState = :this.state LIMIT 200];
        List<Contact> contacts = new List<Contact>();
        for(Account acct:accts){
            Contact ct = this.contact.clone(false,false,false,false);
            ct.AccountId = acct.Id;
            contacts.add(ct);
        }
        insert contacts;
    }
}

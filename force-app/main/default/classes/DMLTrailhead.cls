public with sharing class DMLTrailhead {
    public DMLTrailhead() {
             // Create the account sObject 
        Account acct = new Account(Name='Acme', Phone='(415)555-1212', NumberOfEmployees=100);
        // Insert the account by using DML
        insert acct;

        // Create the account sObject 
        Account acct = new Account(Name='Acme', Phone='(415)555-1212', NumberOfEmployees=100);
        // Insert the account by using DML
        insert acct;
        // Get the new ID on the inserted sObject argument
        ID acctID = acct.Id;
        // Display this ID in the debug log
        System.debug('ID = ' + acctID);
        // Debug log result (the ID will be different in your case)
        // DEBUG|ID = 001D000000JmKkeIAF


        // Create a list of contacts
        List<Contact> conList = new List<Contact> {
            new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
                new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
                new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
                new Contact(FirstName='Kim',LastName='Shain',Department='Education')};
        // Bulk insert all contacts with one DML call
        insert conList;
        // List to hold the new contacts to update
        List<Contact> listToUpdate = new List<Contact>();
        // Iterate through the list and add a title only
        //   if the department is Finance
        for(Contact con : conList) {
            if (con.Department == 'Finance') {
                con.Title = 'Financial analyst';
                // Add updated contact sObject to the list.
                listToUpdate.add(con);
            }
        }
        // Bulk update all contacts with one DML call
        update listToUpdate;

        //upsert 
        // Insert the Josh contact
        Contact josh = new Contact(FirstName='Josh',LastName='Kaplan',Department='Finance');       
        insert josh;
        // Josh's record has been inserted
        //   so the variable josh has now an ID
        //   which will be used to match the records by upsert
        josh.Description = 'Josh\'s record has been updated by the upsert operation.';
        // Create the Kathy contact, but don't persist it in the database
        Contact kathy = new Contact(FirstName='Kathy',LastName='Brown',Department='Technology');
        // List to hold the new contacts to upsert
        List<Contact> contacts = new List<Contact> { josh, kathy };
        // Call upsert
        upsert contacts;
        // Result: Josh is updated and Kathy is created.

        // use different field as identifier
        Contact jane = new Contact(FirstName='Jane',
                         LastName='Smith',
                         Email='jane.smith@example.com',
                         Description='Contact of the day');
        insert jane;
        // 1. Upsert using an idLookup field
        // Create a second sObject variable.
        // This variable doesn’t have any ID set.
        Contact jane2 = new Contact(FirstName='Jane',
                                LastName='Smith',  
                                Email='jane.smith@example.com',
                                Description='Prefers to be contacted by email.');
        // Upsert the contact by using the idLookup field for matching.
        upsert jane2 Contact.fields.Email;
        // Verify that the contact has been updated
        System.assertEquals('Prefers to be contacted by email.',
                        [SELECT Description FROM Contact WHERE Id=:jane.Id].Description);

        //delete 
        Account[] acctDel = [SELECT Id FROM Account WHERE Name='Acme']; 
        delete acctDel;

        try {
            // This causes an exception because 
            //   the required Name field is not provided.
            Account acct = new Account();
            // Insert the account 
            insert acct;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' +
                        e.getMessage());
        }
    }

}

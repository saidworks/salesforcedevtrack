public with sharing class SOQLTrailhead {
    public SOQLTrailhead() {

        // SELECT Name,Phone FROM Account
        //limit the number of acct returned 
        Account oneAccountOnly = [SELECT Name,Phone FROM Account LIMIT 1];

        Account[] accts = [SELECT Name,Phone FROM Account 
                   WHERE (Name='SFDC Computing' AND NumberOfEmployees>25)
                   ORDER BY Name
                   LIMIT 10];
        System.debug(accts.size() + ' account(s) returned.');
        // Write all account array info
        System.debug(accts);


        //Where clause 
        String targetDepartment = 'Wingo';
        Contact[] techContacts = [SELECT FirstName,LastName 
                            FROM Contact WHERE Department=:targetDepartment];

        //query related sobjects example contact from acct
        Account[] acctsWithContacts = [SELECT Name, (SELECT FirstName,LastName FROM Contacts)
                               FROM Account 
                               WHERE Name = 'SFDC Computing'];
        // Get child records
        Contact[] cts = acctsWithContacts[0].Contacts;
        System.debug('Name of first associated contact: ' 
                    + cts[0].FirstName + ', ' + cts[0].LastName);
                    Contact[] cts = [SELECT Account.Name FROM Contact 
                 WHERE FirstName = 'Carol' AND LastName='Ruiz'];
        //child to parent
        Contact carol = cts[0];
        String acctName = carol.Account.Name;
        System.debug('Carol\'s account name is ' + acctName);

        //Query Record in Batches By Using SOQL For Loops
        insert new Account[]{new Account(Name = 'for loop 1'), 
                     new Account(Name = 'for loop 2'), 
                     new Account(Name = 'for loop 3')};
        // The sObject list format executes the for loop once per returned batch
        // of records
        Integer i=0;
        Integer j=0;
        for (Account[] tmp : [SELECT Id FROM Account WHERE Name LIKE 'for loop _']) {
            j = tmp.size();
            i++;
        }
        System.assertEquals(3, j); // The list should have contained the three accounts
                            // named 'yyy'
        System.assertEquals(1, i); // Since a single batch can hold up to 200 records and,
                            // only three records should have been returned, the 
                            // loop should have executed only once

    }
}

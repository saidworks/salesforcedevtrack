public with sharing class ContactAndLeadSearch {
    public ContactAndLeadSearch() {

    }

    public static  List<List< sObject>> searchContactsAndLeads(String pattern){
        List<List<sObject>> searchList = [FIND :pattern IN ALL FIELDS
                                            RETURNING Lead(FirstName,LastName),Contact(FirstName,LastName)];
        return searchList;
    }
}

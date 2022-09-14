public with sharing class ContactSearch {
    public ContactSearch() {

    }
    public static List<Contact>  searchForContacts(String lastName, String postalCode){
            List<Contact> contacts = [SELECT Id,Name FROM Contact
                                    WHERE LastName=:lastName AND MailingPostalCode=:postalCode];

            System.debug(contacts);
            return contacts;

    }
}

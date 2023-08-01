public with sharing class Books4EveryoneHomeController {
    @AuraEnabled
    public static List<Book__c> getBooks(){
        try {
            return [SELECT Id,Name,Description__c
                    FROM Book__c ]; 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Book__c> getBooksAndAuthor(){
        try {
            return [SELECT Name, Description__c, Author__r.Name
                    FROM Book__c];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
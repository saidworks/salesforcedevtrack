public with sharing class Books4EveryoneHomeController {
    /*
        return books 
    */
    @AuraEnabled
    public static List<Book__c> getBooks(){
        try {
            return [SELECT Id,Name,Description__c
                    FROM Book__c ]; 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    /*
        return books with author name
    */
    @AuraEnabled
    public static List<Book__c> getBooksAndAuthor(){
        try {
            return [SELECT Name, Description__c, Author__r.Name
                    FROM Book__c];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Recommendation__c> getBookRecommendations(){
        try {
            return [ SELECT Name, Review__c, Rating__c, Book__r.Name , Book__r.Author__r.Name
                     FROM Recommendation__c
                     WHERE Book__c != null];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Book__c> getBooksWithoutAuthors(){
        try {
            return [ SELECT Name 
                     FROM Book__c
                     WHERE Author__C = null];            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
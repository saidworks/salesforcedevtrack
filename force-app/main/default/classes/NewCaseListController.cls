public with sharing class NewCaseListController {
    // Include a publicly scoped method named getNewCases
    // Use the return type of List<Case>
    // Return a list of case records that includes the ID and CaseNumber fields
    // Filter the results returned to only have a status of New
    public String status = 'New';
    public List<Case> getNewCases(){
        List<Case> newCases = [SELECT Id, CaseNumber FROM Case WHERE Status = :this.status];
        return newCases;
    }
}

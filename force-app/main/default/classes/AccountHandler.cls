public with sharing class AccountHandler {
    public AccountHandler() {

    }

    public static Account insertNewAccount(String Name){
        try{
            Account acct = new Account(Name=Name);
            insert acct;
            return acct;
        }catch(DmlException e){
                System.debug('The name of the account is null'+ e.getMessage());
        }
        return null;
    }
}

public with sharing class GetAccountContactDataController {
	@auraEnabled
    public static List<responseWrapper> getAccountContactData(){
        try{
            List<responseWrapper> responseWrapperList = new List<responseWrapper>();
            List<Account> accountList = [SELECT id,Name , (SELECT Id,Name from contacts) from account LIMIT 10];
            for(Account acc : accountList){
                responseWrapper wrapp= new responseWrapper();
                wrapp.accountName = acc.Name;
                if(acc.Contacts.size()>0)
                	wrapp.contactName = acc.Contacts[0].Name;
                responseWrapperList.add(wrapp);
            }
            return responseWrapperList;
        }catch(Exception ex){
            throw new AuraHandledException(ex.getMessage());
        }
    }
   
    public class responseWrapper{
        @auraEnabled
        public String accountName;
        @auraEnabled
        public String contactName;
        
    }
    
}
public class CreateContactAuraServices {
    @AuraEnabled
public static void createContact(List<Contact> contactList, String accountId){
    for(contact c :contactList){
    c.AccountId = accountId;
    }
        insert contactList;
    }

}
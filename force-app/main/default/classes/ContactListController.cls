public class ContactListController {
@AuraEnabled
    public static List<Contact> getcontact(string accountID){
        return[SELECT id,FirstName,LastName,Phone,Email FROM CONTACT where Email!=null AND AccountID =: accountID ];
    }
    
@AuraEnabled
    public static Contact createContact(Contact con, Id AccountId){
        con.AccountId = AccountId;
        insert con;
        return con;
    }
}
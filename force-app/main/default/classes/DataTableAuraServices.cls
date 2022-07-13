public class DataTableAuraServices {
    @AuraEnabled
    public static List<Account> fetchAccount(){
        return[SELECT Id,Rating,Name,Phone,Industry from ACCOUNT Limit 5];
    }

}
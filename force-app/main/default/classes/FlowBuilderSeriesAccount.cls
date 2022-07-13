public class FlowBuilderSeriesAccount {
    
   /* 
    @InvocableMethod(label='Fetch Account' description='This will return the list of all accounts' category='Account')
    public static List<List<Account>> welcomeMessage(){
        List<List<Account>> allAccounts = new List<List<Account>>();
        allAccounts.add([Select Id,Name From Account LIMIT 10]);
        return allAccounts;
    }
*/
    @InvocableMethod(label='Fetch Account' description='This will return the list of all accounts' category='Account')
    public static List<List<Account>> welcomeMessage(List<List<String>> accountIdsList){
        List<List<Account>> allAccounts = new List<List<Account>>();
        allAccounts.add([Select Id,Name From Account WHERE Id IN: accountIdsList.get(0)]);
        return allAccounts;
    }
    
}
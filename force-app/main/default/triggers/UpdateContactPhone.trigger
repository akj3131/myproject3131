trigger UpdateContactPhone on Account (After Update) {

//Map to hold account records where phone is changed

Map<Id, Account> mapaccount = new Map<Id, Account>();

//List of contacts for selective Account

List<Contact> ContList = new List<Contact>();


for(Account acc : Trigger.new)
{ 
// check if phone# is changed
if(acc.phone!= Trigger.oldMap.get(acc.Id).Phone)
    {
        mapaccount.put(acc.Id, acc);
    }
}

if(mapaccount.size()>0)
{
  ContList = [SELECT phone,AccountId FROM Contact where AccountID IN: mapaccount.keyset()];
}

if(ContList.size()>0)
{
  for(Contact con : ContList )
  {
      con.Phone = mapaccount.get(con.AccountID).phone;
  
  }

Update ContList;

}

}
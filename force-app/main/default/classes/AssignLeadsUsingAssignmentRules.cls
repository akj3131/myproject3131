public class AssignLeadsUsingAssignmentRules {
    
    @InvocableMethod(label='Lead Assignment using Apex' description='Trigger the lead assignment rule' category='Lead')
    public static void LeadAssign(List<Id> LeadIds)
    {
            Database.DMLOptions dmo = new Database.DMLOptions();
            dmo.assignmentRuleHeader.useDefaultRule= true;          
            Lead Leads=[select id from lead where lead.id in :LeadIds];
            Leads.setOptions(dmo);
            update Leads;
            system.debug('Hello1');
   }
    

}
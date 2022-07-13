public class CandidateShareHandler {

    @InvocableMethod(label='Share Candidate' description='Share Candidate')
    public static void shareCandidateRecord(List<CandidateShare> candidateShareList){
        CandidateShare shareInformation = candidateShareList.get(0);
        Candidate__Share newShare = new Candidate__Share();
        newShare.ParentId = shareInformation.CandidateId;
        newShare.UserorGroupId = shareInformation.userId;
        newShare.AccessLevel = shareInformation.AccessLevel;
        newShare.RowCause = 'Manual';
        insert newShare;
    }
    
    public class CandidateShare{
        @InvocableVariable(required=true)
        public string candidateId;
        @InvocableVariable(required=true)
        public string userId;
        @InvocableVariable(required=true)
        public string AccessLevel;
        
    }
}
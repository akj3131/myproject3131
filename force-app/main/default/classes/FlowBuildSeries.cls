public class FlowBuildSeries {
    
    
    @InvocableMethod(label='Welcome Message' description='This is to display welcome message' category='Welcome')
   
    /*public static List<String> welcomeMessage(List<String> name){
String Message ='Welcome to flow builder';
if(name!=null && name.size()>0){
Message ='Welcome ' + name.get(0) + ' to flow builder';
}
return new List<String>{Message};
}
*/
    public static List<OutputResource> welcomeMessage(List<InputResource> inputs){
        String Message ='';
        List<OutputResource> outputToReturn = new List<OutputResource>();
        if(inputs!=null && inputs.size()>0){
            OutputResource output = new OutputResource();        
            InputResource input = inputs.get(0);
            output.name=input.name;
            output.age=input.age;
            output.place=input.place;
            outputToReturn.add(output);
                
            Message = 'Welcome ' + input.name+ ' Your age is '+input.age+' Your are from '+input.place;
        }        
        //return new List<String>{Message};
        //
        return outputToReturn;
    }
    
     public class OutputResource{
        
        @InvocableVariable(label='Your Name' description='Your Name')
        public String name;
        @InvocableVariable(label='Your Age' description='Your Age')
        public Integer age;
        @InvocableVariable(label='Your Place' description='Your Place')
        public String place;
        
    } 
    
    
    public class InputResource{
        
        @InvocableVariable(label='Your Name' required='true' description='Your Name')
        public String name;
        @InvocableVariable(label='Your Age' required='true' description='Your Age')
        public Integer age;
        @InvocableVariable(label='Your Place' required='true' description='Your Place')
        public String place;
        
    } 

}
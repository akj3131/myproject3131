public class TEASK {

    public void getinfo(){
       List<Task> Taskinfo = new  List<Task>([SELECT whatid,What.Type FROM Task LIMIT 10]);
        system.debug(Taskinfo);
        
    }
}
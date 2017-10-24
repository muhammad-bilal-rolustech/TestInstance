public class testController {
	public string sName;
    
    public List<Teacher__c> teacher;
    
    public teacher__c getteacher()
    {
        return teacher[0];
    }
     public List<teacher__c> getteachers()
    {
        
        return teacher;
    }
        
    public testController()
    {
        teacher = [select ID,Name , Grade__c , qualification__C, old_grade__c from teacher__c];
    }
    public string getName2(){
        return sName;
    }
    public void setName2(string name){
        this.sName = name;
    }
    public pagereference showMe(){
       sName = 'My name is '+ sName;
        return null;
    }
}
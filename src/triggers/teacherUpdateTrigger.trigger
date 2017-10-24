trigger teacherUpdateTrigger on Teacher__c (before insert, after insert) {

    if(Trigger.isInsert && Trigger.isAfter)
    {
        for(teacher__c teach:trigger.new) 
        {
            List<teacher__c> allT = [Select Name, Grade__c, qualification__c, old_grade__c FROM teacher__c];
            for(integer i=0; i<allT.size(); i++) 
            {
                if(allT[i].Name == teach.Name)
                {
                    teacher__c toUpdate = allT[i];
                    toUpdate.old_grade__c = 'Just Added ->'+ DateTime.now();
                    update toUpdate;       
                }
            }
            
        }    
    }
    
}
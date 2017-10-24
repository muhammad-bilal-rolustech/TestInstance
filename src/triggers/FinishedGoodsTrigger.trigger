trigger FinishedGoodsTrigger on FinishedGood__c (before delete) {

    if(Trigger.isDelete && Trigger.isBefore)
    {
        for(FinishedGood__c c: trigger.old) 
        {
            List<Component__c> allComp = [select id from Component__c where good_ref__c = :c.id];
            for(Integer i=0;i<allComp.size();i++)
            {
                delete allComp[i];
            }
        }        
    }
}
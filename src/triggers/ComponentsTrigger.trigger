trigger ComponentsTrigger on Component__c (after insert, after update) {
   
    if(Trigger.isInsert && Trigger.isAfter)
    {
        for(Component__c c: trigger.new) 
        {
            Component__c newC = [select name, material_price__c, quantity__c from Component__c where id = :c.id];
            if(c.material_price__c == null)
            {
                List<FinishedGood__c> allGoods = [select target_price__c from FinishedGood__c where id = :c.good_ref__c];
                if(allGoods != null && allGoods.size() > 0 )
                {
                    newC.material_price__c = allGoods[0].target_price__c;
                    update newC;
                }
            }
        }        
    }
	else if(Trigger.isUpdate && Trigger.isAfter)
    {
        for(Component__c c: trigger.new) 
        {
            Component__c newC = [select name, material_price__c, quantity__c from Component__c where id = :c.id];
            if(c.material_price__c == null)
            {
                List<FinishedGood__c> allGoods = [select base_line_price__c from FinishedGood__c where id = :c.good_ref__c];
                if(allGoods != null && allGoods.size() > 0 )
                {
                    newC.material_price__c = allGoods[0].base_line_price__c;
                    update newC;
                }
            }
        }        
    }    
}
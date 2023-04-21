global class batchExample implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext BC) {
       
        String query = 'SELECT Id, Name FROM Contact WHERE AccountId=\'0015g00000UCGj0AAH\'';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> ContactList) {
       
       
        for(Contact c : ContactList)
        {        
               
            c.LastName = c.LastName + c.AccountId;
        }
        try {
           
            update ContactList;
        
        } catch(Exception e) {
            System.debug(e);
        }
        
    }   
    
    global void finish(Database.BatchableContext BC) {
        system.debug('Process finished');
  }
}
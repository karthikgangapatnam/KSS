trigger DeleteAccWith2Contacts on Account (before delete) {
    
    for(Account acc :[Select ID,Name ,(select AccountID,ID from Contacts) from Account where id in :Trigger.old]){
            
            if(acc.Contacts.Size()>=2){
                
            trigger.oldmap.get(acc.Id).addError(' Account :: '+acc.Name+' has two or more related contacts so you can\'t delete account.');
          }
        }
             
}
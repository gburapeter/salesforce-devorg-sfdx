/**
 * Created by pbura on 10/18/2021.
 */


trigger WebinarTrigger on Webinar__c (before insert, before update) {
    if(Trigger.isInsert && Trigger.isBefore){
        WebinarHandler.handleBeforeInsert(Trigger.new);

}
    if(Trigger.isUpdate && Trigger.isBefore){
        WebinarHandler.handleBeforeUpdate(Trigger.new);
}

}
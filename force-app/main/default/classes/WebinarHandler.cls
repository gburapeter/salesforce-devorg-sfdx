/**
 * Created by pbura on 10/18/2021.
 */



public with sharing class WebinarHandler {


    public static void handleCostChange(List<Webinar__c> webinars){
        for(Webinar__c web : webinars){
            if(web.Cost__c < 100){
                web.Approval_Status__c = 'Approved';
            }
        }

    }


    public static void handleRejectedWebinars(List<Webinar__c> webinars){
        for(Webinar__c web : webinars){
            if( web.Approval_Status__c=='Rejected'){
                web.Status__c = 'Canceled';

            }
        }

    }


    /* public static void statusChange(Map<Id, Webinar__c> oldWebinar, Map<Id, Webinar__c>newWebinar){





    }*/

    public static void handleBeforeInsert(List<Webinar__c> webinars){
        handleCostChange(webinars);
        handleRejectedWebinars(webinars);

    }

    public static void handleBeforeUpdate(List<Webinar__c> webinars) {
        handleCostChange(webinars);
        handleRejectedWebinars(webinars);

    }

}
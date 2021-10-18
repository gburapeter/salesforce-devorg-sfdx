/**
 * Created by pbura on 10/18/2021.
 */


@IsTest
public with sharing class WebinarHandler {

    @IsTest
    public static void handleCostChange(List<Webinar__c> webinars){
        for(Webinar__c web : webinars){
            if(web.Cost__c < 100){
                web.Approval_Status__c = 'Approved';
            }
        }

    }

    @IsTest
    public static void handleRejectedWebinars(List<Webinar__c> webinars){
        for(Webinar__c web : webinars){
            if( web.Approval_Status__c=='Rejected'){
                web.Status__c = 'Canceled';

            }
        }

    }


    /* public static void statusChange(Map<Id, Webinar__c> oldWebinar, Map<Id, Webinar__c>newWebinar){





    }*/
    @IsTest
    public static void handleBeforeInsert(List<Webinar__c> webinars){
        handleCostChange(webinars);
        handleRejectedWebinars(webinars);

    }
    @IsTest
    public static void handleBeforeUpdate(List<Webinar__c> webinars) {
        handleCostChange(webinars);
        handleRejectedWebinars(webinars);

    }

}
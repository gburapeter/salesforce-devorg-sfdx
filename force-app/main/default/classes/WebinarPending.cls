/**
 * Created by pbura on 10/21/2021.
 */

public with sharing class WebinarPending {

    @AuraEnabled
    public static Webinar__c[] getWebinars(String queryLimit) {
        return [
                SELECT Name,
                        Approval_Status__c,
                        Cost__c

                FROM Webinar__c
                WHERE Approval_Status__c='Pending' and Cost__c>100
                LIMIT :Integer.valueOf(queryLimit)
        ];
    }

    @AuraEnabled
    public static Webinar__c updateStatus(Id webId) {
        Webinar__c myWeb =  [
                SELECT Webinar__c.Id,Name,
                        Approval_Status__c,
                        Cost__c

                FROM Webinar__c
                WHERE Webinar__c.Id=:webId

        ];
        myWeb.Approval_Status__c='Rejected';
        return myWeb;


    }



}
/**
 * Created by pbura on 10/18/2021.
 */

@IsTest
private class WebinarHandlerTest {
    @IsTest
        static void testCostChange() {
        List<Webinar__c> webinars = new List<Webinar__c>();

        Webinar__c webOne = new Webinar__c(Name = 'Deloitte', Cost__c = 10);
        Webinar__c webTwo = new Webinar__c(Name = 'Tesla', Cost__c = 150, Approval_Status__c='Pending');
        webinars.add(webOne);
        webinars.add(webTwo);

        Test.startTest();
        WebinarHandler.handleCostChange(webinars);
        Test.stopTest();

        System.assertEquals('Approved', webOne.Approval_Status__c);
        System.assertEquals('Pending', webTwo.Approval_Status__c);



    }
}
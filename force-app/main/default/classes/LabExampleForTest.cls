/**
 * Created by pbura on 10/14/2021.
 */
@IsTest
public with sharing class LabExampleForTest {
    @IsTest
    public static void testAccountCreation(){
        List<Account> accs = [SELECT Id FROM Account];
        System.assertEquals(0, accs.size());

        Project.createAccount('Test');

        List<Account> accsResult = [SELECT Id, Name FROM Account];
        System.assertEquals(1, accsResult.size());
        System.assertEquals('Test', accsResult[0].Name);
        System.debug('ASDDDDDD'+accsResult[0].Name);

    }

}
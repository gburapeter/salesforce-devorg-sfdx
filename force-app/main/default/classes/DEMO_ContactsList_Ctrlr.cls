public with sharing class DEMO_ContactsList_Ctrlr {

    @AuraEnabled
    public static Contact[] getContacts(String queryLimit) {
        return [
            SELECT Name,
                LastModifiedDate,
                AccountId
            FROM Contact
            ORDER BY LastModifiedDate DESC NULLS LAST,
                Name ASC
            LIMIT :Integer.valueOf(queryLimit)
        ];
    }

    @AuraEnabled
    public static Contact deleteContact(Contact con) {
        try {
            delete con;
        }
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return con;
    }

}
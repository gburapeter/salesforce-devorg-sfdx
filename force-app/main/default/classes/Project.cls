/**
 * Created by pbura on 10/14/2021.
 */

public with sharing class Project {
    public static void createAccount(String accName){
        insert new Account(Name = accName);

    }
}
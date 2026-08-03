public with sharing class DataService {

    // Retrieve all Applications
    public static List<Application__c> getApplications() {
        return [
            SELECT Id,
                   Name,
                   Status__c,
                   CreatedDate
            FROM Application__c
            ORDER BY CreatedDate DESC
        ];
    }

    // Retrieve one Application
    public static Application__c getApplication(Id applicationId) {
        return [
            SELECT Id,
                   Name,
                   Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];
    }

    // Create Application
    public static void createApplication(Application__c application) {
        insert application;
    }

    // Update Application
    public static void updateApplication(Application__c application) {
        update application;
    }

    // Delete Application
    public static void deleteApplication(Application__c application) {
        delete application;
    }
}
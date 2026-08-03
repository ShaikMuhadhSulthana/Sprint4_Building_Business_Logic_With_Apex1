public with sharing class DataService {

    // Retrieve Student
    public static Student__c getStudent(Id studentId) {

        return [
            SELECT Id,
                   Name,
                   CGPA__c,
                   Branch__c,
                   Email__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];
    }

    // Retrieve Job
    public static Job__c getJob(Id jobId) {

        return [
            SELECT Id,
                   Name,
                   Company_Name__c,
                   Minimum_CGPA__c,
                   Closing_Date__c
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];
    }

    // Check Existing Application

    public static Boolean hasApplied(Id studentId, Id jobId){

        Integer countApplications = [

            SELECT COUNT()

            FROM Application__c

            WHERE Student__c=:studentId

            AND Job__c=:jobId

        ];

        return countApplications>0;

    }

    // Create Application

    public static void createApplication(Id studentId, Id jobId){

        Application__c app = new Application__c();

        app.Student__c = studentId;

        app.Job__c = jobId;

        app.Status__c = 'Applied';

        insert app;

    }

    // Update Status

    public static void updateApplicationStatus(Id applicationId,String newStatus){

        Application__c app = [

            SELECT Id,Status__c

            FROM Application__c

            WHERE Id=:applicationId

            LIMIT 1

        ];

        app.Status__c = newStatus;

        update app;

    }

}
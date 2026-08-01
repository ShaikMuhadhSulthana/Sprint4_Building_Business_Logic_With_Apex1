public class ApplicationService {


    /*
     * Submit Application
     * 
     * Handles:
     * US-1 Accept a student application
     * US-2 Prevent duplicate applications
     * US-3 Check application deadline
     * US-4 Verify student eligibility
     * US-5 Save application
     * US-6 Display meaningful feedback
     */


    public static String submitApplication(
        Id studentId,
        Id jobId
    ){

        try {


            // Step 1: Check duplicate application

            Boolean duplicateApplication =
                checkDuplicateApplication(
                    studentId,
                    jobId
                );


            if(duplicateApplication){

                return 'Application rejected: Student has already applied for this job.';

            }



            // Step 2: Validate job deadline

            String deadlineStatus =
                validateApplicationDeadline(jobId);


            if(deadlineStatus != 'VALID'){

                return deadlineStatus;

            }



            // Step 3: Validate student eligibility

            String eligibilityStatus =
                validateStudentEligibility(
                    studentId,
                    jobId
                );


            if(eligibilityStatus != 'ELIGIBLE'){

                return eligibilityStatus;

            }



            // Step 4: Create Application Record

            Application__c application =
                new Application__c();


            application.Student__c = studentId;

            application.Job__c = jobId;

            application.Status__c = 'Submitted';

            application.Application_Date__c = Date.today();



            // Step 5: Save Record

            insert application;



            return 'Application submitted successfully.';



        }
        catch(Exception e){

            return 'Application failed: ' + e.getMessage();

        }

    }





    /*
     * US-2
     * Prevent Duplicate Applications
     */

    private static Boolean checkDuplicateApplication(
        Id studentId,
        Id jobId
    ){


        List<Application__c> existingApplications =

        [
            SELECT Id
            FROM Application__c
            WHERE Student__c = :studentId
            AND Job__c = :jobId
            LIMIT 1
        ];


        return !existingApplications.isEmpty();


    }





    /*
     * US-3
     * Check Application Deadline
     */

    private static String validateApplicationDeadline(
        Id jobId
    ){


        Job__c job =

        [
            SELECT Id,
                   Closing_Date__c
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];



        if(job.Closing_Date__c < Date.today()){


            return 'Application rejected: Job deadline has expired.';


        }


        return 'VALID';


    }





    /*
     * US-4
     * Verify Student Eligibility
     */

    private static String validateStudentEligibility(
        Id studentId,
        Id jobId
    ){


        Student__c student =

        [
            SELECT Id,
                   CGPA__c,
                   Active_Backlogs__c,
                   Branch__c,
                   Graduation_Year__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];



        Job__c job =

        [
            SELECT Id,
                   Minimum_CGPA__c,
                   Required_Branch__c,
                   Graduation_Year__c
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];





        if(student.CGPA__c < job.Minimum_CGPA__c){


            return 'Application rejected: Minimum CGPA requirement not satisfied.';


        }





        if(student.Active_Backlogs__c > 0){


            return 'Application rejected: Student has active backlogs.';


        }





        if(student.Branch__c != job.Required_Branch__c){


            return 'Application rejected: Branch requirement not satisfied.';


        }





        if(student.Graduation_Year__c != job.Graduation_Year__c){


            return 'Application rejected: Graduation year requirement not satisfied.';


        }





        return 'ELIGIBLE';


    }





    /*
     * Future Operations
     */


    public static void withdrawApplication(
        Id applicationId
    ){


        Application__c application =

        [
            SELECT Id,
                   Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];



        application.Status__c = 'Withdrawn';


        update application;


    }





    public static void approveApplication(
        Id applicationId
    ){


        Application__c application =

        [
            SELECT Id,
                   Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];



        application.Status__c = 'Approved';


        update application;


    }





    public static void rejectApplication(
        Id applicationId
    ){


        Application__c application =

        [
            SELECT Id,
                   Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];



        application.Status__c = 'Rejected';


        update application;


    }





    public static void reopenApplication(
        Id applicationId
    ){


        Application__c application =

        [
            SELECT Id,
                   Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];



        application.Status__c = 'Submitted';


        update application;


    }


}
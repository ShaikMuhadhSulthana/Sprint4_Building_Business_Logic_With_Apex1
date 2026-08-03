public class ApplicationService {


    // US-7 Retrieve Student Information

    public static Student__c getStudent(Id studentId){

        Student__c student = [
            SELECT Id,
                   Name,
                   CGPA__c,
                   Branch__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        return student;
    }



    // US-8 Retrieve Job Eligibility Criteria

    public static Job__c getJob(Id jobId){

        Job__c job = [
            SELECT Id,
                   Name,
                   Minimum_CGPA__c,
                   Eligible_Branch__c,
                   Closing_Date__c
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];

        return job;
    }




    // US-9 Check Duplicate Application

    public static Boolean checkDuplicateApplication(
        Id studentId,
        Id jobId
    ){

        List<Application__c> applications = [

            SELECT Id
            FROM Application__c
            WHERE Student__c = :studentId
            AND Job__c = :jobId

        ];


        return applications.size() > 0;

    }




    // US-10 Create Application

    public static String submitApplication(
        Id studentId,
        Id jobId
    ){

        Student__c student = getStudent(studentId);

        Job__c job = getJob(jobId);


        if(checkDuplicateApplication(studentId, jobId)){

            return 'Duplicate Application Found';

        }


        if(student.CGPA__c < job.Minimum_CGPA__c){

            return 'CGPA requirement not satisfied';

        }


        if(student.Branch__c != job.Eligible_Branch__c){

            return 'Branch is not eligible';

        }



        Application__c application = new Application__c();

        application.Student__c = studentId;

        application.Job__c = jobId;

        application.Status__c = 'Applied';


        insert application;


        return 'Application Created Successfully';

    }




    // US-11 Update Application Status

    public static String updateApplicationStatus(
        Id applicationId,
        String newStatus
    ){

        Application__c application = [

            SELECT Id,
                   Status__c

            FROM Application__c

            WHERE Id = :applicationId

            LIMIT 1

        ];


        application.Status__c = newStatus;


        update application;


        return 'Application Status Updated Successfully';

    }

}
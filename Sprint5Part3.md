# Placement Management System
## Sprint 5 – Building Complete Business Transactions with SOQL, DML and Apex

---

# Project Overview

The Placement Management System is a Salesforce application developed to automate the placement process for students, placement officers, and recruiters.

This sprint focuses on building a complete enterprise business transaction using Apex, SOQL, and DML.

Instead of learning SOQL and DML independently, this sprint demonstrates how professional Salesforce developers combine them to build real-world business processes.

The application retrieves information from Salesforce, validates business rules, prevents incorrect data, performs database operations, and returns meaningful responses to users.

---

# Sprint Objective

The objective of this sprint is to build an end-to-end business transaction that:

- Retrieves student information
- Retrieves job eligibility requirements
- Checks for duplicate applications
- Validates eligibility
- Creates new applications
- Updates application status
- Returns appropriate success or failure messages

---

# Learning Outcomes

By completing this sprint, the following concepts were implemented:

- Understanding enterprise business transactions
- Using SOQL to retrieve Salesforce data
- Using DML to create and update records
- Applying business validations before database operations
- Building reusable Apex service classes
- Writing maintainable and modular Apex code
- Following Salesforce best practices

---

# Technologies Used

- Salesforce Platform
- Apex
- SOQL
- DML
- Salesforce CLI
- Visual Studio Code
- Developer Console
- Git
- GitHub

---

# Salesforce Objects Used

## Student__c

Stores student details.

Fields used:

- Name
- CGPA__c
- Branch (or your actual branch field API name)

---

## Job__c

Stores job information.

Fields used:

- Name
- Minimum_CGPA__c
- Eligible_Branch__c
- Closing_Date__c

---

## Application__c

Stores placement applications.

Fields used:

- Student__c
- Job__c
- Status__c

---

# Business Requirements

The application must perform the following sequence:

1. Receive application request.
2. Retrieve student details.
3. Retrieve job details.
4. Verify duplicate applications.
5. Validate eligibility.
6. Create application.
7. Save record.
8. Display confirmation.

---

# Business Transaction Flow

```
Receive Request
       │
       ▼
Retrieve Student
       │
       ▼
Retrieve Job
       │
       ▼
Check Duplicate Application
       │
       ▼
Validate Eligibility
       │
       ▼
Create Application
       │
       ▼
Insert Record (DML)
       │
       ▼
Display Confirmation
```

---

# User Stories Implemented

## US-7 – Retrieve Student Information

### Objective

Retrieve only the fields required for eligibility validation.

### Implementation

SOQL retrieves:

- Student Id
- Name
- CGPA
- Branch

### Expected Result

Student information is available before validation begins.

---

## US-8 – Retrieve Job Eligibility

### Objective

Retrieve only the required job criteria.

### Implementation

SOQL retrieves:

- Job Name
- Minimum CGPA
- Eligible Branch
- Closing Date

### Expected Result

Application has sufficient information to validate eligibility.

---

## US-9 – Prevent Duplicate Applications

### Objective

Prevent students from applying multiple times for the same job.

### Implementation

SOQL searches Application__c using:

- Student
- Job

### Expected Result

| Scenario | Result |
|----------|--------|
| First Application | Allowed |
| Duplicate Application | Rejected |
| Different Job | Allowed |

---

## US-10 – Create Application

### Objective

Create an application only after all validations succeed.

### Implementation

DML INSERT creates:

- Student
- Job
- Status = Applied

### Expected Result

Application record is successfully stored.

---

## US-11 – Update Application Status

### Objective

Allow recruiters or placement officers to update application status.

Possible values:

- Applied
- Shortlisted
- Interview Scheduled
- Selected
- Rejected

### Implementation

SOQL retrieves the existing Application.

DML UPDATE modifies the Status field.

### Expected Result

Application status changes successfully.

---

## US-12 – Return Meaningful Feedback

The application returns informative messages.

Examples:

- Application Created Successfully
- Duplicate Application Found
- CGPA requirement not satisfied
- Branch is not eligible
- Application Status Updated Successfully

---

# Apex Classes

## ApplicationService.cls

This class contains the complete business transaction.

Methods:

### getStudent()

Purpose:

Retrieve student details using SOQL.

---

### getJob()

Purpose:

Retrieve job eligibility information.

---

### checkDuplicateApplication()

Purpose:

Verify whether the student has already applied.

---

### submitApplication()

Purpose:

Perform the complete business transaction.

Sequence:

Retrieve Student

↓

Retrieve Job

↓

Duplicate Validation

↓

Eligibility Validation

↓

Insert Application

↓

Return Message

---

### updateApplicationStatus()

Purpose:

Update application status using DML.

---

# SOQL Queries Used

Retrieve Student

```sql
SELECT Id, Name, CGPA__c
FROM Student__c
```

Retrieve Job

```sql
SELECT Id, Name, Minimum_CGPA__c
FROM Job__c
```

Retrieve Applications

```sql
SELECT Id, Student__c, Job__c, Status__c
FROM Application__c
```

Duplicate Check

```sql
SELECT Id
FROM Application__c
WHERE Student__c = :studentId
AND Job__c = :jobId
```

---

# DML Operations Used

Insert Application

```apex
insert application;
```

Update Status

```apex
update application;
```

---

# Engineering Principles Followed

- SOQL executed before DML.
- Retrieved only required fields.
- Performed validation before modifying data.
- Used separate methods for different responsibilities.
- Created reusable business services.
- Improved readability and maintainability.

---

# Project Structure

```
PlacementManagementSystem
│
├── force-app
│   └── main
│       └── default
│           └── classes
│               ├── DataService.cls
│               ├── ApplicationService.cls
│               ├── DataService.cls-meta.xml
│               └── ApplicationService.cls-meta.xml
│
├── Documentation
│   ├── Sprint5.md
│   └── README.md
│
└── Screenshots
```

---

# Testing Performed

## Test 1

Retrieve Student

Expected:

Student details displayed.

Status:

Passed

---

## Test 2

Retrieve Job

Expected:

Job details displayed.

Status:

Passed

---

## Test 3

Submit Application

Expected:

Application Created Successfully

Status:

Passed

---

## Test 4

Duplicate Validation

Expected:

Duplicate Application Found

Status:

Passed

---

## Test 5

Update Status

Expected:

Application Status Updated Successfully

Status:

Passed

---

# Screenshots

Include the following screenshots:

1. Project Structure
2. ApplicationService.cls
3. Successful Deployment
4. Student SOQL Query Result
5. Job SOQL Query Result
6. Execute Anonymous – Application Creation
7. Application Record
8. Duplicate Validation
9. Status Update
10. Updated Application Record
11. Debug Logs

---

# Debugging Scenarios

## Duplicate SOQL

Avoid writing the same query multiple times.

Solution:

Create reusable methods.

---

## DML Before Validation

Problem:

Invalid applications may be stored.

Solution:

Always validate before insert or update.

---

## Retrieving Unnecessary Fields

Problem:

Consumes unnecessary Salesforce resources.

Solution:

Retrieve only required fields.

---

## Large Methods

Problem:

Difficult to maintain.

Solution:

Divide functionality into reusable methods.

---

# Interview Questions

## Why should SOQL execute before DML?

SOQL retrieves the required business information so the application can validate rules before modifying data.

---

## Why retrieve only required fields?

It improves performance, reduces resource consumption, and keeps queries efficient.

---

## Why validate before DML?

Validation prevents invalid or duplicate records from being stored in Salesforce.

---

## Why separate business logic into service classes?

It improves maintainability, readability, reusability, and simplifies future enhancements.

---

# Sprint Retrospective

## What worked well?

The integration of SOQL, DML, and Apex into a single business transaction successfully automated the placement application workflow.

---

## Biggest Challenge

Understanding how multiple business rules work together before performing DML operations.

---

## Future Improvements

- Bulk processing
- Exception handling
- Custom notifications
- Email alerts
- Trigger integration
- Asynchronous Apex
- Unit test classes with higher code coverage
- Better validation for interview scheduling and offer generation

---

# Conclusion

This sprint successfully demonstrated how Salesforce applications perform complete enterprise transactions using Apex, SOQL, and DML.

The Placement Management System now retrieves business information, validates eligibility, prevents duplicate applications, creates records responsibly, updates application status, and provides meaningful responses to users.

This implementation follows Salesforce best practices by retrieving only necessary data, validating before database operations, and organizing business logic into reusable service methods.

The project is now ready for the next sprint, where business logic can be automated further using Salesforce Triggers and advanced automation.
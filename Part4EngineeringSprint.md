# Sprint 4 - Building Business Logic With Apex

## Placement Management System

Salesforce Developer Bridge Program  
VIT Solutions Pvt. Ltd.

---

# Overview

The Placement Management System is designed to automate student job applications.

In this sprint, business requirements were converted into Apex business logic using a service-based architecture.

The main objective was to create an Apex service responsible for handling application processing.

---

# Sprint Objective

The objective of this sprint was:

> Implement business logic that allows students to apply for jobs correctly.

The application workflow was designed as:

```
Receive Application

        ↓

Validate Duplicate Application

        ↓

Validate Eligibility

        ↓

Save Application Record

        ↓

Display Result
```

---

# Apex Implementation

## ApplicationService

Created Apex Class:

```
ApplicationService.cls
```

Purpose:

`ApplicationService` manages all application-related business operations.

Responsibilities include:

- Receiving student applications
- Validating application requests
- Processing business rules
- Managing application status

---

# Why ApplicationService?

Application processing is separated from other responsibilities because each business area should have its own service.

Example:

| Service Class | Responsibility |
|---|---|
| StudentService | Student operations |
| JobService | Job management |
| ApplicationService | Application processing |
| OfferLetterService | Offer letter handling |

Benefits:

- Better code organization
- Easy maintenance
- Reusable business logic
- Easier testing

---

# Engineering Sprint Implementation

## Sprint 1 - Creating Application Service

### Requirement

The Placement Office required a dedicated service responsible for application operations.

### Completed

✓ Created ApplicationService Apex class  
✓ Defined application processing responsibility  
✓ Followed service-based architecture  


---

# Sprint 2 - Receiving an Application

### Requirement

When a student clicks Apply, the system should receive the request.

### Implementation

Created:

```apex
submitApplication()
```

Parameters:

| Parameter | Description |
|---|---|
| studentId | Identifies the student |
| jobId | Identifies the job opportunity |

Example:

```apex
public static String submitApplication(
    Id studentId,
    Id jobId
)
```

---

# Sprint 3 - Preventing Duplicate Applications

### Requirement

A student should not apply for the same job multiple times.

### Business Rule

```
Student + Job

must be unique
```

### Implementation Approach

The system checks existing Application records before processing a new request.

Process:

```
Student Applies

        ↓

Search Existing Applications

        ↓

Duplicate Found?

     Yes       No

      ↓         ↓

 Reject     Continue
```

Concept Used:

✓ SOQL Query  
✓ Validation before saving  

---

# Sprint 4 - Validating Eligibility

### Requirement

Only eligible students should apply for jobs.

Eligibility conditions include:

- Minimum CGPA
- Active Backlogs
- Branch requirements
- Graduation Year


Validation improves application quality by ensuring only qualified students continue.

---

# Sprint 5 - Saving Application

### Requirement

After all validations pass, the application should be stored in Salesforce.

Salesforce operations involved:

## DML Operations

Used for:

- Creating records
- Updating records
- Saving application details


Example:

```apex
insert applicationRecord;
```

---

# Sprint 6 - Completing Application Workflow

The final workflow:

```
Student Selects Job

        ↓

submitApplication()

        ↓

Duplicate Validation

        ↓

Eligibility Validation

        ↓

Create Application Record

        ↓

Save in Salesforce

        ↓

Return Feedback
```

---

# Apex Concepts Learned

| Concept | Description |
|---|---|
| Apex Class | Represents business responsibility |
| Service Class | Organizes business logic |
| Method | Represents business operation |
| SOQL | Retrieves Salesforce data |
| DML | Saves Salesforce records |
| Exception Handling | Manages errors safely |
| Validation Logic | Enforces business rules |

---

# Debugging and Engineering Practices

## Avoid SOQL Inside Loops

Problem:

Repeated database queries can exceed Salesforce governor limits.

Better approach:

- Query records once
- Store results in collections
- Process data efficiently


---

## Avoid Duplicate Logic

Problem:

Same validation in multiple methods creates maintenance issues.

Solution:

Create reusable helper methods.


---

## Meaningful Naming

Poor:

```
process()
execute()
doWork()
```

Better:

```
submitApplication()
validateEligibility()
checkDuplicateApplication()
```

Good names improve readability.

---

# Interview Learnings

## Why use service classes?

Service classes separate business logic from user interface components.

Benefits:

- Reusability
- Maintainability
- Better testing


---

## Why separate responsibilities?

Each class focuses on one business responsibility.

This follows:

```
Single Responsibility Principle
```

---

## How to handle changing requirements?

If eligibility rules change:

- Keep validation logic separate
- Modify only required methods
- Avoid changing the entire application flow

---

# Sprint Retrospective

## What Went Well?

Created a structured Apex service that represents application processing responsibility.


## What Was Difficult?

Understanding how business requirements are converted into Apex logic.


## What Would Improve?

Future improvements:

- Add Apex Test Classes
- Improve validation framework
- Add automation using Flows and Triggers

---

# Engineering Lesson Learned

> Good software is created by understanding business problems first and writing code second.

---

# Current Project Structure

```
Placement Management System

│
├── README.md
│
├── force-app
│   |
│   └── main
│       |
│       └── default
│           |
│           └── classes
│               |
│               ├── ApplicationService.cls
│               |
│               └── ApplicationService.cls-meta.xml
│
└── Documentation


# Conclusion

The Engineering Sprint successfully transformed placement business requirements into an Apex service.

`ApplicationService` provides the foundation for future enhancements including:

- Advanced SOQL queries
- Complex eligibility rules
- Trigger automation
- Apex Test Classes
- Integration features

The goal of software development is not writing more code, but solving business problems through well-designed solutions.
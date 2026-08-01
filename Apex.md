# Placement Management System  
## Apex Implementation Documentation

---

# Apex Implementation - ApplicationService

## Overview

Apex is the programming language used in Salesforce to implement business logic.

In the Placement Management System, Apex converts business requirements into executable software by implementing the rules and operations defined during system design.

The first Apex service created is `ApplicationService`.

---

# ApplicationService

## Purpose

`ApplicationService` represents the business responsibility of managing student job applications.

It handles application-related operations such as:

- Submitting applications
- Withdrawing applications
- Approving applications
- Rejecting applications
- Reopening applications

---

# Why ApplicationService Exists?

The Placement Management System follows a service-based design approach where each class handles a specific business responsibility.

Application-related operations are grouped inside `ApplicationService`.

### Service Responsibilities

| Service Class | Responsibility |
|---------------|----------------|
| StudentService | Student-related operations |
| JobService | Job-related operations |
| ApplicationService | Application processing operations |
| OfferLetterService | Offer letter management |

---

## Benefits of Service Class Design

Separating responsibilities improves:

- Code readability
- Maintainability
- Testing
- Reusability
- Future modifications

---

# Apex Class

Created Apex Class:

```apex
public class ApplicationService {

}
```

The class represents the application processing responsibility of the Placement Management System.

---

# ApplicationService Methods

The class contains methods representing different application business operations.

---

# 1. submitApplication()

## Purpose

Creates a new application submission for a student applying to a job opportunity.

## Parameters

| Parameter | Description |
|-----------|-------------|
| studentId | Identifies the student submitting the application |
| jobId | Identifies the job opportunity |

## Return Value

Returns the result message after submitting the application.

### Implementation

```apex
public static String submitApplication(
    Id studentId,
    Id jobId
){

    return 'Application Submitted Successfully';

}
```

---

# 2. withdrawApplication()

## Purpose

Withdraws an existing student application.

## Parameter

| Parameter | Description |
|-----------|-------------|
| applicationId | Identifies the application record |

### Implementation

```apex
public static void withdrawApplication(
    Id applicationId
){

}
```

---

# 3. approveApplication()

## Purpose

Approves a student application after review.

## Parameter

| Parameter | Description |
|-----------|-------------|
| applicationId | Identifies the application record |

### Implementation

```apex
public static void approveApplication(
    Id applicationId
){

}
```

---

# 4. rejectApplication()

## Purpose

Rejects a student application based on business rules.

Examples:

- Student CGPA below required criteria
- Application not meeting requirements
- Placement officer rejection

## Parameter

| Parameter | Description |
|-----------|-------------|
| applicationId | Identifies the application record |

### Implementation

```apex
public static void rejectApplication(
    Id applicationId
){

}
```

---

# 5. reopenApplication()

## Purpose

Reopens a previously rejected application.

This allows further processing if required.

## Parameter

| Parameter | Description |
|-----------|-------------|
| applicationId | Identifies the application record |

### Implementation

```apex
public static void reopenApplication(
    Id applicationId
){

}
```

---

# Complete ApplicationService Structure

```apex
public class ApplicationService {


    public static String submitApplication(
        Id studentId,
        Id jobId
    ){

        return 'Application Submitted Successfully';

    }


    public static void withdrawApplication(
        Id applicationId
    ){

    }


    public static void approveApplication(
        Id applicationId
    ){

    }


    public static void rejectApplication(
        Id applicationId
    ){

    }


    public static void reopenApplication(
        Id applicationId
    ){

    }


}
```

---

# Apex Concepts Learned

| Concept | Explanation |
|---------|-------------|
| Class | Represents a business responsibility |
| Method | Represents a business operation |
| Parameter | Information required for performing an operation |
| Return Value | Communicates operation results |
| Service Class | Organises business logic into reusable components |
| Static Method | Allows calling methods without creating objects |

---

# Relationship With Placement Management System

The ApplicationService maps directly to placement business requirements.

## Business Requirement

"When a student applies for a job, the system should process the application."

## Apex Responsibility

`ApplicationService.submitApplication()`

---

## Business Requirement

"Placement officer should approve or reject applications."

## Apex Responsibility

Methods:

- approveApplication()
- rejectApplication()

---

## Business Requirement

"Students should be able to withdraw applications."

## Apex Responsibility

`withdrawApplication()`

---

# Current Implementation Status

Completed:

✅ Apex Class Creation  
✅ ApplicationService Design  
✅ submitApplication Method  
✅ withdrawApplication Method  
✅ approveApplication Method  
✅ rejectApplication Method  
✅ reopenApplication Method  
✅ Method Parameters  
✅ Return Values  
✅ Service Class Structure  

---

# Current Architecture

```
Placement Management System

        |
        |
        V

ApplicationService.cls

        |
        |
        +----------------+
        |                |
        V                V

Application        Job Records

(Student applies)  (Available jobs)

```

---

# Future Apex Implementation

The current class contains the service structure.

The next development phase will implement actual Salesforce operations.

Future additions:

## 1. SOQL Queries

Used to retrieve Salesforce records.

Examples:

- Find Student details
- Check Job availability
- Verify existing applications


Example:

```apex
List<Application__c> applications =
[
    SELECT Id, Status__c
    FROM Application__c
];
```

---

## 2. Business Validations

Rules from the Placement Management System will be implemented.

Examples:

- Prevent duplicate applications
- Check minimum CGPA
- Verify job closing date


---

## 3. DML Operations

Used to create, update, and delete Salesforce records.

Operations:

- INSERT
- UPDATE
- DELETE
- UPSERT


Example:

```apex
insert applicationRecord;
```

---

## 4. Exception Handling

Handles errors safely.

Example:

```apex
try{

}
catch(Exception e){

}
```

---

## 5. Apex Test Classes

Testing will verify:

- Application creation
- Approval process
- Rejection process
- Validation rules
- Error handling


---

# Development Roadmap

```
Business Requirements
          |
          |
          V
Service Design
          |
          |
          V
Apex Classes
          |
          |
          V
SOQL Queries
          |
          |
          V
DML Operations
          |
          |
          V
Validations
          |
          |
          V
Test Classes
```

---

# Conclusion

`ApplicationService` is the first Apex layer of the Placement Management System.

It converts placement business operations into reusable Salesforce code.

The current implementation focuses on designing the service structure.

The next phase will connect this service with Salesforce data using:

- SOQL
- DML
- Validation Logic
- Exception Handling
- Test Classes
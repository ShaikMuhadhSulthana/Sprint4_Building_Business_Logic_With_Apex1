# Placement Management System
# Architecture Design

## Sprint 4 - Thinking Like an Architect

---

# Introduction

Every successful software application is built twice:

1. First in the mind of the engineer through planning and design.
2. Then in the programming language through implementation.

Architecture design is the process of organising responsibilities within a software system.

Before writing Apex code, developers must understand:

- What decisions the system needs to make
- Which component should handle each responsibility
- How different components communicate with each other

A good architecture makes software easier to understand, maintain, test, and extend.

---

# From Requirements to Design

The Placement Management System requires software that can make business decisions automatically.

The identified business rules are:

- Validate student eligibility
- Prevent duplicate applications
- Enforce application deadlines
- Notify recruiters
- Maintain accurate records

Instead of writing all logic in one place, responsibilities are divided between different components.

This prevents complexity and makes future changes easier.

---

# Application Architecture Flow

The journey of a student application follows this flow:

```
Student

     ↓

Lightning Web Component

     ↓

ApplicationService

     ↓

Eligibility Validation

     ↓

Salesforce Database

     ↓

Confirmation Message to User
```

---

# Understanding Component Responsibilities

Each component in the system has a specific responsibility.

A component should perform one primary responsibility instead of handling multiple unrelated tasks.

This approach improves:

- Maintainability
- Scalability
- Code organisation
- Reusability

---

# Lightning Web Component (LWC)

## Responsibility

Lightning Web Component handles the interaction between the user and the application.

## Responsibilities:

- Display application forms
- Collect student information
- Send requests to Apex services
- Display success messages
- Display validation errors

## LWC Should Not:

- Perform complex business decisions
- Validate placement rules
- Directly manage database operations

Business decisions should be handled by Apex services.

---

# StudentService

## Responsibility

StudentService manages student-related operations.

## Purpose

This service handles student information, academic verification, and eligibility checking.

## Responsibilities:

- Register students
- Retrieve student details
- Update student profiles
- Verify academic information
- Check minimum CGPA requirement
- Check active backlogs
- Check placement status

## StudentService Should Not:

- Create job postings
- Process applications
- Manage company details

Student-related responsibilities should remain inside StudentService.

---

# JobService

## Responsibility

JobService manages company job opportunities.

## Purpose

This service handles operations related to job postings and company requirements.

## Responsibilities:

- Create new job postings
- Update eligibility criteria
- Publish available jobs
- Close expired opportunities
- Maintain company requirements

## JobService Should Not:

- Submit student applications
- Approve student applications
- Manage student information

Job-related responsibilities should remain inside JobService.

---

# ApplicationService

## Responsibility

ApplicationService manages the complete placement application process.

It acts as the main business service responsible for application decisions.

## Responsibilities:

- Receive student applications
- Check student eligibility
- Validate job requirements
- Prevent duplicate applications
- Validate deadlines
- Save successful applications
- Reject invalid applications
- Return meaningful messages to users
- Notify recruiters

---

# Business Rule Responsibility Mapping

| Business Rule | Responsible Component |
|---------------|----------------------|
| Check CGPA requirement | StudentService |
| Check active backlogs | StudentService |
| Verify branch eligibility | StudentService |
| Retrieve student information | StudentService |
| Create job postings | JobService |
| Update company criteria | JobService |
| Validate application deadline | JobService |
| Submit application | ApplicationService |
| Prevent duplicate application | ApplicationService |
| Approve application | ApplicationService |
| Reject invalid application | ApplicationService |
| Send recruiter notification | ApplicationService |

---

# Think Like an Engineer - Pod Activity

## New Requirement:

"Students who already hold two offers cannot apply for any additional companies."

---

## Question 1:
### Which service should implement this rule?

### Answer:

ApplicationService should implement this rule because it controls the application submission process.

Before accepting a new application, ApplicationService should check the number of offers already received by the student.

---

## Question 2:
### Should this rule be checked before or after saving the application?

### Answer:

This rule should be checked before saving the application.

The system should validate all business rules before creating the application record.

Invalid applications should not be stored in Salesforce.

---

## Question 3:
### Will this change affect StudentService, JobService or ApplicationService?

### Answer:

This change mainly affects ApplicationService because it decides whether a student can submit a new application.

StudentService and JobService responsibilities remain unchanged.

---

## Question 4:
### If the company changes the rule next year to three offers instead of two, which part should require modification?

### Answer:

Only the offer validation logic inside ApplicationService should be modified.

Other services should remain unchanged because responsibilities are separated properly.

---

# Engineering Principles Followed

## 1. Separation of Responsibility

Each component performs a specific task.

Examples:

- LWC handles user interaction
- Apex services handle business decisions
- Salesforce database stores records

---

## 2. Single Responsibility Principle

Each class focuses on one business area.

Example:

StudentService handles students.

JobService handles jobs.

ApplicationService handles applications.

---

## 3. Maintainability

Separating responsibilities makes future modifications easier.

Changes in one business rule do not affect the complete system.

---

## 4. Reusability

Business operations can be reused throughout the application.

Example:

Student eligibility checking can be reused whenever a student applies for different companies.

---

## 5. Scalability

The architecture supports future enhancements.

Future features:

- Interview scheduling
- Offer letter generation
- Placement reports
- Email notifications
- Placement history tracking

---

# Preparing for Apex

The architecture and responsibilities are now clearly defined.

The next step is converting these designs into Apex implementation.

Apex will be used to represent business responsibilities as executable software.

---

# Apex Implementation Mapping

| Requirement | Apex Implementation |
|------------|--------------------|
| Student operations | StudentService Apex Class |
| Job operations | JobService Apex Class |
| Application handling | ApplicationService Apex Class |
| Retrieve records | SOQL Queries |
| Store/update records | DML Operations |
| Handle errors | Exception Handling |

---

# Apex Concepts That Will Be Used

Future implementation will include:

- Apex Classes
- Apex Methods
- Variables
- Collections
- SOQL Queries
- DML Operations
- Exception Handling
- Trigger Integration
- Lightning Web Component Communication

---

# Conclusion

Architecture design is an important step before coding.

By assigning each responsibility to the correct component, the Placement Management System becomes easier to develop, test, maintain, and extend.

Good architecture reduces unnecessary code, avoids duplication, and prevents confusion.

The next step is implementing these designed responsibilities using Apex classes and methods.
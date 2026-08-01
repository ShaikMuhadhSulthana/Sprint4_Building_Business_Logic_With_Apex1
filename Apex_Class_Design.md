
---

# Class 1: StudentService

## Responsibility

The StudentService class is responsible for managing student-related operations.

It handles student information, eligibility verification, and student status updates.

---

## Purpose

This class will manage:

- Retrieving student details
- Checking student eligibility for placement opportunities
- Updating student placement status
- Validating student requirements before application submission

---

## Planned Methods

### checkStudentEligibility()

**Purpose:**

Checks whether a student satisfies the eligibility criteria required for applying to a company.

**Possible validations:**

- Minimum CGPA requirement
- Active backlog verification
- Branch eligibility
- Academic requirements


---

### getStudentDetails()

**Purpose:**

Retrieves student information from the system.

**Possible details:**

- Student name
- Email
- Department
- CGPA
- Backlog status
- Placement status


---

### updateStudentStatus()

**Purpose:**

Updates the current placement status of a student.

**Example statuses:**

- Available
- Applied
- Interview Scheduled
- Selected
- Rejected


---

# Class 2: JobService

## Responsibility

The JobService class manages company job postings and job-related operations.

---

## Purpose

This class will handle:

- Creating job opportunities
- Checking company eligibility criteria
- Validating application deadlines
- Managing job requirements


---

## Planned Methods

### createJob()

**Purpose:**

Creates a new job posting with company details and eligibility requirements.

**Possible information stored:**

- Company name
- Job role
- Required CGPA
- Eligible branches
- Application deadline


---

### checkJobEligibility()

**Purpose:**

Checks whether a student meets the requirements defined by the company.

**Validations include:**

- CGPA requirement
- Branch restriction
- Academic criteria


---

### validateDeadline()

**Purpose:**

Checks whether the application is submitted before the closing date.

**Business Rule:**

Applications submitted after the deadline should be rejected.


---

# Class 3: ApplicationService

## Responsibility

The ApplicationService class manages placement application processes.

It controls application submission, validation, approval, and rejection.

---

## Purpose

This class will handle:

- Submitting applications
- Checking duplicate applications
- Approving valid applications
- Rejecting invalid applications


---

## Planned Methods

### submitApplication()

**Purpose:**

Creates a new placement application after validating student eligibility.

**Before submission, the system should check:**

- Student eligibility
- Job eligibility
- Deadline validation
- Duplicate application


---

### checkDuplicateApplication()

**Purpose:**

Prevents a student from applying multiple times for the same job opportunity.

**Business Rule:**

A student can submit only one application for a particular company job.


---

### approveApplication()

**Purpose:**

Approves applications that satisfy all business requirements.

---

### rejectApplication()

**Purpose:**

Rejects applications that fail business validations.

**Possible rejection reasons:**

- Low CGPA
- Active backlogs
- Wrong branch
- Deadline exceeded
- Duplicate application


---

# Mapping with Salesforce Objects

The planned Apex classes will interact with the following Salesforce objects:

| Apex Class | Salesforce Object | Responsibility |
|------------|------------------|----------------|
| StudentService | Student__c | Manage student information and eligibility |
| JobService | Job__c | Manage company job postings and requirements |
| ApplicationService | Application__c | Manage placement applications and status |

---

# Design Principles Followed

## 1. Separation of Responsibility

Each class focuses on one specific business area.

Example:

- StudentService handles students
- JobService handles jobs
- ApplicationService handles applications


---

## 2. Maintainability

Separating business logic into different classes makes future changes easier.

Changes in one area will not affect unrelated operations.


---

## 3. Reusability

Common business operations can be reused throughout the application.

Example:

Student eligibility checking can be used whenever a student applies for a job.


---

## 4. Scalability

The design allows additional features to be added easily in the future.

Examples:

- Interview management
- Offer letter generation
- Placement reports
- Notification services


---

# Future Apex Implementation

In upcoming sprints, these class designs will be converted into actual Apex classes.

The implementation will include:

- Apex Classes
- Apex Methods
- SOQL Queries
- Exception Handling
- Trigger Integration
- Lightning Web Component Communication


---

# Conclusion

This Apex class design provides a structured approach for implementing business logic in the Placement Management System.

By defining responsibilities before coding, the system becomes easier to develop, maintain, and extend.
# Sprint 5 – Making Software Talk to Data
## Retrieving and Managing Information with SOQL and DML

---

## Sprint Objective

The objective of Sprint 5 was to understand how Salesforce applications retrieve and manipulate data using SOQL (Salesforce Object Query Language) and DML (Data Manipulation Language). This sprint focused on enabling the Placement Management System to access business data before making decisions and perform database operations using Apex.

---

# Learning Outcomes

By the end of this sprint, I was able to:

- Understand why enterprise applications retrieve information before executing business logic.
- Understand the purpose and usage of SOQL in Salesforce.
- Learn how DML operations are used to insert, update, and manage Salesforce records.
- Retrieve Salesforce records using SOQL in Apex.
- Update Salesforce records using DML statements.
- Appreciate the importance of data as a business asset.
- Build reusable Apex code for data retrieval.
- Gain practical experience working with Salesforce records using Apex.

---

# Engineering Principle

Professional software should never make decisions without first retrieving the required information.

The workflow followed is:

1. Retrieve Data
2. Validate Business Rules
3. Perform Business Logic
4. Update Records

Understanding the required information before implementing logic helps produce reliable, scalable, and maintainable enterprise applications.

---

# Understanding SOQL

SOQL (Salesforce Object Query Language) is Salesforce's query language used to retrieve data from Salesforce objects.

Before writing a query, the following question should always be answered:

> "What business information is required?"

Example business questions include:

- What is the student's CGPA?
- Has the student already applied?
- Which jobs are currently accepting applications?
- Which students satisfy a company's eligibility criteria?

SOQL enables Salesforce applications to retrieve only the required information efficiently.

---

# Understanding DML

DML (Data Manipulation Language) is used to create, update, delete, and restore Salesforce records.

Common DML operations include:

- insert
- update
- delete
- undelete
- upsert

During this sprint, DML was used to update the Application record status.

Example:

```apex
Application__c app = [
    SELECT Id, Status__c
    FROM Application__c
    LIMIT 1
];

app.Status__c = 'Selected';

update app;
```

The update operation successfully changed the Application Status to **Selected**.

---

# Think Like an Engineer

Before allowing a student to apply for a job, the software may require the following business information:

1. Student Name
2. Student ID
3. Student CGPA
4. Student Department
5. Student Branch
6. Active Backlogs
7. Graduation Year
8. Student Email
9. Job Title
10. Company Name
11. Minimum CGPA Requirement
12. Application Deadline
13. Job Status
14. Existing Application Count
15. Current Offer Status

Identifying the required information before writing queries improves software design and business decision-making.

---

# Business Questions Analysis

## Business Question 1

**Has this student already applied for the selected company?**

**Object**

- Application__c

**Required Fields**

- Student__c
- Job__c
- Status__c

---

## Business Question 2

**Which companies are currently accepting applications?**

**Object**

- Job__c

**Required Fields**

- Company Name
- Job Title
- Application Closing Date
- Status

---

## Business Question 3

**How many students have already been selected by Amazon?**

**Object**

- Application__c

**Required Fields**

- Student__c
- Job__c
- Status__c

---

## Business Question 4

**Which students satisfy Microsoft's eligibility criteria?**

**Objects**

- Student__c
- Job__c

**Required Fields**

Student

- CGPA
- Branch
- Graduation Year

Job

- Minimum CGPA
- Required Branch

---

# Implementation

## Apex Class Created

```
DataService.cls
```

Purpose:

- Retrieve Salesforce records using SOQL.
- Provide reusable methods for data access.

---

## Metadata File

```
DataService.cls-meta.xml
```

Created to deploy the Apex class into the Salesforce org.

---

# Practical Activities Completed

During Sprint 5, the following tasks were successfully completed:

- Created **DataService.cls**.
- Created **DataService.cls-meta.xml**.
- Executed SOQL queries using Execute Anonymous.
- Retrieved Salesforce records successfully.
- Executed DML Update operation.
- Updated Application Status from the Developer Console.
- Verified the updated Application record in Salesforce.
- Reviewed Debug Logs to confirm successful execution.
- Understood the relationship between SOQL and DML within Apex applications.

---

# Challenges Faced

During deployment, Apex compilation errors occurred because some field API names referenced in the Apex classes did not match the custom fields available in the Salesforce org.

These issues were identified, analyzed, and corrected during implementation.

An additional Flow-related error occurred while updating Application records. The issue was resolved by identifying the Flow configuration and successfully completing the DML update.

---

# Skills Gained

- Salesforce Apex
- SOQL
- DML
- Execute Anonymous Window
- Developer Console
- Salesforce Data Retrieval
- Salesforce Record Updates
- Debug Log Analysis
- Enterprise Application Development

---

# Sprint Outcome

Sprint 5 successfully demonstrated how enterprise Salesforce applications communicate with data.

The Placement Management System can now:

- Retrieve required business information using SOQL.
- Update Salesforce records using DML.
- Support business decisions using accurate data.
- Build reusable data access services through Apex.

This sprint established the foundation for implementing complete business transactions within Salesforce applications.

---

# Conclusion

Sprint 5 strengthened the understanding that successful enterprise applications rely on accurate data retrieval before executing business logic.

Using SOQL for querying and DML for record manipulation enabled the Placement Management System to perform real-world business operations efficiently and reliably.

This sprint provided practical experience in working with Salesforce data, Apex programming, and enterprise application development.
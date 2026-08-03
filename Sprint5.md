# Sprint 5 - Retrieving and Managing Information using SOQL and DML

## Objective

The objective of this sprint is to understand how Salesforce retrieves and updates business information using SOQL and DML through Apex.

---

# Learning Outcomes

- Understand why software retrieves data before making decisions.
- Learn SOQL (Salesforce Object Query Language).
- Learn DML (Data Manipulation Language).
- Retrieve records using Apex.
- Insert and update records using Apex.
- Build reusable data access logic.

---

# Engineering Principle

Business software should always retrieve the required information before applying business rules.

Retrieve First → Decide Next

---

# Why SOQL?

SOQL is used to retrieve records from Salesforce objects.

Example:

- Find Student CGPA
- Find Job Eligibility
- Check Duplicate Applications
- Find Application Status

---

# Why DML?

DML is used to manipulate Salesforce records.

Operations include

- Insert
- Update
- Delete
- Upsert

---

# Think Like an Engineer

## Information Required Before Student Applies

1. Student Name
2. Student Email
3. Student CGPA
4. Student Branch
5. Student Graduation Year
6. Student Backlogs
7. Student Active Status
8. Job Name
9. Company Name
10. Minimum CGPA
11. Application Deadline
12. Job Status
13. Existing Application
14. Number of Current Offers
15. Student Eligibility

---

# Business Questions

## Question 1

Has this student already applied?

Object:
Application__c

Fields

- Student__c
- Job__c
- Status__c

---

## Question 2

Which companies are accepting applications?

Object

Job__c

Fields

- Company_Name__c
- Status__c
- Closing_Date__c

---

## Question 3

How many students are selected by Amazon?

Object

Application__c

Fields

- Student__c
- Company__c
- Status__c

---

## Question 4

Which students satisfy Microsoft's eligibility?

Objects

Student__c
Job__c

Fields

- Student CGPA
- Branch
- Minimum CGPA
- Eligible Branch

---

# Conclusion

SOQL retrieves business information.

DML modifies business information.

Both work together to implement Salesforce business logic.
# Sprint 5 – Retrieving and Managing Information with SOQL and DML

## Sprint Objective

Learn how Salesforce applications retrieve information using SOQL and modify information using DML to complete business transactions.

---

# Learning Outcomes

After completing this sprint, I can:

- Retrieve Salesforce records using SOQL.
- Create new Salesforce records using DML.
- Update existing records.
- Delete records.
- Understand enterprise business transactions.
- Combine SOQL, DML and Apex.

---

# Business Scenario

A student applies for a job.

The system performs the following sequence:

Student Clicks Apply

↓

Retrieve Student Details

↓

Retrieve Job Details

↓

Validate Eligibility

↓

Check Duplicate Application

↓

Create Application Record

↓

Save Application

↓

Display Confirmation

---

# SOQL (Salesforce Object Query Language)

SOQL is used to retrieve data from Salesforce.

## Query 1 – Retrieve all Applications

```sql
SELECT Id,
       Name,
       Status__c
FROM Application__c
```

---

## Query 2 – Retrieve one Application

```sql
SELECT Id,
       Name,
       Status__c
FROM Application__c
LIMIT 1
```

---

## Query 3 – Retrieve Selected Applications

```sql
SELECT Id,
       Name,
       Status__c
FROM Application__c
WHERE Status__c='Selected'
```

---

## Query 4 – Retrieve Applied Applications

```sql
SELECT Id,
       Name,
       Status__c
FROM Application__c
WHERE Status__c='Applied'
```

---

## Query 5 – Retrieve Latest Applications

```sql
SELECT Id,
       Name,
       Status__c
FROM Application__c
ORDER BY CreatedDate DESC
```

---

## Query 6 – Count Applications

```sql
SELECT COUNT()
FROM Application__c
```

---

## Query 7 – Retrieve Applications with Created Date

```sql
SELECT Id,
       Name,
       Status__c,
       CreatedDate
FROM Application__c
ORDER BY CreatedDate DESC
```

---

# DML (Data Manipulation Language)

DML is used to modify Salesforce records.

Operations include:

- Insert
- Update
- Delete

---

## INSERT Example

```apex
Application__c app = new Application__c();

app.Status__c='Applied';

insert app;
```

---

## UPDATE Example

```apex
Application__c app = [
    SELECT Id, Status__c
    FROM Application__c
    LIMIT 1
];

app.Status__c='Selected';

update app;
```

---

## DELETE Example

```apex
Application__c app = [
    SELECT Id
    FROM Application__c
    LIMIT 1
];

delete app;
```

---

# DataService Methods

The DataService class provides reusable methods.

### Retrieve All

```apex
getApplications()
```

### Retrieve One

```apex
getApplication(Id applicationId)
```

### Create

```apex
createApplication(Application__c application)
```

### Update

```apex
updateApplication(Application__c application)
```

### Delete

```apex
deleteApplication(Application__c application)
```

---

# Difference Between SOQL and DML

| SOQL | DML |
|------|-----|
| Retrieves records | Modifies records |
| Read operation | Write operation |
| Used before validation | Used after validation |

---

# Engineering Principles

- Retrieve data before making decisions.
- Validate business rules before changing records.
- Use SOQL for reading data.
- Use DML for writing data.
- Separate business logic from database operations.
- Technology should always follow business requirements.

---

# Sprint Activities Completed

- Created DataService class.
- Retrieved Application records.
- Executed SOQL queries.
- Performed INSERT operation.
- Performed UPDATE operation.
- Performed DELETE operation.
- Verified Debug Logs.
- Successfully deployed Apex classes.

---

# Sprint Checkpoint

### Why retrieve information before making decisions?

To validate business rules before performing operations.

### Why is SOQL required?

SOQL retrieves Salesforce records.

### Why is DML required?

DML creates, updates and deletes Salesforce records.

### When should new records be created?

When new business information needs to be stored.

### When should existing records be updated?

When existing business information changes.

### Why should business validation happen before DML?

To ensure accurate, consistent and reliable data.

---

# Conclusion

Sprint 5 introduced the concepts of SOQL and DML in Salesforce.

Using Apex, SOQL and DML together allows enterprise applications to retrieve information, validate business rules and complete business transactions efficiently.
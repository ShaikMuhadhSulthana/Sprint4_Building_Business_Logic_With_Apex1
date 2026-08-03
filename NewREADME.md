## Sample SOQL Queries

Retrieve all applications

```sql
SELECT Id, Name, Status__c
FROM Application__c
```

Retrieve selected applications

```sql
SELECT Id, Name, Status__c
FROM Application__c
WHERE Status__c='Selected'
```

Retrieve applied applications

```sql
SELECT Id, Name, Status__c
FROM Application__c
WHERE Status__c='Applied'
```

Retrieve latest applications

```sql
SELECT Id, Name, Status__c
FROM Application__c
ORDER BY CreatedDate DESC
```

Count application records

```sql
SELECT COUNT()
FROM Application__c
```
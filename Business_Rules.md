# Placement Management System - Business Rules

---

# Introduction

Business rules define the decisions that the Placement Management System should automatically make according to organisation requirements.

These rules help maintain accuracy, reduce manual work, and ensure that only eligible students participate in placement activities.

---

# Placement Application Rules

| Requirement | Business Rule |
|------------|---------------|
| Student applies for job | Check student eligibility before accepting application |
| No active backlogs allowed | Reject students with active backlogs |
| Minimum CGPA required | Compare student CGPA with company criteria |
| Deadline restriction | Reject applications after closing date |
| Duplicate applications | Prevent same student applying twice for same job |
| Company eligibility | Check branch restrictions |
| Recruiter notification | Send notification after successful application |

---

# Detailed Business Rules

## 1. Student Eligibility Rule

Before accepting an application, the system must verify whether the student satisfies company requirements.

Checks include:

- Minimum CGPA
- Academic eligibility
- Active backlogs
- Branch eligibility


---

## 2. Backlog Verification Rule

Students with active backlogs should not be allowed to apply for companies that require no backlogs.

---

## 3. CGPA Validation Rule

The student's CGPA should be compared with the minimum CGPA requirement defined by the company.

---

## 4. Application Deadline Rule

Students should not be allowed to submit applications after the company's application closing date.

---

## 5. Duplicate Application Rule

A student should not be allowed to apply multiple times for the same job opportunity.

---

## 6. Company Eligibility Rule

The system should verify whether the student's branch matches company requirements.

---

## 7. Notification Rule

After successful application submission, the recruiter or placement officer should receive a notification.

# 🚗 Car Rental System Database Project

## 📌 Project Overview
The **Car Rental System Database Project** is designed to manage and analyze the operations of a car rental service. This project demonstrates the use of **SQL database design**, table relationships, constraints, and query handling to efficiently manage customer bookings, car details, payments, maintenance records, and customer feedback.

The system helps in:
- Managing customer and car information
- Tracking bookings and payments
- Monitoring car maintenance
- Collecting customer feedback
- Generating business insights using SQL queries

---

## 🛠️ Technologies Used

| Technology | Purpose |
|------------|---------|
| MySQL | Database Management |
| SQL | Query Writing & Data Handling |
| MySQL Workbench | Database Development Tool |

---

## 📂 Database Tables

The project contains the following tables:

### 1️⃣ Customer
Stores customer details such as:
- Customer Name
- Address
- Mobile Number
- Email ID
- Driver License
- Preferred Payment Method

### 2️⃣ Location
Stores pickup and drop location details.

### 3️⃣ Cars
Stores car-related information:
- Manufacturer
- Model
- Year
- License Plate
- Car Status

### 4️⃣ Booking
Manages booking records:
- Pickup & Return Dates
- Pickup & Return Locations
- Booking Status

### 5️⃣ Payment
Stores payment details:
- Payment Amount
- Payment Method
- Payment Status

### 6️⃣ Maintenance
Tracks maintenance activities:
- Oil Change
- Tire Rotation
- Brake Inspection
- Battery Replacement

### 7️⃣ Feedback
Stores customer reviews and ratings.

---

## 🔗 Database Relationships

The project uses:
- ✅ Primary Keys
- ✅ Foreign Keys
- ✅ One-to-Many Relationships
- ✅ Constraints
- ✅ ENUM Datatypes

Examples:
- One customer can make multiple bookings
- One car can have multiple maintenance records
- One booking can have one payment record

---

## 🔍 SQL Operations Performed

### ✅ Table Creation
Created multiple relational tables using:
```sql
CREATE TABLE
```

### ✅ Data Insertion
Inserted sample records using:
```sql
INSERT INTO
```

### ✅ Data Retrieval
Used:
```sql
SELECT
```

### ✅ Joins
Performed:
- INNER JOIN
- Multi-table JOIN operations

### ✅ Aggregate Functions
Used:
- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

### ✅ Filtering & Sorting
Used:
- WHERE
- ORDER BY
- GROUP BY

---

## 📊 Sample Business Insights

- Total revenue generated from bookings
- Most preferred payment method
- Cars currently available for rent
- Customers with failed payments
- Cars under maintenance
- Average customer ratings
- Total bookings by status

---

## 🚀 Features of the Project

- Relational Database Design
- Foreign Key Constraints
- Customer Booking Management
- Payment Tracking
- Maintenance Monitoring
- Customer Feedback System
- SQL Query Analysis

---


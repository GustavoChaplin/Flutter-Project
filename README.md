# 💰 Personal Finance Management System

A full-stack personal finance management application designed to help users track income, expenses, recurring payments, budgets, and savings goals.
This project uses Microsoft SQL Server as the relational database and Flutter (Dart) for the client application.

It is being developed as part of my academic journey in Systems Analysis and Development, combined with practical experience working daily with databases in a professional environment.

---

## 🚀 Tech Stack

### Backend / Database

* Microsoft SQL Server (SSMS)
* T-SQL
* Relational Database Modeling
* Constraints (PK, FK, CHECK, UNIQUE)

### Frontend

* Flutter
* Dart
* Material UI components
* REST-ready architecture (planned integration)

---

## 📊 Project Goals

The main objective of this project is to provide a robust financial control system that allows users to:

* Track personal income and expenses
* Manage recurring expenses (subscriptions, installments, etc.)
* Create savings goals (“pots”)
* Define and monitor budgets
* Analyze financial balance over time

The database was carefully modeled to ensure data integrity, scalability, and clear financial semantics.

---

## 🧱 Database Architecture

The system is built around five core entities:

### 👤 Users

Stores personal and authentication data.

**Highlights:**

* Unique email and CPF
* Gender validation with CHECK constraint
* Creation timestamp for auditing

---

### 🔁 Recurring Bills

Represents recurring expenses such as subscriptions or installment payments (e.g., streaming services, car financing).

Supports:

* Monthly or installment-based payments
* Tracking paid vs. total installments
* Active/inactive recurring expenses
* Start and optional end dates

---

### 💳 User Transactions

Stores all financial transactions performed by users.

Features:

* Income and expense tracking
* Creation and payment dates
* Optional relation with recurring bills
* Optional relation with savings goals (“pots”)

This table is the core of the financial analysis layer.

---

### 🏦 Pots (Savings Goals)

Allows users to define savings targets for specific goals (e.g., travel, emergency fund).

Includes:

* Target value
* Current saved amount
* Relationship with the owning user
* Creation timestamp

---

### 📊 Budgets

Defines spending limits for different financial planning scenarios.

Supports:

* Budget title
* Current spent value
* Maximum allowed limit
* User ownership and tracking

---

## 🛡️ Data Integrity & Constraints

The database design enforces strong integrity rules, including:

* Primary Keys for all entities
* Foreign Keys to ensure relational consistency
* Unique constraints for sensitive user data (email and CPF)
* Check constraints for controlled fields (gender, recurrence type)
* Default timestamps for auditing (`created_at`)

These constraints help guarantee consistency and reliability for financial data operations.

---

## 📱 Application Layer (Flutter)

The Flutter application will serve as the user interface for interacting with the system, enabling:

* Dashboard with financial overview
* Transaction registration and visualization
* Recurring expense management
* Budget tracking
* Savings goal progress monitoring

The frontend is designed to be clean, responsive, and scalable for future feature expansion.

---

## 📈 Future Improvements

Planned enhancements include:

* Transaction categorization system
* Financial analytics dashboards
* Authentication and authorization layer
* REST API integration between Flutter and SQL Server
* Advanced reporting and insights generation

---

## 🎓 Academic & Professional Context

This project was developed as part of my academic studies in Systems Analysis and Development and reflects practical experience working daily with SQL databases in a professional environment.

It demonstrates:

* Database modeling skills
* Financial domain logic implementation
* Full-stack system planning
* Clean and maintainable schema design

---

## 📄 License

This project is for educational and portfolio purposes.

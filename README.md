# 📚 Library Data Management System (MySQL)

This project is a Library Data Management System implemented using MySQL.
It simulates the structure and operations of a real-world library system, including management of books, authors, publishers, members, borrowings, reviews, and financial transactions.


# 🔧 Features
- Relational Database Design with proper foreign key constraints and normalization.

- Book Borrowing & Returning System with tracking of return status.

- Author-Book Mapping supporting many-to-many relationships.

- Book Reviews & Ratings.

- Inventory Tracking for individual book copies.

- Transaction Records for purchases and borrowing.

- Data Analytics Queries for insights like most borrowed books, average borrow duration, top genres, and revenue tracking.


# 🗃️ Database Schema
Tables:

- Books
  
- Authors
  
- Publishers
  
- Members
  
- Borrowings
  
- Book_Copies
  
- Authors_Books
  
- Reviews
  
- Transactions

Each table is designed with appropriate primary keys, foreign keys, and constraints.


# Data Architecture

![Untitled Diagram drawio](https://github.com/user-attachments/assets/4067b408-f4e0-4ce1-a65c-4dcd93dd9a31)



# 📥 Sample Data
The script inserts realistic data for:

10 publishers

10 books with references to publishers

10 authors and their mappings to books

5 library members

Multiple borrowings and returns

10 book reviews

Book copies on different shelves

10 financial transactions

# 📊 Analytical SQL Queries
This project includes over 15 insightful queries such as:

- Books borrowed by specific members

- Most popular genres

- Books with highest average ratings

- Members who borrowed more/less than a threshold

- Total revenue from purchases

- Top 10 most borrowed books

- Overdue borrowings

- Book availability

- Year-wise publication stats

 # 🔐 User Access Control
A view is created for transactions with limited access to another user.

```python
CREATE USER 'ahmed9667'@'localhost' IDENTIFIED BY 'ahly987';
GRANT SELECT ON library.transactions TO 'ahmed9667'@'localhost';
```

# 🧠 Skills & Technologies
- SQL (DDL & DML)

- Relational Database Design

- MySQL

- Data Modeling

- Joins, Aggregations, Grouping

- Query Optimization

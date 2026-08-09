# Retail Sales & Customer Analytics — MySQL

An intermediate-level MySQL database project designed to practice relational database design and business-oriented data analysis.

## Objective

Build a small retail database and answer practical questions about:

- Customers
- Products
- Categories
- Orders
- Order items
- Payments
- Sales revenue
- Customer spending
- Product performance

## Tech Stack

- MySQL 8.x
- SQL
- MySQL Workbench
- Git / GitHub

## Database Design

The project contains six related tables:

`categories` → `products`  
`customers` → `orders` → `order_items` → `products`  
`orders` → `payments`

## SQL Concepts Demonstrated

- Database and table creation
- Primary and foreign keys
- Constraints
- INSERT statements
- Filtering and sorting
- Aggregate functions
- GROUP BY and HAVING
- INNER JOIN and LEFT JOIN
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- CASE expressions
- Views
- Stored procedures
- Transactions
- Business-oriented analytical queries

## How to Run

1. Open MySQL Workbench.
2. Run `01_schema.sql`.
3. Run `02_sample_data.sql`.
4. Run `03_analysis_queries.sql`.
5. Run `04_views.sql`.
6. Run `05_procedures.sql`.
7. Review `06_transaction_example.sql`.

## Description

**Retail Sales & Customer Analytics Database | MySQL**
- Designed a relational retail database with customers, products, orders, order items, categories and payments using primary/foreign keys and constraints.
- Developed analytical SQL queries using joins, aggregation, subqueries, CTEs and window functions to analyze revenue, customer spending and product performance.
- Created reusable views and a stored procedure for customer order analysis and demonstrated transaction management using COMMIT and ROLLBACK.

## Future Enhancements

- Add triggers after learning them properly.
- Add more realistic data.
- Connect the database to a Java/Python application.
- Add an ETL/data-cleaning layer.
- Create a dashboard using Power BI or another visualization tool.

# Retail Sales & Customer Analytics — MySQL

An intermediate-level MySQL database project designed to practice relational database design, advanced SQL, and business-oriented data analysis using a realistic retail sales scenario.

## Objective

Build a relational retail database and answer practical business questions related to:

* Customers
* Products
* Categories
* Orders
* Order items
* Payments
* Sales revenue
* Customer spending
* Product performance
* Inventory management

## Tech Stack

* MySQL 8.x
* SQL
* MySQL Workbench
* Git / GitHub

## Database Design

The project contains seven related tables:

```text
categories → products
customers → orders → order_items → products
orders → payments
payments → payment_audit
```

### Main Tables

| Table           | Purpose                                               |
| --------------- | ----------------------------------------------------- |
| `categories`    | Stores product categories                             |
| `customers`     | Stores customer information                           |
| `products`      | Stores products, prices, and stock quantities         |
| `orders`        | Stores customer orders                                |
| `order_items`   | Stores products and quantities included in each order |
| `payments`      | Stores payment information and payment status         |
| `payment_audit` | Stores payment status change history                  |

## SQL Concepts Demonstrated

* Database and table creation
* Primary keys and foreign keys
* Constraints
* `INSERT`, `UPDATE`, and `DELETE`
* Filtering and sorting
* Aggregate functions
* `GROUP BY` and `HAVING`
* `INNER JOIN` and `LEFT JOIN`
* Subqueries
* Common Table Expressions (CTEs)
* Window functions
* `CASE` expressions
* Views
* Stored procedures
* Transactions
* Triggers
* `OLD` and `NEW` trigger values
* Business-oriented analytical queries

## Key SQL Features

### Views

Created reusable views to simplify frequently used analytical queries.

### Stored Procedures

Created stored procedures to retrieve customer order details and perform reusable database operations.

### Transactions

Demonstrated transaction management using:

* `COMMIT`
* `ROLLBACK`

### Triggers

Implemented and tested triggers for automated database operations.

#### 1. Inventory Stock Update

When a new order item is inserted, the trigger automatically reduces the corresponding product's stock quantity.

```text
New order item
      ↓
Trigger
      ↓
Product stock quantity decreases
```

#### 2. Payment Status Audit

When a payment status is updated, the trigger records the previous and new payment status in the `payment_audit` table.

```text
Payment status updated
        ↓
      Trigger
        ↓
OLD status + NEW status
        ↓
payment_audit
```

This demonstrates the use of `OLD` and `NEW` values in MySQL triggers.

## Business Analysis

The project includes business-oriented SQL queries covering areas such as:

### Customer Analysis

* Customer spending
* Customers with no orders
* Customers spending above average
* Customer order analysis

### Product Analysis

* Product performance
* Product ranking
* Product sales
* Inventory analysis

### Sales Analysis

* Revenue by category
* Monthly revenue
* Order-level revenue
* Average order value

### Payment Analysis

* Payment methods
* Payment status
* Payment analysis

## Project Structure

```text
retail-sales-mysql-analytics/
│
├── 01_schema.sql
├── 02_sample_data.sql
├── 03_analysis_queries.sql
├── 04_views.sql
├── 05_procedures.sql
├── 06_transaction_example.sql
└── 07_triggers.sql
```

## How to Run

1. Open MySQL Workbench.
2. Run `01_schema.sql` to create the database and tables.
3. Run `02_sample_data.sql` to insert sample data.
4. Run `03_analysis_queries.sql` to execute analytical queries.
5. Run `04_views.sql` to create and test views.
6. Run `05_procedures.sql` to create and test stored procedures.
7. Run `06_transaction_example.sql` to review transaction examples.
8. Run `07_triggers.sql` to create and test the triggers.

> Run the scripts in the recommended order because later scripts depend on the database objects created by earlier scripts.

## Project Description

**Retail Sales & Customer Analytics Database | MySQL**

* Designed a relational retail database with customers, products, orders, order items, categories, payments, and payment audit records using primary/foreign keys and constraints.
* Developed business-oriented analytical queries using joins, aggregation, subqueries, CTEs, and window functions to analyze revenue, customer spending, product performance, and sales trends.
* Created reusable views and stored procedures for common analytical operations.
* Implemented transactions using `COMMIT` and `ROLLBACK` to demonstrate transaction management.
* Implemented triggers for automatic inventory updates and payment status auditing using `OLD` and `NEW` values.

## Future Enhancements

* Add more realistic and larger datasets.
* Add additional advanced SQL business-analysis queries.
* Build an ETL/data-cleaning workflow.
* Connect the MySQL database to a Java or Python application.
* Create an interactive Power BI dashboard using the retail sales data.
* Add an ER diagram and project screenshots for better documentation.

## Learning Outcomes

Through this project, I gained practical experience in:

* Relational database design
* SQL querying and data analysis
* Table relationships and foreign keys
* Advanced SQL techniques
* Stored procedures and views
* Transaction management
* Trigger-based automation
* Business-oriented problem solving using SQL

## Future Goal

The next stage of this project is to connect the MySQL database with **Power BI** and build an interactive retail sales analytics dashboard.

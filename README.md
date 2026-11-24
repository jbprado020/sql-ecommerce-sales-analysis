# 🛒 E-Commerce Sales Analysis (SQL Mini-Project)

A beginner-friendly SQL project analyzing a mock online store's sales data. Built with **PostgreSQL**.

## 📌 Goal

Practice writing clean, readable SQL queries to answer real business questions and communicate findings in plain English.

## 🛠️ Tools

- PostgreSQL
- VS Code (with the PostgreSQL extension)
- psql (optional, for running `.sql` files from terminal)

## 🗃️ Dataset

The data is mock/self-generated and stored in `seed.sql`. No external download required.

## 📊 Schema

| Table | Description |
|-------|-------------|
| `customers` | Shoppers who placed orders |
| `products` | Items sold in the store |
| `orders` | Purchase records linked to a customer |
| `order_items` | Line items within each order |

## 🔍 Key Queries (`queries.sql`)

1. Total revenue by product category
2. Top 5 customers by lifetime spend
3. Monthly revenue trend
4. Average order value (using a CTE)
5. Inactive customers (no orders in last 30 days)
6. Top-ranked products within each category (window function)
7. Order status breakdown

## ▶️ How to run

### Option A: VS Code PostgreSQL extension
1. Install the **PostgreSQL** extension by Microsoft in VS Code.
2. Connect to your local PostgreSQL server (`localhost:5432`).
3. Open `schema.sql` → run it.
4. Open `seed.sql` → run it.
5. Open `queries.sql` → run each query one by one.

### Option B: Terminal (psql)
```bash
# Create a database first
createdb ecommerce_analysis

# Run schema and seed
psql -U postgres -d ecommerce_analysis -f schema.sql
psql -U postgres -d ecommerce_analysis -f seed.sql

# Run queries
psql -U postgres -d ecommerce_analysis -f queries.sql
```

## 📈 Key Insights

See `insights.md` for a plain-English summary of what the data says.

## 🚀 What I learned

- Writing `JOIN`s across 4 tables
- Using `GROUP BY`, `HAVING`, and aggregate functions
- Using a CTE to break a query into steps
- Using a window function (`RANK()`) to rank within groups
- Writing readable, commented SQL for others to review

---

## 📂 Recommended GitHub structure

```
sql-ecommerce-sales-analysis/
├── data/              # (optional) raw CSV exports
├── schema.sql
├── seed.sql
├── queries.sql
├── insights.md
└── README.md
```

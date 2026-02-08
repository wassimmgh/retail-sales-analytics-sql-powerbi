# Data Dictionary – Retail Sales Dataset

## 📌 Description

This dataset represents retail sales transactions from a Superstore.

Each row corresponds to a single product sold within a customer order.

---

## 📊 Columns

| Column Name     | Description |
|-----------------|------------|
| order_id        | Unique identifier of the order |
| order_date      | Date when the order was placed |
| ship_date       | Date when the order was shipped |
| ship_mode       | Shipping method used |
| customer_id     | Unique customer identifier |
| customer_name   | Customer full name |
| segment         | Customer segment (Consumer, Corporate, Home Office) |
| country         | Country name |
| region          | Region name |
| state           | State name |
| city            | City name |
| product_id      | Unique product identifier |
| category        | Product category |
| sub_category    | Product sub-category |
| product_name    | Product name |
| sales           | Sales amount (USD) |
| quantity        | Quantity ordered |
| discount        | Discount applied |
| profit          | Profit amount (USD) |

---

## 📝 Notes

- Monetary values are expressed in **USD**.
- One order can contain multiple products.
- Dates were originally stored as text and converted using `STR_TO_DATE()` for analysis.

# Setup & Import Notes

## Database Setup

- Database: retail_sales
- Tool: MySQL (via DBeaver)

## Data Import

The dataset `superstore.csv` was imported into MySQL.

Main issues encountered:
- Order Date and Ship Date were stored as VARCHAR.
- Dates were converted using STR_TO_DATE().

Example conversion:

```sql
STR_TO_DATE(`Order Date`, '%m/%d/%Y')


#  NTI Retail Sales Analytics Project

A comprehensive, multi-platform Business Intelligence initiative transforming multichannel retail data (2023–2025) into executive-ready insights. This project was developed collaboratively as part of the NTI training program.

---

##  Project Overview
* **Dataset Scope:** 5,000 transactions, 5 stores, 200 customers, and 50 products spanning the 2023–2025 fiscal periods.
* **Objective:** Build an end-to-end data architecture—from raw data processing to interactive executive dashboards—covering customer behavior, product profitability, regional performance, and temporal trends.

---

##  Data Architecture & Star Schema
The project is built on a robust **Star Schema** centered around a main fact table and rich dimensional tables:
* **Fact Table:** `Fact_Transactions` (5,000 records capturing financial and operational metrics at the transaction level: *Quantity, TotalPriceAfterDiscount, TotalCost, Profit*).
* **Dimension Tables:** `Customers`, `Products`, `Stores`, `Dates`, and `PaymentMethods`.

---

##  Executive Key Performance Indicators (KPIs)
* **Total Sales (After Discount):** $14.30M ($14,301,904)
* **Total Profit:** $3.83M ($3,826,315)
* **Total Cost:** $10.48M ($10,475,589)
* **Total Discounts:** $1.17M ($1,173,269)
* **Total Units Sold:** 14,949 units across 5,000 transactions.

---

##  Technical Stack & Team Workflow

| Tool / Technology | Key Responsibilities & Deliverables | Team Member |
| :--- | :--- | :--- |
| **Python** | Data preprocessing, cleaning, and dimensional modeling (Star Schema). | Rahma Omar |
| **Excel (1)** | Data transformation, Power Query, and table relationships. | Ahmed Maged |
| **SQL** | Customer behavior, product profitability, and regional performance analysis. | Magdy Elhosseny |
| **Excel (2)** | KPI modeling, pivot tables, and multi-dimensional dashboard with cross-filtering. | Mariam Mahran |
| **Power BI (1)** | Data model, DAX measures, Home & Sales Overview pages. | Tasneem Magdy |
| **Tableau** | Interactive dashboards, storyboards, and KPI cards. | Mohamed Nabil |
| **Power BI (2)** | Product & Customer pages, custom themes, formatting, and navigation. | Habiba Hany |

---

##  Key Analytical Insights
1. **Sales by Category:** Revenue is nearly split between **Electronics (44.17% / ~$6.32M)** and **Fashion (43.58% / ~$6.23M)**, while **Groceries (12.26% / ~$1.75M)** acts as a high-frequency, lower-margin niche.
2. **Regional Performance:** The **East** region leads all territories, generating **$5.60M (39.2% of total sales)**.
3. **Temporal Trends:** **Q2** achieved peak business performance with **$3.81M** in revenue and **$1.03M** in profit.
4. **Payment Preferences:** Transactions are evenly distributed across payment methods (**Cash**, **Credit Card**, **Mobile Money**, and **Bank Transfer** ~1,280 transactions each).

---

##  Deliverables & Repository Structure
```text
├── Python/                  # Jupyter Notebooks & cleaning scripts
├── SQL/                     # SQL queries & business analysis scripts
├── Power_BI/                # Interactive .pbix dashboards (4-page reports)
├── Tableau/                 # Tableau packaged workbooks (.twbx)
└── Excel/                   # Excel dashboards & KPI scorecards

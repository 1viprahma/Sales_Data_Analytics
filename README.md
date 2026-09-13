#  Enterprise-Grade Multichannel Retail Sales Analytics Project

A comprehensive, multi-platform Business Intelligence (BI) and Data Engineering initiative transforming multi-year retail transactions (2023–2025) into executive-ready strategic insights. This project demonstrates an end-to-end data lifecycle—from raw data preprocessing and relational modeling to advanced SQL querying, interactive Power BI/Tableau reporting, and Excel financial scorecards.

---

##  Table of Contents
- [Project Overview](#-project-overview)
- [Project Architecture & Pipeline](#-project-architecture--pipeline)
- [Data Modeling & Star Schema](#-data-modeling--star-schema)
- [Executive KPIs & Financial Summary](#-executive-kpis--financial-summary)
- [Advanced SQL Analytics](#-advanced-sql-analytics)
- [Interactive Dashboards & Deliverables](#-interactive-dashboards--deliverables)
- [Key Business Insights & Findings](#-key-business-insights--findings)
- [Technical Stack & Team Contributions](#-technical-stack--team-contributions)
- [Repository Directory Structure](#-repository-directory-structure)

---

##  Project Overview
* **Dataset Scope:** 5,000 granular transactions, 5 physical stores, 200 unique customers, and 50 retail products spanning fiscal periods from **2023 to 2025**.
* **Core Objective:** Design and implement a scalable, unified data analytics framework across 5 distinct analytical ecosystems (Python, SQL, Power BI, Excel, and Tableau) to evaluate customer lifetime value, category profitability, regional sales dynamics, and temporal behavior.

---

##  Project Architecture & Pipeline
1. **Data Extraction & Ingestion:** Raw multi-sheet data ingested and audited using Python (`pandas`).
2. **Data Cleaning & Preprocessing:** 
   * Handled data types, stripped inconsistent string prefixes (e.g., converting IDs to clean integers), and validated schema integrity.
   * Ensured zero null values and eliminated duplicate records across all transactional logs.
3. **Dimensional Modeling:** Built explicit dimension tables (`Dates`, `PaymentMethods`) and calculated derived financial measures (*PriceBeforeDiscount, TotalPriceAfterDiscount, TotalCost, Profit*).

---

##  Data Modeling & Star Schema
The project relies on a optimized **Star Schema** to ensure high query performance and seamless cross-tool integration:
* **Fact Table (`Fact_Transactions`):** Contains 5,000 records capturing low-level operational metrics: *Quantity, Discount, UnitPrice, CostPrice, TotalPriceAfterDiscount, TotalCost, and Net Profit*.
* **Dimension Tables:**
  * `Customers`: Demographic data, join dates, and computed age metrics.
  * `Products`: Categories, subcategories, and pricing tiers.
  * `Stores`: Physical locations and geographical regions.
  * `Dates`: Time-intelligence hierarchy (Year, Quarter, Month, Day of Week).
  * `PaymentMethods`: Transaction channel classifications.

---

##  Executive KPIs & Financial Summary
* **Total Sales (Net of Discounts):** `$14,301,904` (~$14.30M)
* **Total Gross Profit:** `$3,826,315` (~$3.83M)
* **Total Operational Cost:** `$10,475,589` (~$10.48M)
* **Total Discounts Given:** `$1,173,269` (~$1.17M)
* **Volume:** `14,949` total units sold across `5,000` transactions.

---

##  Advanced SQL Analytics
Key business questions answered via the SQL data pipeline (`NTI_SQL_Project.sql`):
* **Customer Tenure & Segmentation:** Evaluated customer age distribution, registration timelines, and lifetime spend (`CLV`).
* **Product Profitability:** Calculated unit-level margins, identifying top-performing product lines by net profit.
* **Store & Regional Benchmarking:** Ranked stores by aggregate transaction volume and profit generation to isolate top-tier vs. underperforming branches.
* **Temporal Analysis:** Tracked longitudinal sales trends on a monthly and yearly basis to isolate seasonality.

---

##  Interactive Dashboards & Deliverables
* **Power BI (`.pbix`):** A 4-page dynamic corporate report featuring:
  * *Home & Sales Overview:* Executive summary cards and high-level trends.
  * *Product & Customer Pages:* Deep dives into category performance, purchasing habits, and dynamic slicers with custom branding and consistent navigation design.
* **Tableau (`.twbx`):** A 3-part interactive storyboard (*Overview, Analysis, Storyboard*) highlighting store performance vectors and sub-category profitability maps.
* **Excel Dashboards:** Multi-dimensional pivot tables, interactive cross-filtering elements, and financial KPI scorecards.

---

##  Key Business Insights & Findings
1. **Category Split:** Revenue is heavily anchored by **Electronics ($6.32M / 44.17%)** and **Fashion ($6.23M / 43.58%)**, whereas **Groceries ($1.75M / 12.26%)** operates as a high-frequency, low-margin supplementary category.
2. **Regional Dominance:** The **East** region leads all operational areas, contributing **$5.60M (39.2%)** of total enterprise sales.
3. **Quarterly Peak:** **Q2** delivered peak historical performance, recording **$3.81M** in revenue and **$1.03M** in profit.
4. **Payment Channel Parity:** Payment methods show an almost perfectly balanced distribution across **Cash**, **Credit Card**, **Mobile Money**, and **Bank Transfer** (~1,280 transactions each), indicating healthy multichannel adoption.

---

##  Technical Stack & Team Workflow

| Ecosystem / Tool | Core Responsibilities & Contributions | Contributor |
| :--- | :--- | :--- |
| **Python** | Data cleaning, type casting, derived metric generation, & Star Schema design. | Rahma Omar |
| **Excel (Stage 1)** | Data transformation, Power Query implementation, and initial relationship mapping. | Ahmed Maged |
| **SQL** | Complex querying, customer behavior analytics, profitability tracking, & regional metrics. | Magdy Elhosseny |
| **Excel (Stage 2)** | Advanced KPI scorecards, multi-dimensional pivot tables, and cross-filtering dashboards. | Mariam Mahran |
| **Power BI (Part 1)** | Core data modeling, complex DAX measures, Home page, and Sales Overview layout. | Tasneem Magdy |
| **Tableau** | End-to-end interactive storyboards, visual KPI cards, and store performance sheets. | Mohamed Nabil |
| **Power BI (Part 2)** | Product/Customer reporting pages, custom UI theming, visual hierarchy, and bookmark navigation. | Habiba Hany |

---

##  Repository Directory Structure
```text
├── Python/
│   ├── NTI_Py_Project.ipynb        # Jupyter notebook containing cleaning & modeling code
│   └── cleaned_retail_sales.xlsx     # Processed and structured Excel export
├── SQL/
│   └── NTI_SQL_Project.sql           # Complete script of analytical business queries
├── Power_BI/
│   └── NTI-PowerBI_Project.pbix      # Interactive multi-page corporate report
├── Tableau/
│   └── project111.twbx               # Tableau packaged workbook and storyboards
├── Excel/
│   └── NTI_Excel_Project.xlsx        # Excel-based reporting models and pivot dashboards
└── Presentation/
    └── NTI_Presentation.pdf          # Executive project presentation slides

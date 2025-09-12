# 🗃️Data Warehousing – Scratch to Modern Analytics

### 📋 Project Summary

This project presents a complete, real-world build of a **SQL Data Warehouse**, unifying raw ERP & CRM data sources into a robust analytics foundation. Designed for **business intelligence, reporting, and data-driven decisions**, the solution applies best practices in modern data warehousing and ETL development.

✨ **Key Highlights:**
- 🔄 **Automated ETL:** Reliable, repeatable data ingestion and transformations using SQL Server
- 🧹 **Data Cleansing:** Removal of errors, resolving inconsistencies, handling missing values
- 🔗 **Data Integration:** Seamless merge of heterogeneous (ERP + CRM) datasets
- 📊 **Analytics-Ready:** Business-focused data models and star schema for easy reporting
- 📝 **Comprehensive Documentation:** Clear instructions, data catalog, and process overview

---

### 📂 Folder Structure

> ```
>├── 1. raw datasets/ # 📂 Source data (ERP & CRM CSV files)
>├── 2. bronze/ # 🥉 Staging tables - untouched raw data
>├── 3. silver/ # 🥈 Cleaned & integrated data
>├── 4. gold/ # 🥇 Business-ready data/views/reports
>├── 5. script/ # 📂 Database intialization script
>└── README.md # 👈 Project overview
> ```

---

### 🏗️ Data Architecture (Medallion Model)

This project implements the **Medallion Architecture** to ensure clarity, scalability, and maintainability. 
| Layer         | Purpose                                                                                       |
|:--------------|:---------------------------------------------------------------------------------------------| 
| 🥉 **2. bronze**   | Raw, untouched data loaded into staging tables for traceability                          |
| 🥈 **3. silver**   | Cleaned, validated, and integrated data for analytics preparation                        |
| 🥇 **4. gold**     | Business-ready marts/views for analytics & BI (star schema, reporting)                   |

<img width="1000" height="600" alt="Screenshot 2025-09-12 102923" src="https://github.com/user-attachments/assets/6d16d9ff-a263-4f38-a475-59d42c7cdd30" />


### 🛠️ Tools Used
- **SQL Server Express** 🗄️
- **SQL Server Management Studio (SSMS)** 🖥️
- **Draw.io**📝 (Design data architecture, models, flows, and diagrams.)
- **Git & GitHub** 🌐

### ⚙️ ETL Techniques Applied
- ⏮️ **Full data loads** (truncate & insert strategy)
- 🧽 **Data cleaning** (deduplication, type casting, resolving missing values)
- 🔁 **Data integration** (merging ERP and CRM sources)
- 🤖 **SQL scripts & stored procedures** for automating repeatable workflows

---

### 🔄 Data Flow Diagram – Layered ETL Architecture

This diagram captures the end-to-end journey of data through each stage of the data warehouse:

#### 1️⃣ Sources

- **CRM & ERP CSV Files:**  
  The process begins with external data exported from CRM and ERP systems, in CSV format.

#### 2️⃣ Bronze Layer (Staging)

- **Tables:**  
  - `crm_cust_info`  
  - `crm_prd_info`  
  - `crm_sales_details`  
  - `erp_cust_az12`  
  - `erp_loc_a101`  
  - `erp_px_cat_g1v2`
- **Role:**  
  Each source CSV is loaded exactly as-is into its respective Bronze table, preserving data fidelity and supporting full traceability.

#### 3️⃣ Silver Layer (Cleansing & Integration)

- **Tables:**  
  - `crm_cust_info`  
  - `crm_prd_info`  
  - `crm_sales_details`  
  - `erp_cust_az12`  
  - `erp_loc_a101`  
  - `erp_px_cat_g1v2`
- **Role:**  
  Source data undergoes validation, cleansing, and standardization. No major schema changes yet: structure generally matches Bronze, with improved data quality.

#### 4️⃣ Gold Layer (Analytics/BI Models)

- **Tables/Views:**  
  - `fact_sales`  
  - `dim_customers`  
  - `dim_products`
- **Role:**  
  Integrated, business-ready data marts are created from Silver.  
  - **`fact_sales`** is built directly from cleansed `crm_sales_details` and other required Silver tables for transactional analysis.
  - **`dim_customers`** combines cleansed customer information from both CRM and ERP sources.
  - **`dim_products`** is constructed from all relevant product/location/category tables.

**Arrow Connections** in the diagram show the transformations, joins, and enrichment steps as data flows from raw sources to fully-modeled, analytics-ready warehouse tables.

This visual makes it easy to understand how raw business data is progressively cleansed, integrated, and modeled into actionable, high-quality datasets for analytics and reporting.

<img width="1733" height="809" alt="image" src="https://github.com/user-attachments/assets/c9923b9f-aaa0-4189-8f15-a33bd15a9142" />

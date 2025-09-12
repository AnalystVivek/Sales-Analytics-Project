# 🗃️Data Warehousing – Scratch to Modern Analytics

## 📋 Project Summary

This project presents a complete, real-world build of a **SQL Data Warehouse**, unifying raw ERP & CRM data sources into a robust analytics foundation. Designed for **business intelligence, reporting, and data-driven decisions**, the solution applies best practices in modern data warehousing and ETL development.

✨ **Key Highlights:**
- 🔄 **Automated ETL:** Reliable, repeatable data ingestion and transformations using SQL Server
- 🧹 **Data Cleansing:** Removal of errors, resolving inconsistencies, handling missing values
- 🔗 **Data Integration:** Seamless merge of heterogeneous (ERP + CRM) datasets
- 📊 **Analytics-Ready:** Business-focused data models and star schema for easy reporting
- 📝 **Comprehensive Documentation:** Clear instructions, data catalog, and process overview

---

## 🏗️ Data Architecture (Medallion Model)

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

## 📂 Folder Structure

> ```
>├── 1. raw datasets/ # 📂 Source data (ERP & CRM CSV files)
>├── 2. bronze/ # 🥉 Staging tables - untouched raw data
>├── 3. silver/ # 🥈 Cleaned & integrated data
>├── 4. gold/ # 🥇 Business-ready data/views/reports
>└── README.md # 👈 Project overview
> ```

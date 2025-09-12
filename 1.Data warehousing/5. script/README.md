## 🏗️ Database & Schema Initialization Script

### 📝 Script Purpose

This SQL script is designed to initialize a dedicated data warehouse environment:

- 🗃️ **Creates a new database** named `DataWarehouse`.  
- 🔄 **Checks for existing instance:** If a `DataWarehouse` database already exists, it will be **dropped and freshly recreated**.
- 🏷️ **Sets up structured schemas:** Automatically generates three key schemas within the new database:
  - `bronze`   🥉 – Staging for raw, unprocessed data
  - `silver`   🥈 – Cleaned and integrated analytical data
  - `gold`     🥇 – Business-ready, reporting-optimized data models

---

### ⚠️ Warning

> **Caution:**  
> Running this script will **permanently drop all contents** of the existing `DataWarehouse` database, including all tables, views, and data within it.  
> Please ensure you have taken appropriate **backups** and fully reviewed the impact **before executing** in any production or critical data environment.

---

### 💡 Usage

- Ideal as the **first step** in project setup or during major environment resets.
---

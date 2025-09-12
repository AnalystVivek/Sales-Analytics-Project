## 🥉 Bronze Layer – Raw Data Staging

The **Bronze Layer** is the foundation of the data warehousing pipeline, serving as the secure landing zone for all raw data ingested from external source files (ERP & CRM CSVs). This layer ensures that unmodified, original data is preserved, supporting traceable, auditable ETL processes and easy reprocessing when needed.

---

### ✨ Key Features

- 📥 **Raw Data Ingestion:** Utilizes high-performance `BULK INSERT` operations to load CSV files directly into staging tables under the `bronze` schema.
- 🔄 **Repeatable & Clean Loads:** Before every load, the tables are truncated, ensuring a fresh and accurate representation of the source at every ETL run.
- 🧱 **Stable Structure:** Bronze tables are (re)created as needed, always reflecting the latest, most reliable DDL definitions, and ensuring compatibility with pipelines downstream.
- 🚨 **No Parameters Needed:** The core procedure—`bronze.load_bronze`—executes with no parameters; it's kept simple and robust for fully automated batch ingestion.
- 🗂️ **Reproducibility:** Any data or pipeline issue can be quickly traced or re-processed, as the original state of the data is always preserved in this layer.

---

### 📁 Folder Contents (`2. bronze/`)

- `ddl_bronze.sql` – DDL script to create (or reset) bronze tables
- `proc_load_bronze.sql` – Stored procedure for automated data ingestion from files
- `README.md` – This documentation and usage guide

---

### 📝 Best Practices

- Always run `ddl_bronze.sql` before your first load, or when changing table designs.
- Use the dedicated stored procedure for consistent, reliable ETL loads—no manual steps needed.
- Bronze preserves data at its *rawest*, allowing integrity checks and end-to-end lineage for all downstream analytics.

> _“Think of the bronze layer as your data lab’s ‘sterile environment’ – everything flows from here, fully traceable and never altered.”_

---

### 📋 Script Details

#### 1️⃣ Table DDL for Bronze

- **Script:** `ddl_bronze.sql`
- **Purpose:** Drops (if exists) and recreates the table structures within the `bronze` schema to match the external data format.  
- **When to Use:**  
  - Setting up the data warehouse for the first time  
  - When data structure changes in the source files  
  - After modifications or corrections in schema design

#### 2️⃣ Stored Procedure: Load Bronze Layer

- **Script:** `proc_load_bronze.sql`
- **Purpose:** 
  - Truncates all bronze tables (removes all data)
  - Loads new data from external CSVs using `BULK INSERT` for high efficiency
- **Parameters:** None (runs as a simple ETL batch command)
- **Usage Example:**
```ruby
EXEC bronze.load_bronze;
```


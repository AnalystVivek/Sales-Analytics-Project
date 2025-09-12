## 🥈 Silver Layer – Integrated & Cleansed Data

The **Silver Layer** is where raw, ingested data from the Bronze layer is transformed into verified, consistent, and analytics-ready datasets. This layer focuses on cleansing, validating, standardizing, and merging data from multiple sourced tables, making it reliable for business logic and reporting.

---

### 📁 Folder Contents (`3. silver/`)

- `ddl_silver.sql` – Script to define or reset Silver table structures
- `proc_load_silver.sql` – ETL stored procedure to transform Bronze → Silver
- `README.md` – Layer description and usage documentation

---

### 💡 Layer Role & Best Practice

- **Silver** is the trusted, analytics-ready layer.
- All **data cleaning** (deduplication, filtering, format correction, type casting, missing value resolution) and **integration** (joining multiple sources as one model) is performed here.
- The result: datasets that are consistent, reliable, and free from source anomalies—optimized for reporting and further business modeling in the Gold layer.

> _“Use the Silver layer to enforce business rules, correct errors, and integrate sources. This is your ‘single version of the truth’ for all analysis and reporting downstream.”_

---

### ✨ Core Capabilities

- 🏗️ **DDL Script: Create Silver Tables**
  - **Script:** `ddl_silver.sql`
  - 🛠️ *Purpose*: Drops any existing `silver` tables and recreates them according to the cleansed, integrated data model.
  - 🔄 *When to Use*: Run once on setup, or whenever you update the data model or business logic for analytics.
  - 🗂️ *Effect*: Ensures each Silver table matches the standard required for further business transformations and analytics.

- ⚡ **Stored Procedure: Load Silver Layer**
  - **Script:** `proc_load_silver.sql`
  - 🚀 *Purpose*: Runs the core **ETL pipeline** for this layer. 
    - Truncates (clears) all Silver tables to prevent duplicates or residue.
    - Extracts data from the Bronze layer, applies transformation logic (e.g., standardizes formats, removes duplicates, resolves missing/invalid values, integrates sources), and loads the cleaned records into Silver tables.
  - 🛡️ *No Parameters*: The procedure runs as a single ETL batch with no external inputs required.
  - 📝 *Usage Example*:
    ```ruby
    EXEC silver.load_silver;
    ```

---


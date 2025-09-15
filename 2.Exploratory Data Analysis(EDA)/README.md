## 🔍Exploratory Data Analysis (EDA)

The **Exploratory Data Analysis (EDA)** section provides a comprehensive toolkit of SQL queries to explore, understand, and summarize the business data now available in the Gold layer of the warehouse. EDA bridges the gap between raw data and deep analytics, enabling you to uncover insights, validate transformations, and guide further modeling.

---

### ✨ Key Objectives

- 🗃️ **Database Exploration:**  
  Discover all tables and columns using information schema queries to quickly audit the available objects.

- 📅 **Date & Range Insights:**  
  Analyze sales date ranges, customer ages, and the temporal distribution of orders to understand data coverage.

- 💸 **Metric & Magnitude Analysis:**  
  Calculate total sales, number of items sold, average prices, customer/product counts, and other essential business measures.

- 🌍 **Segmentation & Grouping:**  
  Break down sales, customers, and products by key attributes such as country, gender, category, and more.

- 🏆 **Ranking & Top-N Analysis:**  
  Identify top-performing products, best customers, and key revenue drivers, as well as weakest sales points, using ranking and window functions.

- 📊 **Distribution & Reporting:**  
  Generate summary reports with consolidated KPIs. Perform grouping, aggregation, and distribution analysis for quick business presentations.

---

### 📄 Contents & Usage

- **Scripts Folder** (`scripts/`):  
  Contains modular SQL scripts designed to answer frequent business questions or shape further visualizations.
- **EDA Script** (`eda_script.sql`):  
  Includes ready-to-run queries for:
  - Structure exploration (tables, columns)
  - All major business KPIs
  - Comprehensive group by, aggregation, and ranking use cases

---

### 💡 Why This Section?

With robust, analytics-ready data in the Gold layer, **EDA enables data analysts and business users to:**
- Rapidly validate data quality and completeness
- Gain first insights and identify business opportunities
- Shape actionable dashboards and deeper advanced analytics

> _“Think of EDA as your user manual for the data warehouse—making the numbers speak before you build your first report!”_

---

### 💡 Some Key Findings

- Distribution of sold items across countries
<img width="277" height="196" alt="image" src="https://github.com/user-attachments/assets/f4a0b9f6-d899-4469-80eb-1266d0944b43" />

- Top 5 high revenue generating products
<img width="291" height="142" alt="image" src="https://github.com/user-attachments/assets/bafb34c4-4adf-4bf1-89f4-2bf817719ed4" />

- Top 5 worst-performing products in terms of sales
<img width="288" height="142" alt="image" src="https://github.com/user-attachments/assets/8f8fda55-2b3b-48d4-b986-0aff069808df" />

- Top-10 customers who have generated the high revenue
<img width="262" height="241" alt="image" src="https://github.com/user-attachments/assets/929d51a5-0096-497c-b082-7606ff68e886" />

- The 3 customers with the fewest orders placed
<img width="270" height="103" alt="image" src="https://github.com/user-attachments/assets/8eb2860f-6b72-44e3-b4ee-2597fc063e91" />



---

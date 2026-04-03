🛒 Blinkit Data Warehouse & Analytics (Snowflake)

🚀 An end-to-end beginner-friendly data warehousing project inspired by a quick-commerce business model.

📌 Overview

This project demonstrates how raw operational data can be transformed into a structured data warehouse and leveraged for analytical insights using Snowflake.

Inspired by a quick-commerce platform similar to Blinkit, the project simulates real-world business scenarios involving order management, delivery performance, and marketing analytics.

It follows a complete workflow — from ingesting raw CSV files to building a data model, performing SQL-based analysis, and visualizing insights through a dashboard.

📂 Dataset

The project is built using four datasets:

blinkit_orders.csv – Contains order-level details such as customer ID, order date, and total amount
blinkit_order_items.csv – Includes product-level details for each order
blinkit_delivery_performance.csv – Captures delivery metrics like delivery time, status, and distance
blinkit_marketing_performance.csv – Provides campaign-level data including channel, cost, and conversion rate

📁 All datasets are stored in the data/ folder.

🏗️ Data Model

A simple warehouse-style schema is implemented:

Fact Tables
fact_orders
fact_order_items
Dimension Tables
dim_delivery
dim_marketing

These tables are integrated to create a unified analytical layer for reporting and dashboarding.

⚙️ Implementation Steps

The project follows these key steps:

Created database and schema in Snowflake
Defined file formats and staging area for data ingestion
Designed structured tables (fact and dimension)
Loaded data using COPY INTO
Built a consolidated analytical view using joins
Performed SQL-based business analysis
Developed a dashboard using Snowflake Snowsight
📊 Key Analysis

The project explores key business questions, including:

📈 Revenue trends over time
🛍️ Top-performing products
🚚 Delivery performance distribution
📢 Marketing spend across different channels
📊 Dashboard

An interactive dashboard was created using Snowflake Snowsight to visualize key metrics and trends.

📸 Add your dashboard screenshot in the dashboard/ folder and link it here.

📁 Project Structure
project-folder/
│
├── data/         # Raw datasets
├── sql/          # SQL scripts (setup, tables, analysis)
├── dashboard/    # Dashboard screenshots
└── README.md
🧠 Key Learnings

This project highlights:

Data warehousing fundamentals (fact & dimension modeling)
Hands-on experience with Snowflake
Writing SQL for analytical insights
Building data-driven dashboards

<p align="center">
  <img src="./assets/snowflake-dashboard.png" width="600" title="Snowflake Business Dashboard">
</p>

✍️ Author

Kartik Thakkar

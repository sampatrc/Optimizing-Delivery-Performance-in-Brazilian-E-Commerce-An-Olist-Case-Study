# Optimizing-Delivery-Performance-in-Brazilian-E-Commerce-An-Olist-Case-Study
SQL-based analysis of Brazilian e-commerce deliveries using Olist dataset. Built delivery fact tables, analyzed lanes, seller delays, and late orders to identify handling vs transit bottlenecks. Provides insights for optimizing on-time performance and logistics efficiency.

## 📊 Project Overview  
- **Dataset:** Olist Brazilian E-Commerce Public Dataset  
- **Tools Used:** SQL (PostgreSQL/Any SQL Engine)  
- **Objective:** Build a structured delivery facts base and derive insights to optimize logistics efficiency.  

## 🛠 Key Tasks & Solutions  
1. **Delivery Facts Table**  
   - Created a single trusted view with seller, customer, order timelines, lead times, handling days, transit days, and lateness flags.  

2. **Lane Performance Analysis**  
   - Identified slow delivery routes (`seller_state → customer_state`) with KPIs such as on-time rate, median handling, and transit times.  

3. **Slow-Handling Sellers**  
   - Highlighted sellers with high handling delays before shipping, enabling targeted coaching or SLA adjustments.  

4. **Delay Diagnosis**  
   - Classified late deliveries as handling-driven or transit-driven using lane-specific thresholds (p75).  

5. **Hotspot Analysis**  
   - Detected worst-performing seller × lane pairs with high late rates and sufficient order volumes to prioritize corrective actions.  

## 📂 Repository Structure  
- `business-case-solution.sql` – SQL scripts for building views and analyses  
- `table-create-commands.sql` – Table creation commands  
- `README.md` – Project documentation  

## 🚀 Insights & Impact  
- Separated **seller-side vs courier-side** delay contributors  
- Identified **top problematic routes** and **sellers** for operations teams  
- Delivered a scalable SQL framework for future logistics performance monitoring  

## 📎 Dataset Reference  
- [Olist Brazilian E-Commerce Dataset (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)  

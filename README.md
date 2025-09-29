# Optimizing-Delivery-Performance-in-Brazilian-E-Commerce-An-Olist-Case-Study
SQL-based analysis of Brazilian e-commerce deliveries using Olist dataset. Built delivery fact tables, analyzed lanes, seller delays, and late orders to identify handling vs transit bottlenecks. Provides insights for optimizing on-time performance and logistics efficiency.

## 📊 Project Overview  
- **Dataset:** Olist Brazilian E-Commerce Public Dataset  
- **Tools Used:** SQL (PostgreSQL/Any SQL Engine)  
- **Objective:** Build a structured delivery facts base and derive insights to optimize logistics efficiency.  

## 🛠 Key Tasks & Solutions  

### Task 1 — Build the “Delivery Facts” base (one row per order × seller)  
**Problem**  
Right now, information about a delivery is scattered across many tables (orders, items, customers, sellers). If we keep joining them again and again, we’ll waste time and make mistakes. We need one clean base that shows, for each shipment:  
- who shipped (seller) and to which state (customer),  
- when we approved, handed to carrier, delivered, and what we promised,  
- how many days it took in total (lead time), how long the seller took before shipping (handling), how long the courier took (transit),  
- and whether it was on time or late.  

**What this solves**  
- Gives us one trusted table so we don’t repeat messy joins.  
- Splits delay into seller side (handling) vs courier side (transit) — critical for root-cause.  
- Everything else (lanes, slow sellers, hot spots) will reuse this base.  

---

### Task 2 — Lane performance (which routes are slow?)  
**Problem**  
A “lane” is the route `seller_state → customer_state`. Ops needs to know which routes fail most so they can talk to the right courier partners or adjust routing. We also want to see if slowness comes more from handling (seller) or transit (courier) by looking at typical times.  

**What this solves**  
- Turns millions of rows into a short list of problem routes.  
- Adds volume guards so we don’t chase tiny lanes.  
- Gives typical handling vs transit medians to hint at the cause.  

---

### Task 3 — Find slow-handling sellers (who delays before shipping?)  
**Problem**  
Some delays happen before the package even reaches the courier. We need to see which sellers take too long to process/pack and hand off.  

**What this solves**  
- Surfaces sellers with high median handling time so category/ops can coach, set SLAs, or adjust exposure.  
- Keeps it fair with a volume guard (ignore tiny sellers).  
- Also shows on-time rate and median transit so you can tell seller vs courier issues.  

---

### Task 4 — Diagnose each lane: is lateness handling or transit?  
**Problem**  
Knowing a lane is “bad” isn’t enough. We must tell ops what to fix on that route: the seller’s handling process or the courier’s transit.  

**What this solves**  
- For each lane, we label late orders as handling-driven or transit-driven by comparing each order’s times to that lane’s own p75 thresholds (top 25% is “unusually high”).  
- Produces a lane table with counts and % by driver and a `primary_driver` column.  
- Gives ops a clear instruction per lane (coach sellers vs push 3PL).  

---

### Task 5 — Hot spots: the worst seller × lane pairs  
**Problem**  
The pain is usually concentrated in a few seller × lane combos (a particular seller struggling on a specific route). We need that action list.  

**What this solves**  
- Focuses attention on where to call first tomorrow.  
- Uses `late_rate` with a volume guard to avoid chasing noise.  
- Adds median handling/transit so you can tell whether to coach the seller or push the courier.  

---

## 📂 Repository Structure  
- `README.md` – Project documentation  
- `business-case-solution.sql` – SQL scripts for building views and analyses  
- `table-create-commands.sql` – Table creation commands  

## 🚀 Insights & Impact  
- Separated **seller-side vs courier-side** delay contributors  
- Identified **top problematic routes** and **sellers** for operations teams  
- Delivered a scalable SQL framework for future logistics performance monitoring  

## 📎 Dataset Reference  
- [Olist Brazilian E-Commerce Dataset (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)  

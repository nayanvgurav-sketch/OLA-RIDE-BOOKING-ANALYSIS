# 🚖 Ola Ride Booking Analysis Project

## 📌 Project Overview
This project focuses on analyzing Ola ride booking data to identify operational bottlenecks and generate actionable business insights. The analysis covers peak demand patterns, cancellation drivers, route-specific failures, and week-over-week performance growth to help optimize driver allocation and service reliability.

The complete workflow is built using:

- **Excel** for data sanitization, date/time formatting, and preliminary pivot analysis across 20,407 records.
- **SQL (MySQL)** for advanced business logic, window functions, and granular metrics extraction.
- **Power BI** for engineering an interactive Operational Intelligence Dashboard.

---

## 🚀 Key Objectives
- Identify peak demand windows and the top 5 busiest booking days.
- Analyze cancellation attribution between Customers, Drivers, and the System (Driver Not Found).
- Monitor Week-over-Week (WoW) growth coefficients using SQL analytical functions.
- Pinpoint high-risk routes where failure rates exceed 20%.
- Develop an interactive dashboard for Success-to-Failure ratio tracking and heatmapping.

---

## 🧰 Tech Stack Used
- **Excel** (Initial Cleaning & Pivot Distribution)
- **SQL (MySQL)** (Analytical Engine & Metrics Extraction)
- **Power BI** (Data Visualization & Heatmaps)

---

## 📂 Dataset Features
The dataset contains ride-level details such as:

- `Date_col` / `Time_col` (Sanitized for SQL compatibility)
- `Booking_Status` (Success, Canceled by Customer, Canceled by Driver, Driver Not Found)
- `Vehicle_Type` (Auto, Bike, Mini, Prime Sedan, Prime SUV, etc.)
- `Pickup_Location` & `Drop_Location`
- `Incomplete_Rides_Reason` (e.g., Personal & Car related issues, Customer asked to cancel)
- `Booking_Value` & `Ride_Distance`
- `Driver_Ratings` & `Customer_Rating`

---

## 🔍 Key Analysis Performed

### ⭐ Peak Demand Analysis
Identifies the busiest days of the month and the highest demand hours using average hourly booking volumes. Rides are categorized into diurnal time slots—Morning, Afternoon, Evening, and Night—to pinpoint success rates during different periods of the day.

---

### 📊 Cancellation & Failure Attribution
Deep dive into ride failures by categorizing cancellations into three main buckets: Customer, Driver, and System (Driver Not Found). This includes ranking the top reasons for incomplete rides and calculating hourly cancellation rates to distinguish between user-driven and provider-driven churn.

---

### 📈 Growth & Performance Monitoring
Tracks the Week-over-Week (WoW) growth of bookings. Performance is further segmented by Day Type (Weekday vs. Weekend) to calculate completion rates and identify operational variance, helping to understand service scaling across the 5-week period.

---

### 🛣️ Route Reliability Analysis
Geographical analysis to identify specific pickup-drop pairs with poor service reliability. Routes are flagged as "High-Risk" if they exhibit a cancellation rate exceeding 20% with a statistically significant sample size of at least 50 bookings.

---

## 📈 Power BI Dashboard Features
The Power BI dashboard provides:

- **Operational Heatmaps**: Visual representation of demand and cancellation hotspots across pickup locations.
- **Trend-lines**: Interactive charts showing WoW growth and hourly demand spikes.
- **Success Metrics**: KPI cards for total bookings, success rates, and average ride distance.
- **Risk Table**: Conditional formatting to highlight routes with high failure rates for immediate action.
- **Slicers**: Interactive filters for vehicle type, booking status, and day of the week.

---

## 📌 Project Workflow
```
Raw Dataset → Python Cleaning → SQL Analysis → Power BI Dashboard
```

---

## 📁 Project Files
```
📦 myntra-data-analysis
 ┣ 📄 README.md
 ┣ 📄 MYNTRA RAW DATASET.csv.gz
 ┣ 📄 Myntra Business Problem Document.docx
 ┣ 📄 project myntra.sql
 ┣ 📄 MYNTRA PROJECT.ipynb
 ┣ 📊 MYNTRA.pbix
 ┣ 📊 MYNTRA PRESENTATION.pptx

```

---

## 👤 Author
**Nayan Gurav**  
Data Analyst | Excel | SQL | Power BI  

---

## ⭐ Support
If you find this project useful, don’t forget to ⭐ star the repository!

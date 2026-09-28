# Plastic Recycling Operations Optimization

Industrial Engineering operations-analysis project using **Excel, SQL, Power BI, and Lean Six Sigma techniques** to evaluate a modeled plastic-recycling facility.

> **Data note:** All operational data in this repository is synthetic and was created for portfolio/learning purposes. The project was inspired by real recycling-facility workflows but does not contain confidential company data.

## Project Objective

The goal of this project was to model a recycling operation and identify improvement opportunities across production, quality, equipment downtime, and customer pickup performance.

The analysis focused on five areas:

- Processing throughput
- Material yield
- Equipment downtime
- Quality / contamination
- Pickup service performance

## Tools Used

- **Excel:** data generation, PivotTables, KPI analysis, Pareto analysis
- **SQL / SQLite:** aggregation, filtering, subqueries, joins, operational analysis
- **Power BI:** data modeling, DAX measures, interactive dashboards
- **Lean Six Sigma:** Pareto prioritization and continuous-improvement thinking

## Dataset

The modeled operation contains five connected datasets:

| Dataset | Purpose |
| --- | --- |
| Customers | Customer and location information |
| Pickups | Material pickup activity and service performance |
| Processing Batches | Production throughput, input/output, and yield |
| Quality Records | Contamination, rejected material, and quality status |
| Downtime Events | Machine downtime causes and duration |

## Key Findings

- **Maintenance and material jams accounted for 57.9% of modeled downtime**, making them the highest-priority downtime categories for further investigation.
- **Mixed plastic recorded the lowest average throughput and yield**, indicating a key processing-efficiency challenge.
- **Sorter 1 recorded the highest total machine downtime** in the modeled dataset and would be prioritized for root-cause analysis.
- The modeled operation achieved an **87% on-time pickup rate**.
- Contamination alone did not fully explain yield differences, suggesting that additional process and material characteristics would need to be investigated before assigning root cause.

## Excel Analysis

Excel was used to build and analyze the synthetic operational data. The analysis included:

- Average throughput by material
- Average yield by material
- Total downtime by cause
- Total downtime by machine
- Pickup-status analysis
- KPI calculations
- Pareto analysis of downtime causes

The Pareto analysis showed that maintenance and material jams together represented **57.9% of total modeled downtime**.

## SQL Analysis

The CSV datasets were imported into SQLite and analyzed using SQL. Queries included:

1. Average processing throughput by material
2. Average yield by material
3. Total downtime by cause
4. Total downtime by machine
5. Pickup performance and on-time rate
6. Yield and contamination analysis using a `JOIN`
7. Pickup volume by customer location using a `JOIN`

SQL was used to validate the Excel findings and demonstrate analysis across related operational tables.

## Power BI Dashboard

A two-page interactive Power BI dashboard was created.

### Operations Overview

- Average throughput
- Average yield
- Total downtime hours
- On-time pickup rate
- Throughput by material
- Yield by material
- Monthly production output
- Material slicer

### Continuous Improvement

- Downtime by cause
- Downtime by machine
- Average contamination by material
- Yield vs. contamination analysis
- Key findings and improvement opportunities

## Improvement Opportunities

Based on the modeled results, the main improvement areas were:

- Strengthen preventive-maintenance planning
- Investigate recurring material jams
- Standardize incoming-material inspection
- Prioritize high-downtime equipment for root-cause analysis
- Review production sequencing to reduce unnecessary changeovers and cleaning

These are proposed improvement opportunities based on synthetic scenario analysis, not implemented company results.

## Repository Structure

```text
plastic-recycling-operations-optimization/
├── README.md
├── analysis_queries.sql
├── data/
│   ├── customers.csv
│   ├── pickups.csv
│   ├── processing_batches.csv
│   ├── quality_records.csv
│   └── downtime_events.csv
├── dashboard/
│   ├── operations_overview.png
│   └── continuous_improvement.png
└── excel/
    └── Plastic_Recycling_Analysis.xlsx
```

## Skills Demonstrated

**Industrial Engineering:** process analysis, KPI development, downtime analysis, continuous improvement, operations performance

**Analytics:** Excel, SQL, Power BI, DAX, data visualization, relational joins, PivotTables, Pareto analysis

---

**Project type:** Independent portfolio project using synthetic data inspired by recycling-facility operations.

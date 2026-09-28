# Synthetic Dataset

This project uses a synthetic dataset modeled on plastic-recycling facility workflows. No confidential company data is included.

## Tables

### `customers`
Customer master data used to connect pickup activity to customer locations and types.

Fields: `Customer_ID`, `Customer_Name`, `City`, `Customer_Type`

### `pickups`
Material collection records used to analyze pickup activity and service performance.

Fields: `Pickup_ID`, `Customer_ID`, `Pickup_Date`, `Material`, `Weight_KG`, `Distance_KM`, `Pickup_Status`

### `processing_batches`
Production records used to analyze throughput and material yield.

Fields: `Batch_ID`, `Batch_Date`, `Material`, `Machine`, `Input_KG`, `Processing_Time_HR`, `Output_KG`, `Yield`, `Throughput_KG/HR`

### `quality_records`
Quality records connected to processing batches by `Batch_ID`.

Fields: `Quality_ID`, `Batch_ID`, `Material`, `Contamination_Percent`, `Rejected_Kilograms`, `Quality_Status`

### `downtime_events`
Equipment downtime events used for Pareto and machine-performance analysis.

Fields: `Event_ID`, `Date`, `Machine`, `Downtime_Reason`, `Downtime_Duration`

## Relationships

- `customers[Customer_ID]` → `pickups[Customer_ID]`
- `processing_batches[Batch_ID]` → `quality_records[Batch_ID]`

## Data Quality

The final cleaned dataset standardizes material labels, aligns quality records with their corresponding production batches, and uses valid date values for Power BI refreshes.

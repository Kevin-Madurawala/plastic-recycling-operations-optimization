-- =========================================
-- Query 1: Average Processing Throughput by Material
-- =========================================

SELECT
    Material,
    ROUND(AVG([Throughput_KG/HR]), 1) AS avg_throughput_kg_hr
FROM processing_batches
GROUP BY Material
ORDER BY avg_throughput_kg_hr DESC;

-- =========================================
-- Query 2: Average Yield by Material
-- =========================================

SELECT MATERIAL,
ROUND(AVG(CAST(REPLACE(YIELD, '%', '')AS REAL)),
2) AS avg_yield_percent
FROM processing_batches
GROUP BY Material
ORDER BY avg_yield_percent DESC;

-- =========================================
-- Query 3: Total Downtime By Cause
-- =========================================

SELECT Downtime_Reason,
SUM(Downtime_Duration) AS total_downtime_min
FROM downtime_events
GROUP BY Downtime_Reason
ORDER BY total_downtime_min DESC;

-- =========================================
-- Query 4: Total Downtime By Machine
-- =========================================

SELECT Machine,
SUM(Downtime_Duration) AS total_downtime_min
FROM downtime_events
GROUP BY Machine
ORDER BY total_downtime_min DESC;

-- =========================================
-- Query 5: Pickup Performance and On Time Rate
-- =========================================

SELECT
    Pickup_Status,
    COUNT(*) AS number_of_pickups,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM pickups),
        2
    ) AS percentage
FROM pickups
GROUP BY Pickup_Status;

-- =========================================
-- Query 6: Yield And Contamination Analysis By Material
-- =========================================

SELECT p.Material,
ROUND(AVG(CAST(REPLACE(p.Yield,'%','')AS REAL)),2) AS avg_yield_percent,
ROUND(AVG(CAST(REPLACE(q.Contamination_Percent,'%','')AS REAL)),2)
AS avg_contamination_percent
FROM processing_batches AS p
JOIN quality_records AS q
ON p.Batch_ID = q.Batch_ID
GROUP BY p.Material
ORDER BY avg_contamination_percent DESC;

-- =========================================
-- Query 7: Pickup Volume By Customer Location
-- =========================================

SELECT c.City,
COUNT(p.Pickup_ID) AS number_of_pickups,
SUM(p.Weight_KG) AS total_weight_kg
FROM customers AS c
JOIN pickups AS p
ON c.Customer_ID = p.Customer_ID
GROUP BY c.City
ORDER BY total_weight_kg DESC;

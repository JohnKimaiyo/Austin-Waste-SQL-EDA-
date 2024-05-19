
-- whats is the highest load weisght -  
SELECT MAX(Load_Weight) Highest_Load_Weight
FROM bigquery-public-data.austin_waste.waste_and_diversion LIMIT 1000,


-- whats is the highest load weisght -  
SELECT AVG(Load_Weight) Average_Load_Weight
FROM bigquery-public-data.austin_waste.waste_and_diversion LIMIT 1000

-- what are the top load  types  -- 
SELECT Load_type,SUM(Load_Weight) as Total_Load_Weight
FROM bigquery-public-data.austin_waste.waste_and_diversion 
GROUP BY Load_type
ORDER BY Total_Load_Weight DESC
LIMIT 1000;

-- what are the top drop off sites  -- 
SELECT dropoff_site ,SUM(Load_Weight) as Total_Load_Weight
FROM bigquery-public-data.austin_waste.waste_and_diversion 
GROUP BY dropoff_site
ORDER BY Total_Load_Weight DESC
LIMIT 1000;

-- what are the top route_type  -- 
SELECT route_type ,SUM(Load_Weight) as Total_Load_Weight
FROM bigquery-public-data.austin_waste.waste_and_diversion 
GROUP BY route_type
ORDER BY Total_Load_Weight DESC
LIMIT 1000;


-- what months and years have the height load weight
SELECT 
    EXTRACT(YEAR FROM report_date) AS year,
     EXTRACT(MONTH FROM report_date) AS month,
    SUM(Load_Weight) AS Total_Load_Weight
FROM 
    `bigquery-public-data.austin_waste.waste_and_diversion`
GROUP BY 
    year,
    month
ORDER BY 
    Total_Load_Weight DESC
LIMIT 1;
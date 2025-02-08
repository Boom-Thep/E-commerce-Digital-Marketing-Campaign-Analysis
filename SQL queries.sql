--SQL code for tableau--Download the raw csv file and upload it to Tableau
SELECT *,
CASE 
WHEN campaign_name like '%tier1%' then 'Tier1'
WHEN campaign_name like '%tier2%' then 'Tier2'
ELSE 'Other'
END as Tier
FROM reports;

--1)Overall Business Performance: Calculate the total revenue, total marketing cost, Return on Marketing Investment (ROMI), and the total gross profit.

SELECT 
   SUM(revenue) as total_revenue,
   SUM(marketing_spent) as total_marketing_spent,
   ROUND((SUM(revenue) - SUM(marketing_spent))/ SUM(marketing_spent)*100,2) as romi,
   SUM(revenue) - SUM(marketing_spent) as Total_gross_proft
FROM 
   reports;

--2)Campaign-Level ROMI Analysis: Analyze ROMI performance by campaign, Calculate total revenue, total marketing spend, ROMI, and gross profit for each campaign.

SELECT 
   campaign_name, 
   SUM(revenue) as total_revenue,
   SUM(marketing_spent) as total_marketing_spent,
   ROUND((SUM(revenue) - SUM(marketing_spent))/ SUM(marketing_spent)*100,2) as romi,
   SUM(revenue) - SUM(marketing_spent) as total_gross_profit,
   RANK() OVER(ORDER BY SUM(revenue) - SUM(marketing_spent) DESC) as rank_profit
FROM 
   reports
GROUP BY 
   campaign_name
ORDER BY romi DESC;

--3)Campaign Type Effectiveness: Determine the most effective campaign types (social, banner, influencer, search).
----Calculate total revenue generated, ROMI, Cost of Customer Acquisition (COCA), Cost Per Lead (CPL), Customer Acquisition Cost (CAC), and Gross Profit for each campaign type.

SELECT 
   category,
   SUM(revenue) as total_revenue,
   SUM(marketing_spent) as total_marketing_spent,
   ROUND((SUM(revenue) - SUM(marketing_spent)) / SUM(marketing_spent) *100,2) as romi,
   SUM(clicks) as total_click,
   ROUND(SUM(marketing_spent)/SUM(clicks),2) as cpc,
   SUM(leads) as total_lead,
   ROUND(SUM(marketing_spent)/SUM(leads),2) as cpl,
   SUM(orders) as total_order,
   ROUND(SUM(marketing_spent) / SUM(orders),2) as cac,
   SUM(revenue) - SUM(marketing_spent) as total_gross_profit
FROM 
   reports
GROUP BY 
   category
ORDER BY total_gross_profit DESC;


--4)Geolocation Targeting Analysis: Compare the performance of targeting Tier 1 and Tier 2 cities.
----Calculate total revenue, total marketing spent, total gross profit, and ROMI for each tier.

SELECT
   CASE
   WHEN campaign_name like ('%tier1%') then 'Tier1'
   WHEN campaign_name like ('%tier2%') then 'Tier2'
   ELSE 'Other'
   END as Tier,
   SUM(revenue) as total_revenue,
   SUM(marketing_spent) as total_marketing_spent,
   SUM(revenue) - SUM(marketing_spent) as gross_profit,
   ROUND((SUM(revenue) - SUM(marketing_spent)) / (SUM(marketing_spent)) * 100,2 ) as romi
FROM 
   reports
WHERE campaign_name like '%tier1%' or campaign_name like '%tier2%'
GROUP BY 
   Tier
ORDER BY gross_profit DESC;

--5) Cost Per Click (CPC), Cost Per Lead (CPL), and Customer Acquisition Cost (CAC) Analysis
-- Calculate total revenue, total spent, CPC, CPL, CAC, gross profit, romi for each campaign. Order the campaign with the highest CAC and rank gross profit.
SELECT campaign_name, category,
   SUM(revenue) as total_revenue,
   SUM(marketing_spent) as total_spent,
   ROUND(SUM(marketing_spent)/SUM(clicks),2) as CPC,
   ROUND(SUM(marketing_spent)/SUM(leads),2) as CPL,
   ROUND(SUM(marketing_spent)/SUM(orders),2) as CAC,
   SUM(revenue) - SUM(marketing_spent) as gross_profit,
   ROUND((SUM(revenue) - SUM(marketing_spent)) / SUM(marketing_spent) * 100,2) as romi,
   DENSE_RANK() OVER(ORDER BY SUM(revenue) - SUM(marketing_spent) DESC) as rank_gross_proft
FROM reports
GROUP BY campaign_name, category
ORDER BY cac DESC;
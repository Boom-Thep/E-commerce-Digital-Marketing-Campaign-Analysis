--1)Overall Business Performance: Calculate the total revenue, total marketing cost, 
----overall Return on Marketing Investment (ROMI), and the total gross profit or loss.

SELECT 
   SUM(revenue) as total_revenue,
   SUM(marketing_spent) as total_marketing_spent,
   (SUM(revenue) - SUM(marketing_spent)) / SUM(marketing_spent)  as romi,
   ROUND((SUM(revenue) - SUM(marketing_spent))/ SUM(marketing_spent)*100,2) as romi_percentage_rate,
   SUM(revenue) - SUM(marketing_spent) as Total_gross_proft_loss
FROM 
   reports;

--2)Campaign-Level ROMI Analysis: Analyze ROMI performance by campaign, Calculate total revenue, total marketing spend, ROMI, 
----ROMI percentage rate, and gross profit or loss for each campaign.

SELECT 
   campaign_name, 
   SUM(revenue) as total_revenue,
   SUM(marketing_spent) as total_marketing_spent,
   ROUND((SUM(revenue) - SUM(marketing_spent)) / SUM(marketing_spent),2)  as romi,
   ROUND((SUM(revenue) - SUM(marketing_spent))/ SUM(marketing_spent)*100,2) as romi_percentage_rate,
   SUM(revenue) - SUM(marketing_spent) as Total_gross_proft_loss,
   RANK() OVER(ORDER BY SUM(revenue) - SUM(marketing_spent) DESC) as rank_profit
FROM 
   reports
GROUP BY 
   campaign_name
ORDER BY romi DESC;

--3)Campaign Performance Over Time: Analyze campaign performance by date. Determine the date with the highest advertising spend. 
----Identify dates with the highest revenue and analyze conversion rates (high vs. low). Calculate average order values for different periods.

SELECT 
   campaign_date,
   SUM(revenue) as total_revenue,
     DENSE_RANK() OVER(ORDER BY SUM(revenue) DESC) as rank_revenue,
   SUM(marketing_spent) as total_marketing_spent,
     DENSE_RANK() OVER(ORDER BY SUM(marketing_spent) DESC) as rank_marketing_spent,
   ROUND(SUM(leads) * 1.0 / sum(clicks) * 100,2) as visitor_to_lead_rate,
     DENSE_RANK() OVER(ORDER BY ROUND(SUM(leads) * 1.0 / sum(clicks) * 100,2) DESC) as high_conversionrate1,
     DENSE_RANK() OVER(ORDER BY ROUND(SUM(leads) * 1.0 / sum(clicks) * 100,2) ASC) as low_conversionrate1,
   ROUND(SUM(orders) * 1.0/ SUM(leads) * 100,2) as lead_to_order_rate,
     DENSE_RANK() OVER(ORDER BY ROUND(SUM(orders) * 1.0/ SUM(leads) * 100,2) DESC) as high_conversionrate2,
     DENSE_RANK() OVER(ORDER BY ROUND(SUM(orders) * 1.0/ SUM(leads) * 100,2) ASC) as low_conversionrate2,
   SUM(revenue)/SUM(CASE WHEN orders>0 then orders end) as avg_order_value,
   ROUND(((SUM(revenue) - SUM(marketing_spent)) / sum(marketing_spent))*100,2) as ROMI_rate,
     DENSE_RANK() OVER(ORDER BY ROUND(((SUM(revenue) - SUM(marketing_spent)) / sum(marketing_spent))*100,2) DESC) as rank_romi 
FROM 
   reports
GROUP BY 
   campaign_date
ORDER BY SUM(revenue) DESC;


--4)Buyer Activity Patterns: Analyze buyer activity by day of the week. Calculate average revenue on weekdays and weekends.
----Identify the most effective campaigns for weekends and weekdays.
----For each campaign, calculate average revenue, average marketing spend, total revenue, total marketing spend, ROMI, and gross profit or loss.

SELECT 
   day_of_week,
   ROUND(AVG(revenue),2) as average_revenue,
   ROUND(AVG(marketing_spent),2) as average_marketing_spent,
   SUM(revenue) as total_revenue, 
   SUM(marketing_spent) as total_spent, 
   SUM(revenue) - SUM(marketing_spent) as gross_profit_loss,
   ROUND((SUM(revenue) - SUM (marketing_spent))/ SUM(marketing_spent) * 100,2) as romi
FROM
   (SELECT *,
    CASE
    WHEN EXTRACT(DOW FROM campaign_date) IN (0,6) THEN 'Weekend' ELSE 'Weekday'
    END as day_of_week
    FROM reports)
GROUP BY 
   day_of_week
ORDER BY total_revenue DESC;


----GROUP BY campaign_name
SELECT 
   day_of_week, campaign_name,
   ROUND(AVG(revenue),2) as average_revenue,
   ROUND(AVG(marketing_spent),2) as average_marketing_spent,
   SUM(revenue) as total_revenue, 
   SUM(marketing_spent) as total_spent, 
   SUM(revenue) - SUM(marketing_spent) as gross_profit_loss,
   RANK() OVER(ORDER BY SUM(revenue) - SUM(marketing_spent) DESC ) as rank_gross_profit,
   ROUND((SUM(revenue) - SUM (marketing_spent))/ SUM(marketing_spent) * 100,2) as romi
FROM
   (SELECT *,
    CASE
    WHEN EXTRACT(DOW FROM campaign_date) IN (0,6) THEN 'Weekend' ELSE 'Weekday'
    END as day_of_week
    FROM reports)
GROUP BY 
   day_of_week, campaign_name
ORDER BY gross_profit_loss DESC;


--5)Campaign Type Effectiveness: Determine the most effective campaign types (social, banner, influencer, search).
----Calculate total revenue generated, ROMI, Cost of Customer Acquisition (COCA), Cost Per Lead (CPL), Customer Acquisition Cost (CAC), and Gross Profit or Loss for each campaign type.

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
   SUM(revenue) - SUM(marketing_spent) as gross_profit_loss
FROM 
   reports
GROUP BY 
   category
ORDER BY gross_profit_loss DESC;


--6)Geolocation Targeting Analysis: Compare the performance of targeting Tier 1 and Tier 2 cities.
----Calculate total gross profit or loss and ROMI for each tier.

SELECT
   CASE
   WHEN campaign_name like ('%tier1%') then 'Tier1'
   WHEN campaign_name like ('%tier2%') then 'Tier2'
   ELSE 'Other'
   END as Tier,
   SUM(revenue) as total_revenue,
   SUM(marketing_spent) as total_marketing_spent,
   SUM(revenue) - SUM(marketing_spent) as gross_profit_loss,
   ROUND((SUM(revenue) - SUM(marketing_spent)) / (SUM(marketing_spent)) * 100,2 ) as romi
FROM 
   reports
WHERE campaign_name like '%tier1%' or campaign_name like '%tier2%'
GROUP BY 
   Tier
ORDER BY gross_profit_loss DESC;


--7)Cost Per Click (CPC) Analysis: Calculate the average Cost Per Click (CPC) (Marketing spending / Clicks). Show total spending and total clicks.
----Calculate the difference between marketing spend and revenue. Rank campaigns by gross profit.

SELECT 
   campaign_name, 
   category,
   SUM(marketing_spent) as total_spent,
   SUM(clicks) as total_clicks,
   ROUND(SUM(marketing_spent) / SUM(clicks),2) as cpc,
   SUM(revenue) - SUM(marketing_spent) as gross_profit_loss,
   RANK() OVER(ORDER BY SUM(revenue) - SUM(marketing_spent) DESC) as rank_gross_profit
FROM 
   reports
GROUP BY 
   campaign_name, category
ORDER BY cpc DESC;


--8)Cost Per Lead (CPL) Analysis: Calculate the average Cost Per Lead (CPL) (Marketing spending / Leads). Show total spending and total clicks.
----Calculate the difference between marketing spend and revenue. Rank campaigns by gross profit.

SELECT 
   campaign_name, 
   category,
   SUM(marketing_spent) as total_spent,
   SUM(leads) as total_leads,
   ROUND(SUM(marketing_spent) / SUM(leads),2) as cpl,
   SUM(revenue) - SUM(marketing_spent) as gross_profit_loss,
   RANK() OVER(ORDER BY SUM(revenue) - SUM(marketing_spent) DESC) as rank_gross_profit
FROM 
   reports
GROUP BY 
   campaign_name, category
ORDER BY cpl DESC;


--9)Customer Acquisition Cost (CAC) Analysis: Calculate the average Customer Acquisition Cost (CAC) (Marketing spend / Orders).
----Show total spending and total clicks. Calculate the difference between marketing spend and revenue. Rank campaigns by gross profit.

SELECT 
   campaign_name, 
   category,
   SUM(marketing_spent) as total_spent,
   SUM(orders) as total_orders,
   ROUND(SUM(marketing_spent) / SUM(orders),2) as cac,
   SUM(revenue) - SUM(marketing_spent) as gross_profit_loss,
   RANK() OVER(ORDER BY SUM(revenue) - SUM(marketing_spent) DESC) as rank_gross_profit
FROM 
   reports
GROUP BY campaign_name, category
ORDER BY cac DESC;
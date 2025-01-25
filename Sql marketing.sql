--1- Total Revenue, Total Marketing Cost, Overall ROMI, Total Gross Pofit or Loss
SELECT 
SUM(revenue) as total_revenue,
SUM(marketing_spent) as total_marketing_spent,
(SUM(revenue) - SUM(marketing_spent)) / SUM(marketing_spent)  as romi,
ROUND((SUM(revenue) - SUM(marketing_spent))/ SUM(marketing_spent)*100,2) as romi_percentage_rate,
SUM(revenue) - SUM(marketing_spent) as Total_gross_proft_loss
FROM reports;

--2- ROMI by campaigns
SELECT campaign_name, 
SUM(revenue) as total_revenue,
SUM(marketing_spent) as total_marketing_spent,
ROUND((SUM(revenue) - SUM(marketing_spent)) / SUM(marketing_spent),2)  as romi,
ROUND((SUM(revenue) - SUM(marketing_spent))/ SUM(marketing_spent)*100,2) as romi_percentage_rate,
SUM(revenue) - SUM(marketing_spent) as Total_gross_proft_loss,
RANK() OVER(ORDER BY SUM(revenue) - SUM(marketing_spent) DESC) as rank_profit
FROM reports
GROUP BY campaign_name
ORDER BY romi DESC;

--3- Performance of the campaign depending on the date - on which date did we spend the most money on advertising, when did we get the biggest revenue when conversion rates were high and low? What were the average order values?
SELECT campaign_date,
SUM(marketing_spent) as total_marketing_spent
FROM reports
GROUP BY campaign_date
ORDER BY total_marketing_spent DESC;

SELECT campaign_date,
SUM(revenue) OVER(Partition By campaign_date ORDER BY marketing_spent DESC) as total_revenue,
SUM(marketing_spent) OVER(Partition By campaign_date ORDER BY marketing_spent DESC) as total_marketing_spent,
ROUND((SUM(leads) OVER(Partition By campaign_date) * 1.0 / SUM(clicks) OVER(Partition By campaign_date))*100,2) as visitor_to_leads_conversion_rate,
ROUND((SUM(orders) OVER(Partition By campaign_date) * 1.0/ SUM(leads) OVER(Partition By campaign_date))*100,2) as leads_to_order_conversion_rate,
SUM(revenue) OVER(PARTITION BY campaign_date) / SUM(CASE WHEN orders > 0 then orders end) OVER(PARTITION BY campaign_date) as avg_order_value 
FROM reports
ORDER BY total_marketing_spent DESC;

SELECT SUM(marketing_spent)
FROM reports;

SELECT campaign_date,
SUM(marketing_spent)
FROM reports
GROUP BY campaign_date
ORDER BY SUM(marketing_spent) DESC;

SELECT 
   campaign_date,
   SUM(revenue) as total_revenue,
     DENSE_RANK() OVER(ORDER BY SUM(revenue) DESC) as rank_revenue,
   SUM(marketing_spent) as total_marketing_spent,
     DENSE_RANK() OVER(ORDER BY SUM(marketing_spent) DESC) as rank_marketing_spent,
   ROUND(SUM(leads) * 1.0 / sum(clicks) * 100,2) as vis_lead_rate,
     DENSE_RANK() OVER(ORDER BY ROUND(SUM(leads) * 1.0 / sum(clicks) * 100,2) DESC) as high_conversionrate1,
     DENSE_RANK() OVER(ORDER BY ROUND(SUM(leads) * 1.0 / sum(clicks) * 100,2) ASC) as low_conversionrate1,
   ROUND(SUM(orders) * 1.0/ SUM(leads) * 100,2) as lead_order_rate,
     DENSE_RANK() OVER(ORDER BY ROUND(SUM(orders) * 1.0/ SUM(leads) * 100,2) DESC) as high_conversionrate2,
     DENSE_RANK() OVER(ORDER BY ROUND(SUM(orders) * 1.0/ SUM(leads) * 100,2) ASC) as low_conversionrate2,
   SUM(revenue)/SUM(CASE WHEN orders>0 then orders end) as avg_order_value,
   ROUND(((SUM(revenue) - SUM(marketing_spent)) / sum(marketing_spent))*100,2) as ROMI_rate
FROM reports
  GROUP BY campaign_date
  ORDER BY SUM(revenue) DESC LIMIT 10;


--4- When buyers are more active? What is the average revenue on weekdays and weekends? Which campaign perform the best during the weekend and weekday --> Find the total revenue, marketing spent, ROMI, and gross profit or loss
SELECT day_of_week,
ROUND(AVG(revenue),2) as average_revenue,
ROUND(AVG(marketing_spent),2) as average_marketing_spent,
SUM(revenue) as total_revenue, 
SUM(marketing_spent) as total_spent, 
SUM(revenue) - SUM(marketing_spent) as gross_profit_loss,
ROUND((SUM(revenue) - SUM (marketing_spent))/ SUM(marketing_spent) * 100,2) as romi
FROM( SELECT *,
CASE
WHEN EXTRACT(DOW FROM campaign_date) IN (0,6) THEN 'Weekend' ELSE 'Weekday'
END as day_of_week
FROM reports)
GROUP BY day_of_week
ORDER BY total_revenue DESC;

--5- Which types of campaigns work best - social, banner, influencer, or a search? Find the total revenue generated, ROMI, CPC,CPL,CAC, Gross-Profit or Loss
SELECT category,
SUM(revenue) as total_revenue,
SUM(marketing_spent) as total_marketing_spent,
ROUND((SUM(revenue) - SUM(marketing_spent)) / SUM(marketing_spent) *100,2) as romi,
ROUND(SUM(marketing_spent)/SUM(clicks),2) as cpc,
ROUND(SUM(marketing_spent)/SUM(leads),2) as cpl,
ROUND(SUM(marketing_spent) / SUM(orders),2) as cac,
SUM(revenue) - SUM(marketing_spent) as gross_profit_loss
FROM reports
GROUP BY category
ORDER BY gross_profit_loss DESC;

--6- Which geo locations are better for targeting - tier 1 or tier 2 cities? --> calculate the total gross profit or loss, and ROMI.
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
FROM reports
WHERE campaign_name like '%tier1%' or campaign_name like '%tier2%'
GROUP BY Tier
ORDER BY gross_profit_loss DESC;

--7-Cost per click (CPC) how much does it cost us to attract 1 click (on average) --> (Marketing spending/Clicks). 
--Compare each campaign cpc with the overall cpc. 
--Also show the calculation of total spents and clicks. Show the difference between marketing spent and revenue, also rank the profit.
SELECT campaign_name, category,
SUM(marketing_spent) as total_spent,
SUM(clicks) as total_clicks,
ROUND(SUM(marketing_spent) / SUM(clicks),2) as cpc,
SUM(revenue) - SUM(marketing_spent) as gross_profit_loss,
RANK() OVER(ORDER BY SUM(revenue) - SUM(marketing_spent) DESC) as rank_gross_profit
FROM reports
GROUP BY campaign_name, category
ORDER BY cpc DESC;


--8-Cost per lead (CPL) how much does it cost us to attract 1 lead (on average) --> (Marketing spending/Leads)
SELECT campaign_name, category,
SUM(marketing_spent) as total_spent,
SUM(leads) as total_leads,
ROUND(SUM(marketing_spent) / SUM(leads),2) as cpl,
SUM(revenue) - SUM(marketing_spent) as gross_profit_loss,
RANK() OVER(ORDER BY SUM(revenue) - SUM(marketing_spent) DESC) as rank_gross_profit
FROM reports
GROUP BY campaign_name, category
ORDER BY cpl DESC;
--9-Customer acquisition cost (CAC) -- how much does it cost us to attract 1 order (on average) --> (marketing spend/ orders)
SELECT campaign_name, category,
SUM(marketing_spent) as total_spent,
SUM(orders) as total_orders,
ROUND(SUM(marketing_spent) / SUM(orders),2) as cac,
SUM(revenue) - SUM(marketing_spent) as gross_profit_loss,
RANK() OVER(ORDER BY SUM(revenue) - SUM(marketing_spent) DESC) as rank_gross_profit
FROM reports
GROUP BY campaign_name, category
ORDER BY cac DESC;
--10-Gross profit Profit or loss after deducting marketing cost (Revenue-Marketing spending)

SELECT 
   campaign_date, 
   SUM(marketing_spent) as total_spent
FROM 
   reports
GROUP BY
   campaign_date
ORDER BY sum(marketing_spent) DESC
LIMIT 1;
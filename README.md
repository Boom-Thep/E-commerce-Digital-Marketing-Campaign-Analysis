# E-commerce Digital Marketing Campaign Analysis
## Project Summary
This project presents the dataset from e-commerce company's digital marketing campaigns conducted over one month, spanning February 1st to February 28th. The campaigns are set up by marketing team to attract more customer to the company's website. We are collaborating with the marketing team to assess the performance of these campaigns by analyzing the effectiveness of spending and the return on marketing investment. The KPIs we are investigating are:
- **ROMI:** Return on marketing investment
- **CPC:** Cost per clicks
- **CPL:** Cost per leads
- **CAC:** Customer acquisition cost (leads to orders)
- **Gross Profit or Loss:** revenue - marketing spent
  
Insights and recommendations find will be use by marketing team to allocate funding for performing campaign and reassess underperforming campaign to potentially minimize loss and increase profit.

## About The Dataset
Our analysis is based on the following data:
- **Campaign Info:** This dataset contains details of marketing campaigns, including a unique entry ID, campaign date, campaign name (11 distinct names), category (social, search, influencer, media), and a unique campaign identifier (campaign_id). Understanding this data is crucial for tracking campaign performance, segmenting marketing efforts, and identifying which types of campaigns yield the best results.
- **Metrics:** This dataset tracks key performance metrics for each campaign:
  - impressions: Number of impressions generated by the campaign
  - marketing_spent: Amount spent on the campaign
  - clicks: Number of clicks received
  - leads: Number of leads generated
  - orders: Number of orders made
    
These metrics help calculate key performance indicators (KPIs) to evaluate campaign effectiveness.
- **Revenue:** This dataset includes revenue data for each campaign, with details such as entry ID, campaign date, campaign ID, and revenue generated. By analyzing this data alongside the metrics dataset, we can assess marketing spend efficiency, profitability, and KPIs like return on marketing spend.

![image](https://github.com/user-attachments/assets/1a711290-5eda-47d4-bd69-604abcf650fa)



## Executive Summary
The analysis revealed that the company's campaigns generated **$42.89M in revenue** with a **ROMI of 40.20%**, indicating efficient overall performance. The **YouTube Blogger** campaign emerged as the 
**top performer with a ROMI of 277%** and the **highest gross profit of $11.25M**, while Instagram campaigns (Blogger & Tier 1) also delivered strong results. However, **several Facebook campaigns**, **particularly Facebook_lal**, **underperformed** significantly with a negative **ROMI of -88.64% and a gross loss of $1M**, alongside Facebook_tier2 and Facebook_tier1, which also showed negative ROMIs and gross losses. **Influencer marketing** proved to be **the most effective campaign type**, boasting a **ROMI of 154.29%**, while **social media** campaigns struggled with a negative **ROMI of -13.68%**.

To address these challenges, it is recommended to increase investment in high-performing campaigns like YouTube Blogger and Instagram, while restructuring or pausing underperforming Facebook campaigns to improve their effectiveness. Additionally, enhancing conversion rates for underperforming campaigns and optimizing resource allocation across campaigns will further boost ROI and improve overall efficiency.

## Insights Deep-Dive
### Overall Business Performance
- **Total Revenue:** The total revenue generated is **42,889,366**.
- **Total Marketing Spend:** The total amount spent on marketing is **30,590,879**.
- **ROMI:** The Return on marketing invesment is **40.20%**.
- **Total Gross Profit/Loss:** The gross profit is **12,298,486**.

**Interpretation:**
- **Positive ROMI:** The positive ROMI and ROMI percentage rate indicate that the marketing efforts have been effective in generating revenue. For every dollar spent on marketing, the company is generating approximately 40 cents in profit.
- **Significant Gross Profit:** The substantial gross profit suggests that the business is generating a healthy margin on its sales.

![image](https://github.com/user-attachments/assets/00307999-e659-43bd-95d1-475d364711a7)


### Campaign-Level ROMI Analysis

- **Performing Campaign:**
  - **Youtube_blogger** has the **highest ROMI (277.32%) and gross-profit ($11.2 Million)**, indicating a significant return on investment along with **Facebook_retargeting** campaign strong positive **ROMI (101.50%)**.
  - Therefore, resources should be allocated to a similar campaign like Youtube_blogger and Facebook_retargeting in the future. It is recommended to a marketing team to review these two campaigns and how are they different from other campaigns. 

- **Underperforming Campaigns:**
  - **Facebook_lal** has the **lowest ROMI (-88.64%)**, indicating a significant loss on this campaign.
  - Both **Facebook_tier 1 (-6.57%) and Facebook_tier2 (-26.22%)** along with **Instagram_tier2 (-33.67%)** show negative ROMIs, suggesting that these campaigns are not generating sufficient revenue to cover their marketing costs.
  - Moreover, **three campaigns from Facebook** generate a **significant amount of loss (approximately $3.7 Million)**.
  - Therefore, the marketing team should minimize funds and marketing activity on the platform to review the strategy implemented on those channels. Find the underlying issues of of the ineffective results while comparing to more successful campaign from the same platform, Facebook_retargeting campaign.

![image](https://github.com/user-attachments/assets/d84eb8f8-d165-4dd6-8e84-631cfbba2070)
![image](https://github.com/user-attachments/assets/0dd3c472-7ab2-4d7d-bdf8-18bbdb8dda7b)


### Campaign Category Effectiveness
- **Influencer Marketing:**
  - Demonstrates a **strong return on investment (154.29%) despite a high CPC ($11.07) and CPL ($490.31)**.
  - Notably, this campaign type achieved the **lowest CAC ($2,755.58)** while yielding the highest ROMI. This likely stems from **high total clicks (749,973) and a relatively high total leads (16,939)**, indicating influencer campaigns effectively drive traffic and generate leads.
  - To optimize ROI, allocate more budget to influencer campaigns while reducing investment in less successful channels. Furthermore, the marketing team should implement strategies to increase the conversion rate from **leads to orders (3014 orders from 16,939 leads)**.

- **Media:**
  - Produced **moderate results with 420,003 total clicks, 10,149 total leads, and 1566 total orders**, demonstrating effectiveness in driving traffic, generating leads, and producing orders.
  - While the **CPC ($11.97) and CPL ($495.29)** are moderate, the **CAC ($3209.88)** is higher than influencer campaigns, indicating a higher cost per customer acquisition.
  - Despite this, the campaign type still generated a moderate-to-high **ROMI (22.41%)**, highlighting its effectiveness.
  
- **Search:**
  - Generated the **lowest total clicks (330,054), total leads (7107), and total orders (828)**, indicating weaker performance in driving traffic and generating leads.
  - While the **CPC ($10.48) and CPL ($486.90)** are relatively low, suggesting lower costs for clicks and leads compared to influencer and media campaigns, the high **CAC ($4179.23)** reflects a significant cost to acquire customers.
  - Due to these lower metrics, search campaigns generated a low **ROMI (7.07%)**, indicating a poor return on investment.
  
- **Social:**
  - **High total clicks (1,499,889) and total leads (31,384), along with the lowest CPC ($9.20) and CPL ($439.67)**, which indicate the effectiveness of social media campaigns in driving traffic and generating leads.
  - However, the **low conversion rate** from **leads to orders (2,635 orders out of 31,384 leads)** and the **highest CAC ($5,236.62)** have resulted in a negative **ROMI (-13.68%)**.
  - The marketing team should conduct a thorough analysis of all social media campaigns, focusing on factors such as:
    - Which platforms were used?
    - Which platforms generate the highest order-to-lead ratios?
    - Which platforms should be prioritized based on performance?
    - Which locations (Tier 1 or Tier 2) demonstrate higher conversion rates?
    - Which channels should have their budgets minimized or paused based on further review?
    
![image](https://github.com/user-attachments/assets/f2e53db9-d7a1-4f63-8782-dc30e1337d2e)

![image](https://github.com/user-attachments/assets/465d1b51-619e-42f7-9fbc-1be0f122ce7f)

![image](https://github.com/user-attachments/assets/592d53b3-1d0b-4209-b24b-0e55dfe048fc)


### Geolocation Targeting Analysis
- **Tier 1 cities:**
  - Demonstrate significantly better performance with a **total revenue of $6,940,536** and a positive **gross profit of $1,810,465** with a strong positive **ROMI of 35.29%.** This indicates that marketing efforts in Tier 1 cities are highly effective and profitable.
- **Tier 2 cities:**
  - Show significantly lower performance with a **total revenue of $4,133,766**, a negative **gross profit of -$1,626,258**, and a negative **ROMI of -28.23%**. This suggests that marketing efforts in Tier 2 cities are not generating sufficient revenue to cover the marketing costs, resulting in a loss.

**Recommendations:**
- **Prioritize Tier 1 Cities:**
  - Continue to prioritize marketing efforts in Tier 1 cities, as they have shown strong performance and profitability.
- **Re-evaluate Tier 2 Strategies:**
  - Analyze and refine targeting criteria for Tier 2 cities.
  - Re-evaluate messaging and creative to better resonate with the target audience in Tier 2 cities.
  - Consider adjusting budgets and allocating more resources to Tier 1 cities.
  - Explore alternative strategies or channels for reaching the target audience in Tier 2 cities.

![image](https://github.com/user-attachments/assets/fbfafa6e-6887-45c8-bb92-603bc3a82e49)


### Cost Per Click (CPC), Cost Per Lead (CPL), and Customer Acquisition Cost (CAC) Analysis

- **Top Performer:**
  - the **influencer campaign, youtube_blogger**, **ranks first** with the highest **gross profit of 11,253,496.49 and a ROMI of 277.32%**. It also achieved relatively **low CPC ($9.02), CPL ($408.61), CAC ($2,120.13)**, indicating efficient spending per click, lead generation, and customer acquisition.
  - The positive metrics signify the success and effectiveness of the campaign. Therefore, marketing team should allocate more fund in similar project with influencer.

- **Strong Performers:**
  - **Both the social campaign, instagram_tier1 and instagram_blogger**, demonstrate strong performance, with positive **gross profit at $1,978,846.75 and $1,561,086.43, respectively**.
  - Morever, both campaign generate relatively low CPC, CPL, and CAC.
  - However, **instagram_tier1** yield better **ROMI (77.14%)** compared to **instagram_blogger ROMI (36.75%)**. This difference could be attributed to the higher **CPC ($14.16), CPL ($606.07), and CAC ($3,861.24)** of instagram_blogger campaign.
  - Both campaign provide a great insight. and their metrics good performance overall. Additionally, the results indicate that Instagram might be a platform to prioritize over Facebook
  
- **Underperformers:**
  - **Facebook_LAL, facebook_Tier2, and facebook_Tier1** all show negative gross profits, ranging from **-$168K to -$2.3M**, with relatively high CPC, CPL, and CAC.
  - Notably, **facebook_LAL** recorded the **highest CPC ($22.01), CPL ($1,138.94), and CAC ($8,986.19)**, resulting in the most significant **gross profit loss of -$2,341,706.24**.
  - These metrics indicate major issues with the campaign. Therefore, the marketing team should investigate the listed campaigns and review the strategies used while minimizing budgets or pausing future campaign launches on Facebook.

![image](https://github.com/user-attachments/assets/e823da17-3bfb-4d8f-9e1e-26f74dda4061)
![image](https://github.com/user-attachments/assets/03458c73-b571-4254-bbb6-00738ce9c4ad)


## Recommendation
**Allocate and Relocate Budget**:
- **Increase Budget:** Allocate more budget to campaigns with the highest ROMI and gross profit. Refer to the data below for insights on campaigns that achieved the highest ROMI and gross profit.
- **Pause or Minimize Budget:** Suspend or significantly reduce budgets for underperforming campaigns, such as facebook_LAL, which reported the highest losses (ROMI: -88.64%). Similarly, reduce budgets for facebook_Tier1 and facebook_Tier2 campaigns.
- **Reallocate Resources:** Shift resources from underperforming Facebook campaigns to high-performing YouTube and Instagram campaigns.

**Cost Efficiency Improvement**:
- **Lower Cost Per Click (CPC) and Cost Per Lead (CPL):** Focus on platforms and campaigns with the most efficient CPC and CPL (e.g., YouTube and Instagram). For Facebook campaigns with high CPC ($22.01) and CPL ($1,138.94), revise targeting to exclude less engaged audiences.
- **Optimize Customer Acquisition Cost (CAC):** Shift focus to campaigns with the lowest CAC (e.g., YouTube Blogger with $2,120.13). Bundle offers to increase order values and offset higher CAC on other platforms.

**Channel Campaign Strategy**:
- **Influencer Campaign:** Allocate more budget to influencer campaigns while reducing investment in less successful channels. Moreover, expand partnerships by collaborating with additional influencers in niches similar to those in the YouTube Blogger campaign. Monitors influencer campaign engagement rates such as total clicks, leads, and orders to ensure high-quality partnerships.
- **Instagram Campaign:** Leverage Instagram Stories and Reels by utilizing video ads and interactive content to maximize engagement. Encourage user-generated content by launching challenges or hashtag campaigns. Collaborate with influencers and users to create fun, engaging content that drives traffic to our sites. Focus on targeting Tier 1 cities, as the Instagram_Tier1 campaign demonstrated a strong ROMI of 77.14%.
- **Facebook Campaign**: Analyze underperforming campaigns such as facebook_LAL, facebook_Tier2, and facebook_Tier1, and compare them to a more successful campaign from the same platform, such as facebook_Retargeting (ROMI: 101.50%). Evaluate whether the targeting criteria of the underperforming campaigns (e.g., location, interests, demographics) align with the intended audience. Investigate whether the underlying issues of these campaigns stem from differing targeting criteria compared to the facebook_Retargeting campaign.
 
**Geolocation Strategy**
- **Tier 1 Cities Prioritize Marketing Efforts:** Allocate more budget to Tier 1 while decreasing Tier 2 budget. Increase ad spend in Tier 1 cities, which have shown high revenue ($6.94M) and positive ROMI (35.29%). Tailor targeted ads to reflect local cultural trends and preferences within the city.

- **Tier 2 Cities Reassess Approach:** Focus on conducting research or surveys to understand audience behavior in Tier 2 cities. Afterward, Re-evaluate and test smaller campaigns with adjusted messaging and budgets. Explore alternative strategies or channels for reaching the target audience in Tier 2 cities.


## Technical Details
- **Excel:** Data cleaning, Power Query (merging queries, removing duplicates), formatting dates to align with SQL data format, and importing data into SQL.
- **SQL:** Manipulate data and ensure accuracy in calculation of KPI metrics such as CPC, CPL, CAC, gross profit, and ROMI. Use the results from these calculations to perform detailed analysis.
- **Tableau:** Creates data visualizations and dashboards to present insights and findings effectively.




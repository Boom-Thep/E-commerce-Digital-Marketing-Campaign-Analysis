-- Create table
CREATE TABLE reports(
num_id INT PRIMARY KEY,
campaign_date DATE,
campaign_name VARCHAR(100),
category VARCHAR(100),
campaign_id INT,
impressions INT,
marketing_spent DECIMAL (11,2),
clicks INT,
leads INT,
orders INT,
revenue INT
);


--Check to see if table is created
SELECT * FROM reports

--Insert Values into the table
-- \COPY reports FROM 'C:/Users/Dell/Downloads/Cleaned Data.csv' DELIMITER ',' CSV HEADER ENCODING 'utf8'
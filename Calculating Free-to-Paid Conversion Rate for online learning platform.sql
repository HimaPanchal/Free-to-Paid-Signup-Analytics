-- Set the database to be used
USE db_course_conversions;

-- Select data from the tables
SELECT * FROM db_course_conversions.student_engagement;
SELECT * FROM db_course_conversions.student_info;
SELECT * FROM db_course_conversions.student_purchases;

-- Calculate the free-to-paid conversion rate
-- First question
SELECT 
    ROUND(COUNT(first_purchase_date) / COUNT(first_engagement_date), 2) * 100 AS conversion_rate
FROM (
    SELECT 
        engagement.student_id,
        info.date_registered,
        MIN(engagement.date_watched) AS first_engagement_date,
        MIN(purchase.date_purchased) AS first_purchase_date,
        DATEDIFF(MIN(purchase.date_purchased), MIN(engagement.date_watched)) AS days_between_engagement_and_purchase
    FROM
        student_engagement engagement
    JOIN 
        student_info info ON engagement.student_id = info.student_id
    LEFT JOIN 
        student_purchases purchase ON engagement.student_id = purchase.student_id
    GROUP BY 
        engagement.student_id
    HAVING 
        first_purchase_date IS NULL OR first_engagement_date <= first_purchase_date
) conversion_data;

-- Calculate the average duration between registration date and first-time engagement
SELECT 
    ROUND(COUNT(first_purchase_date) / COUNT(first_engagement_date), 2) * 100 AS conversion_rate, 
    ROUND(SUM(days_between_registration_and_engagement) / COUNT(days_between_registration_and_engagement), 2) AS avg_registration_to_engagement_duration
FROM (
    SELECT 
        engagement.student_id,
        info.date_registered,
        MIN(engagement.date_watched) AS first_engagement_date,
        MIN(purchase.date_purchased) AS first_purchase_date,
        DATEDIFF(MIN(engagement.date_watched), info.date_registered) AS days_between_registration_and_engagement,
        DATEDIFF(MIN(purchase.date_purchased), MIN(engagement.date_watched)) AS days_between_engagement_and_purchase
    FROM
        student_engagement engagement
    JOIN 
        student_info info ON engagement.student_id = info.student_id
    LEFT JOIN 
        student_purchases purchase ON engagement.student_id = purchase.student_id
    GROUP BY 
        engagement.student_id
    HAVING 
        first_purchase_date IS NULL OR first_engagement_date <= first_purchase_date
) registration_to_engagement_data;

-- Calculate the average duration between first-time engagement and first-time purchase
SELECT 
    ROUND(COUNT(first_purchase_date) / COUNT(first_engagement_date), 2) * 100 AS conversion_rate, 
    ROUND(SUM(days_between_registration_and_engagement) / COUNT(days_between_registration_and_engagement), 2) AS avg_registration_to_engagement_duration,
    ROUND(SUM(days_between_engagement_and_purchase) / COUNT(days_between_engagement_and_purchase), 2) AS avg_engagement_to_purchase_duration
FROM (
    SELECT 
        engagement.student_id,
        info.date_registered,
        MIN(engagement.date_watched) AS first_engagement_date,
        MIN(purchase.date_purchased) AS first_purchase_date,
        DATEDIFF(MIN(engagement.date_watched), info.date_registered) AS days_between_registration_and_engagement,
        DATEDIFF(MIN(purchase.date_purchased), MIN(engagement.date_watched)) AS days_between_engagement_and_purchase
    FROM
        student_engagement engagement
    JOIN 
        student_info info ON engagement.student_id = info.student_id
    LEFT JOIN 
        student_purchases purchase ON engagement.student_id = purchase.student_id
    GROUP BY 
        engagement.student_id
    HAVING 
        first_purchase_date IS NULL OR first_engagement_date <= first_purchase_date
) engagement_to_purchase_data;

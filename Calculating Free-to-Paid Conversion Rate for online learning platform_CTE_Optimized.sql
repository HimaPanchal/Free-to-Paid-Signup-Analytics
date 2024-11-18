USE db_course_conversions;
WITH engagement_data AS (
    SELECT 
        e.student_id, 
        i.date_registered,
        MIN(e.date_watched) AS first_engagement_date,
        MIN(p.date_purchased) AS first_purchase_date,
        DATEDIFF(MIN(e.date_watched), i.date_registered) AS days_between_registration_and_engagement,
        CASE 
            WHEN MIN(p.date_purchased) IS NOT NULL THEN 
                DATEDIFF(MIN(p.date_purchased), MIN(e.date_watched)) 
            ELSE NULL 
        END AS days_between_engagement_and_purchase
    FROM 
        student_engagement e
    JOIN 
        student_info i ON e.student_id = i.student_id
    LEFT JOIN 
        student_purchases p ON e.student_id = p.student_id
    GROUP BY 
        e.student_id, i.date_registered
    HAVING 
        first_purchase_date IS NULL OR first_engagement_date <= first_purchase_date
)
SELECT 
    ROUND(SUM(CASE WHEN first_purchase_date IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS conversion_rate,
    ROUND(AVG(days_between_registration_and_engagement), 2) AS avg_registration_to_engagement_duration,
    ROUND(AVG(days_between_engagement_and_purchase), 2) AS avg_engagement_to_purchase_duration
FROM 
    engagement_data;

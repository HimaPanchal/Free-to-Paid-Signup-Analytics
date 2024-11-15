# Free-to-Paid-Signup-Analytics
Calculating the Fraction of Students Who Convert to Paying Ones after Starting a Course in MySQL WorkBench

# Project Overview
The objective is to estimate the free-to-paid conversion rate among students who engage with video content on the 365 learn data science learning platform.There are 3 main tables and here is a sneak peak of the data available limit to 10 rows from MySQL Workbench : 
![image](https://github.com/user-attachments/assets/3d630b64-4ff0-432a-bfb6-545f81c1e321) <br>
![image](https://github.com/user-attachments/assets/d75202f9-7265-4b53-ba7c-4e94bc2536e4) <br>
![image](https://github.com/user-attachments/assets/c5fee064-8448-4211-8024-c4b8e6c337f3) <br>


Following are the fields in the column : 

**student_id** – (int) the unique identification of a student.<br>
**date_registered** – (date) the date on which the student registered on the 365 platform. <br>
**first_date_watched** – (date) the date of the first engagement.<br>
**first_date_purchased** – (date) the date of first-time purchase (NULL if they have no purchases).<br>
**date_diff_reg_watch** – (int) the difference in days between the registration date and the date of first-time engagement.<br>
**date_diff_watch_purch** – (int) the difference in days between the date of first-time engagement and the date of first-time purchase (NULL if they have no purchases.<br>
The project focuses on calculating the conversion rate from the first day of engagement, registration and purchase and includes the analysis of additional key metrics to draw meaningful conclusions from the data.

# Exploratory Data Analysis
**Following Questions to answer and Insights to uncover :** <br>
_What is the free-to-paid conversion rate of students who have watched a lecture on the 365 platform? <br>
What is the average duration between the registration date and when a student has watched a lecture for the first time (date of first-time engagement)? <br>
What is the average duration between the date of first-time engagement and when a student purchases a subscription for the first time (date of first-time purchase)?<br>_

**Free-to-Paid Conversion Rate:** <br>
This metric measures the proportion of engaged students who choose to benefit from full course access on the 365 platform by purchasing a subscription after watching a lecture. It is calculated as the ratio between:

The number of students who watched a lecture and purchased a subscription on the same day or later.
The total number of students who have watched a lecture.
Convert the result to percentages and call the field conversion_rate.
![image](https://github.com/user-attachments/assets/2f2db683-ab13-4b95-bf45-4e1a74e1d347) <br>


**Average Duration Between Registration and First-Time Engagement:** <br>
This metric measures the average duration between the date of registration and the date of first-time engagement. This will tell us how long it takes, on average, for a student to watch a lecture after registration. The metric is calculated by finding the ratio between:

The sum of all such durations.
The count of these durations, or alternatively, the number of students who have watched a lecture.
Call the field av_reg_watch.
![image](https://github.com/user-attachments/assets/1e79f711-d421-4d05-8397-7181360357bf)


**Average Duration Between First-Time Engagement and First-Time Purchase:** <br>
This metric measures the average time it takes individuals to subscribe to the platform after viewing a lecture. It is calculated by dividing:

The sum of all such durations.
The count of these durations, or alternatively, the number of students who have made a purchase.
Call the field av_watch_purch.
![image](https://github.com/user-attachments/assets/2bc80be7-ca46-4d51-a2c2-63b98b7c968f)


# DataSource
https://learn.365datascience.com/projects/calculating-free-to-paid-conversion-rate-with-sql/

# Free-to-Paid-Signup-Analytics
Calculating the fraction of students who convert to paying ones after starting a course in MySQL WorkBench

# Project Overview
The objective is to estimate the free-to-paid conversion rate among students who engage with video content on the 365 learn data science learning platform.There are 3 main tables and here is a sneak peak of the data available limit to 10 rows from MySQL Workbench : 

![image](https://github.com/user-attachments/assets/3d630b64-4ff0-432a-bfb6-545f81c1e321) <br>
![image](https://github.com/user-attachments/assets/d75202f9-7265-4b53-ba7c-4e94bc2536e4) <br>
![image](https://github.com/user-attachments/assets/c5fee064-8448-4211-8024-c4b8e6c337f3) <br>


Following are the fields in the column : 

**student_id** – (int) the unique identification of a student.<br>
**date_registered** – (date) the date on which the student registered on the 365 platform. <br>
**first_engagement_date** – (date) the date of the first engagement.<br>
**first_purchase_date** – (date) the date of first-time purchase (NULL if they have no purchases).<br>
**days_between_registration_and_engagement** – (int) the difference in days between the registration date and the date of first-time engagement.<br>
**avg_engagement_to_purchase_duration** – (int) the difference in days between the date of first-time engagement and the date of first-time purchase (NULL if they have no purchases.<br>
The project focuses on calculating the conversion rate from the first day of engagement, registration and purchase and includes the analysis of additional key metrics to draw meaningful conclusions from the data.

# Exploratory Data Analysis
**The questions I wanted to answer through my SQL queries were:** <br>
1. What is the free-to-paid conversion rate of students who have watched a lecture on the 365 platform? <br>
2. What is the average duration between the registration date and when a student has watched a lecture for the first time (date of first-time engagement)? <br>
3. What is the average duration between the date of first-time engagement and when a student purchases a subscription for the first time (date of first-time purchase)?<br>_

**Free-to-Paid Conversion Rate:** <br>
This metric measures the proportion of engaged students who choose to benefit from full course access on the 365 platform by purchasing a subscription after watching a lecture. It is calculated as the ratio between:

The number of students who watched a lecture and purchased a subscription on the same day or later.
The total number of students who have watched a lecture.
Convert the result to percentages and call the field conversion_rate.


**Average Duration Between Registration and First-Time Engagement:** <br>
This metric measures the average duration between the date of registration and the date of first-time engagement. This will tell us how long it takes, on average, for a student to watch a lecture after registration. The metric is calculated by finding the ratio between:

The sum of all such durations.
The count of these durations, or alternatively, the number of students who have watched a lecture.
Call the field av_reg_watch.

**Average Duration Between First-Time Engagement and First-Time Purchase:** <br>
This metric measures the average time it takes individuals to subscribe to the platform after viewing a lecture. It is calculated by dividing:

The sum of all such durations.
The count of these durations, or alternatively, the number of students who have made a purchase.
Call the field av_watch_purch.
![image](https://github.com/user-attachments/assets/2bc80be7-ca46-4d51-a2c2-63b98b7c968f)

# Insights drawn from a first glance : 
--Let’s begin by examining the results of the free-to-paid conversion rate metric. Approximately 11% of students who watch a lecture on the platform proceed to purchase a subscription (monthly, quarterly, or annual). This means that out of every 100 students engaging with the 365 platform, around 11 decide to become paying subscribers. While this figure may initially appear low, it’s worth exploring the underlying factors more closely.

--A notable portion of students register on the platform primarily out of curiosity. However, several reasons may explain why many do not fully engage with the program. One key factor could be the broad targeting approach, which may not specifically focus on data science enthusiasts who are eager to start their journey in the field.

--Additionally, as the platform caters primarily to beginners, students may feel uncertain about how to get started. Should they dedicate weeks to mastering an object-oriented programming or language like Python, a query language like SQL, or a data visualization tool such as Tableau or Power BI ? What foundational knowledge is required for each? To address this, the 365 team introduced a personalized onboarding sequence in August 2023, designed to create a customized learning path for each student. This initiative helps guide users on where to begin and how to progress.

--Still, some users may not be ready to commit to a data science journey immediately. For instance, college students might be preoccupied with exam preparations, or working professionals might struggle to allocate the necessary time.

--Lastly, it’s essential to recognize that some users may prefer alternative platforms for their first steps into data science. Regardless of the reasons, proactively engaging with customers, identifying areas for improvement, and continually refining the platform are critical to delivering a better product. This data can be proved super useful for upcoming marketing campaigns, marketing and strategy teams to increase their subscription sale.

# Insights Interpretation
**Distribution Symmetry**
The distribution is likely symmetrical when the mean, median, and mode are equal or very close, forming a bell curve. If they differ, the data might be skewed to the left—indicated by a long tail on the left side—or to the right with a long tail on the right side.

The number that repeats the most in the data is 0 (Mode). Additionally, the number that sits in the middle of the dataset is also 0 (Median). Such metric values indicate the right-skewness of the data — i.e., we can find outliers to the right and long tail is at the right, towards higher values, of the data distribution. This implies that some students in the dataset have registered on the platform but started watching a video much later. Let's check the visual distribution of the same : 

**Outliers**
If the mean is much higher or lower than the median, it suggests that there are outliers. For instance, if the average time to purchase a subscription is significantly higher than the median, it may imply that a few students took an exceptionally long time to decide.

**Common Patterns**
If a specific value or set of values has a high frequency—corresponding to the mode of the dataset—it can spotlight common behaviors. For instance, a mode of zero or one day between registration and lecture viewing suggests that most students begin watching on the registration day or the day after.

# DataSource
https://learn.365datascience.com/projects/calculating-free-to-paid-conversion-rate-with-sql/

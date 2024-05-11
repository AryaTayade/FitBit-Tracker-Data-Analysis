# FitBit Tracker Data Analysis 

## Table of Contents
1. [Introduction](#introduction)
2. [About BellaBit](#about-bellabit)
3. [Database and Tool Selection](#database-and-tool-selection)
4. [Data Preprocessing](#data-preprocessing)
5. [Exploratory Data Analysis](#exploratory-data-analysis)
6. [Descriptive Analysis](#descriptive-analysis)
7. [Customer Behaviour Dashboard](#customer-behaviour-dashboard)
8. [Conclusion](#conclusion)



## Introduction

This project focuses on leveraging data from fitness tracker bands to aid Bella Beat, in improving its marketing campaigns and suggesting feature enhancements for its products. Bella Beat is interested in gaining insights from competitor data, specifically Fitbit tracker data, to inform its strategic decisions.

Project Objective:
The primary objective of this project is to analyze Fitbit tracker data to understand how users interact with their devices and to identify patterns and trends that can be useful for Bella Beat's marketing efforts and product development strategies.

## About BellaBit

Bellabeat specializes in beautifully designed health-focused smart products for women. By collecting data on activity, sleep, stress, and reproductive health, the company empowers women with insights into their own wellness. Bellabeat's rapid growth since 2013 has been supported by its focus on digital marketing and traditional advertising. Analyzing consumer data can help identify opportunities for further growth. Insights into smart device usage trends can guide Bellabeat's marketing strategy to better target its audience and enhance customer engagement. High-level recommendations may include optimizing social media content and campaigns based on usage patterns.


## Database and Tool Selection

Initially, I attempted to undertake this project using MySQL Workbench. However, due to MySQL's strict formatting requirements, significant data loss occurred during the table import process.

The tools I employed:

- *Google BigQuery*: This platform facilitated smooth data importation without encountering any data loss.

- *Looker*: I utilized Looker for efficient data analysis, enabling me to gain deeper insights and perform exploratory data analysis (EDA) swiftly.

- *Power BI*: Leveraging Power BI, I presented customer behavior trends effectively, aiding in the formulation of enhanced marketing strategies.



## Data Preprocessing

### Data Selection 

The dataset consisted of about 30 tables. I directly used some, like the "sleepday" table, and combined others like "dailyactivities" and "weightlog info" by merging them based on date differences through unions, then treating them as temporary tables.

Reasons for selection:

- The "daily activity" tables contained most of the important columns, eliminating the need to include other tables individually.
- I pre-defined questions to match our goals of improving the marketing campaign and features, then selected tables accordingly.

### Data Cleaning 

- Checked and deleted null values
- Removed duplicates
- Checked for data loss after importing

### Data Manipulation

- Converted date format to the sql standard format of yyyy-mm-dd
- Rounded the decimal precision for easier analysis
- Created new columns for visualization in PowerBI


## Exploratory Data Analysis

1) On which day are users super active?


![Screenshot (265)](https://github.com/AryaTayade/Sales-Insights-Visualization/assets/142443966/1022237e-11f6-4f32-b0ab-266a13e7c06d)

*Observation*:
Activity levels across days remain relatively consistent, with a notable increase on Tuesdays and a dip on Mondays, indicating distinct user engagement patterns.

*Marketing Recommendation*:
To capitalize on heightened engagement, consider hosting live workout sessions specifically on Tuesdays to drive increased participation and interaction. This initiative could enhance brand awareness and customer retention.

2) Which type of activity is higher in users?

![Screenshot 2024-05-11 203313](https://github.com/AryaTayade/Sales-Insights-Visualization/assets/142443966/19e77017-7cf1-4842-891e-f4a150ee322e)

*Observation*: 
Most of the time people are lightly active

3) Is the logging activity feature useful?

![Screenshot (270)](https://github.com/AryaTayade/Sales-Insights-Visualization/assets/142443966/a8620d7d-d2a0-46b8-9263-edc4d2b4ade5)

*Observation*: 
It does not seem useful because only 56 out of 1256 records were tracked manually.

4) How does the different activity time differ in overweight and healthy people?

![Screenshot 2024-05-10 173945](https://github.com/AryaTayade/Sales-Insights-Visualization/assets/142443966/c942861e-7c37-4273-b98e-3d064c2922c7)

![Screenshot 2024-05-10 173439](https://github.com/AryaTayade/Sales-Insights-Visualization/assets/142443966/ea0bf2bd-b5bc-4582-ae98-6eca9e47e0de)

*Observation*:
I compared the activity minutes between overweight and healthy individuals based on BMI, no significant difference was observed. This suggests that factors beyond physical activity, such as health conditions or metabolic patterns, may contribute to overweight status. However, conclusive insights were hindered by insufficient data, preventing identification of the exact cause.

*Marketing Recommendation*:
To address potential barriers to weight loss, Bella Beat could offer educational content to raise awareness about various factors that may affect weight management. By providing valuable insights and resources, Bella Beat can increase its authority and create a differentiating factor.

5) Average time wasted in bed?

![Screenshot 2024-05-08 162810](https://github.com/AryaTayade/Sales-Insights-Visualization/assets/142443966/4ef738dd-bddc-4d58-84df-6818545bb1b0)


*Observation*: 
Customers on an average waste 27.29 minutes in either falling asleep or waking up. 

## Descriptive Analysis

6) Is there a correlation between total calories burned and total steps?

![Screenshot (277)](https://github.com/AryaTayade/Sales-Insights-Visualization/assets/142443966/8b05827a-8e10-40ce-a896-b89859a1ee61)


*Observation*: 
There is a standard trend that if total steps are more the calories burned are more. 

7) Relation between total steps and calories burned

![Screenshot 2024-05-05 192804](https://github.com/AryaTayade/Sales-Insights-Visualization/assets/142443966/ed6ec3ea-b921-4f86-baac-f57982045f57)

*Observation*: 
But the data also shows that even with lower step count the calories burned can be more. This can be due to various other factors like the intensity of the activities differ (Example steps while walking and running).

8) How are calories related to different activity time?

![Screenshot 2024-04-29 132630](https://github.com/AryaTayade/Sales-Insights-Visualization/assets/142443966/618fad42-a845-49a6-b60c-5b23eabe206a)

![Screenshot 2024-05-05 191234](https://github.com/AryaTayade/Sales-Insights-Visualization/assets/142443966/b1d8cef0-f052-498a-8216-459113050c80)

9) Does time wasted in bed has any correlation with sedentary minutes?

![Screenshot 2024-05-10 191205](https://github.com/AryaTayade/Sales-Insights-Visualization/assets/142443966/3b03e8d0-1e97-4293-9766-3ecaf0a4fbae)

*Observation*: 
There is no correlation between the two.

## Customer Behaviour Dashboard

![Screenshot 2024-05-10 193118](https://github.com/AryaTayade/Sales-Insights-Visualization/assets/142443966/f427ce21-6aea-4eab-9fa5-329a75eabe0c)

## Conclusion

Upon thorough examination of the data, I uncovered promising relationships and trends in customer activities and behaviors. While the depth and direct relevance to Bella Beat's clientele were somewhat limited, this presents an exciting opportunity for future exploration and refinement of recommendations with access to more comprehensive and directly relevant data.

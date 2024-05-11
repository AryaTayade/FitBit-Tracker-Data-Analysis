CREATE TEMP TABLE daily_activities(
      Id INTEGER,
      ActivityDate DATE,
      TotalSteps INTEGER,
      TotalDistance FLOAT64,
      TrackerDistance FLOAT64,
      LoggedActivitiesDistance FLOAT64,
      VeryActiveDistance FLOAT64,
      ModeratelyActiveDistance FLOAT64,
      LightActiveDistance FLOAT64,
      SedentaryActiveDistance FLOAT64,
      VeryActiveMinutes INTEGER,
      FairlyActiveMinutes INTEGER,
      LightlyActiveMinutes INTEGER,
      SedentaryActiveMinutes INTEGER,
      Calories INTEGER
);

INSERT INTO daily_activities(
  SELECT * FROM `serious-energy-359710.Fitbit.daily_activity`
    UNION ALL
  SELECT * FROM `serious-energy-359710.Fitbit.daily_activity2`
);


CREATE TEMP TABLE weight_lof_info(
  Id INTEGER,
  DATE STRING,
  WeightKg FLOAT64,
  WeightPound FLOAT64,
  FAT INTEGER,
  BMI FLOAT64,
  IsManualReport BOOL,
  LogId FLOAT64
);

INSERT INTO weight_lof_info(
  SELECT Id, BMI FROM `serious-energy-359710.Fitbit.wlcpy`
      UNION ALL
  SELECT Id, BMI FROM `serious-energy-359710.Fitbit.WeightLog2`
);

-- Key Questions

-- 1) On which day are users super active?

SELECT  FORMAT_DATE('%A', ActivityDate) AS DayOfWeek,
        COUNT(VeryActiveMinutes) AS day_count
FROM daily_activities
GROUP BY DayOfWeek
ORDER BY day_count DESC;


-- 2) Which type of activity is higher in users?

SELECT SUM(VeryActiveMinutes) AS VeryActive, 
       SUM(FairlyActiveMinutes)AS FairlyActive, 
       SUM(LightlyActiveMinutes) AS LightlyActive, 
       SUM(SedentaryMinutes) AS SedentaryActive
FROM daily_activities;


-- 3) Is the logging activity feature useful?

SELECT
    SUM(CASE WHEN TotalDistance > 0 THEN 1 ELSE 0 END) AS count_activity_distance_by_user_totaldistance,
    SUM(CASE WHEN LoggedActivitiesDistance > 0 THEN 1 ELSE 0 END) AS count_activity_distance_by_user_loggedactivitiesdistance
FROM
    (SELECT * FROM `serious-energy-359710.Fitbit.daily_activity`
      UNION ALL
      SELECT * FROM `serious-energy-359710.Fitbit.daily_activity2`) sub;



-- 4) How does the different activity time differ in overweight and healthy people?

SELECT w.Id,
      ROUND(AVG(w.BMI),2)AS bmi_avg,
      ROUND(AVG(da.VeryActiveMinutes) ,2)as VeryActiveMinutes_avg,
      ROUND(AVG(da.LightlyActiveMinutes) ,2)as LightlyActiveMinutes_avg,
      ROUND(AVG(da.FairlyActiveMinutes) ,2)as FairlyActiveMinutes_avg
FROM daily_activities da
  JOIN weight_lof_info w
ON da.Id = w.Id
GROUP BY w.Id
HAVING bmi_avg>25;

SELECT w.Id,
      ROUND(AVG(w.BMI),2)AS bmi_avg,
      ROUND(AVG(da.VeryActiveMinutes) ,2)as VeryActiveMinutes_avg,
      ROUND(AVG(da.LightlyActiveMinutes) ,2)as LightlyActiveMinutes_avg,
      ROUND(AVG(da.FairlyActiveMinutes) ,2)as FairlyActiveMinutes_avg
FROM daily_activities da
  JOIN weight_lof_info w
ON da.Id = w.Id
GROUP BY w.Id
HAVING bmi_avg<25;


-- 5) The difference between time in bed and time of sleep?

SELECT ROUND(AVG(TotalTimeInBed) - AVG(TotalMinutesAsleep), 2) AS total_minutes_wasted_in_bed
 FROM (SELECT *
            FROM `Fitbit.SleepDay`
            WHERE (TotalTimeInBed-TotalMinutesAsleep)<100) sub
 ORDER BY total_minutes_wasted_in_bed DESC;




-- 6) Is there a correlation between total calories burned and total steps?
SELECT 
      TotalSteps,
      Calories
FROM daily_activities
  WHERE TotalSteps != 0
ORDER BY TotalSteps DESC;



-- 7) Relation between total steps and calories burned

SELECT calories_grp,
      ROUND(AVG(TotalSteps), 2) AS avg_steps
FROM 
(SELECT (CASE WHEN Calories BETWEEN 0 AND 1000 THEN '0-1000' 
            WHEN Calories BETWEEN 1001 AND 2000 THEN '1001-2000'
            WHEN Calories BETWEEN 2001 AND 3000 THEN '2001-3000'
            WHEN Calories BETWEEN 3001 AND 4000 THEN '3001-4000'
            WHEN Calories BETWEEN 4001 AND 5000 THEN '4001-5000'
            END) AS calories_grp,
      TotalSteps
FROM (SELECT * FROM `serious-energy-359710.Fitbit.daily_activity`
      UNION ALL
      SELECT * FROM `serious-energy-359710.Fitbit.daily_activity2`) daily_activities
  WHERE TotalSteps != 0) calories_vs_steps
GROUP BY calories_grp;

-- 8) How are calories related to different activity time?

SELECT VeryActiveMinutes,
      FairlyActiveMinutes,
      LightlyActiveMinutes, 
      SedentaryMinutes,
      Calories
FROM daily_activities;


-- 9) Does time wasted in bed has any correlation with sedentary minutes?

SELECT s.Id,
      ROUND(AVG(s.TotalTimeInBed - s.TotalMinutesAsleep), 2) AS time_wasted_in_bed,
      ROUND(AVG(d.SedentaryMinutes), 2) AS avg_time_spent_inactively
FROM daily_activities d
JOIN `Fitbit.SleepDay` s
ON d.Id = CAST(s.Id AS INT64)
GROUP BY s.Id
ORDER BY time_wasted_in_bed DESC;


       


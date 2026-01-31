
WITH 
top_paying AS 
(
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' 
        AND
        salary_year_avg IS NOT NULL
        AND
        job_work_from_home = TRUE       
GROUP BY skills_dim.skill_id
),
 top_demand AS
(
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS job_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND
        salary_year_avg IS NOT NULL
        AND 
        job_work_from_home = TRUE
        GROUP BY skills_dim.skill_id
)
SELECT
top_demand.skills,
avg_salary,
job_count
FROM top_demand
INNER JOIN top_paying ON top_demand.skill_id=top_paying.skill_id
WHERE top_demand.job_count > 10
ORDER BY 
avg_salary DESC,
job_count DESC

-- bardziej zwarta forma

SELECT
skills_dim.skill_id,
skills_dim.skills,
ROUND(AVG(salary_year_avg), 0) AS avg_salary,
COUNT(skills_job_dim.job_id) AS job_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND
        salary_year_avg IS NOT NULL
    AND 
    job_work_from_home = TRUE
GROUP BY skills_dim.skill_id
    HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    job_count DESC



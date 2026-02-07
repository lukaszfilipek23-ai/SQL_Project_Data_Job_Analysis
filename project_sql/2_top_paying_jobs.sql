-- Umiejętności najlepiej zarabiających analityków danych
WITH top_paying_jobs AS (
SELECT
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
	name AS company_name
FROM
	job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
	job_title = 'Data Analyst'
	AND salary_year_avg IS NOT NULL
	ORDER BY
	salary_year_avg DESC 
LIMIT 10
)
SELECT
	top_paying_jobs.job_id,
	top_paying_jobs.job_title,
	top_paying_jobs.company_name,
  skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id=top_paying_jobs.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id

/*
🥇 Umiejętności kluczowe (core skills)

SQL – 4

Python - 4

Tableau - 3


Najważniejsze wnioski 🚀

SQL 🧱 + Python 🐍 = absolutna podstawa analityka danych

Tableau 📊 = klucz do komunikacji z biznesem
*/
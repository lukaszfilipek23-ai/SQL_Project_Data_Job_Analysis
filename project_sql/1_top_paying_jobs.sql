--Top 10 najwyższego wyngrodzenia dla Analityków Danych
SELECT
	job_title,
	salary_year_avg,
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
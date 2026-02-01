-- Identyfikuje najlepiej płatne umiejętności
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' 
        AND
        salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
limit 25

🔎 Wnioski w 3 punktach

1️⃣ Wysokie wynagrodzenie = rzadkość + odpowiedzialność, nie „popularność”
Najlepiej płatne kompetencje są albo niszowe (SVN, Perl), albo obarczone 
dużym ryzykiem biznesowym (Solidity). Rynek płaci premię za brak zastępowalności
 i odpowiedzialność za systemy krytyczne, a nie za modne, masowe technologie.

2️⃣ Ciężar rynku przesuwa się z analizy w stronę infrastruktury i wdrożeń
Wyżej wyceniane są kompetencje związane z Data Engineering, MLOps i DevOps
 (Terraform, Kafka, Airflow, Couchbase) niż same narzędzia analityczne czy 
 frameworki ML. Dane i AI muszą działać w produkcji — i za to się dziś płaci.

3️⃣ Największą wartość ma myślenie systemowe, nie pojedynczy skill Narzędzia są 
wymienne, ale zdolność łączenia technologii, procesów i zespołów (GitLab, 
Atlassian, Notion) jest trwałą przewagą. Seniorzy zarabiają więcej, bo zarządzają 
złożonością, a nie dlatego, że znają jeden framework lepiej od innych.


-- Top 10 highest paying Data Analyst jobs in Singapore
SELECT
    job_title,
    job_location,
    job_schedule_type,
    ROUND(salary_year_avg,0) as Avg_Salary,
    cd.name as company_name
FROM job_postings_fact
LEFT JOIN company_dim cd ON job_postings_fact.company_id = cd.company_id
WHERE 
    job_title LIKE '%Data Analyst%'
    AND salary_year_avg IS NOT NULL
	AND job_location = 'Singapore'
ORDER BY salary_year_avg DESC
LIMIT 22;

-- Calculates average salary for each country for Data Analyst roles
SELECT
    job_postings_fact.job_country,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM job_postings_fact
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.salary_year_avg IS NOT NULL
    AND job_postings_fact.job_country IS NOT NULL
GROUP BY job_postings_fact.job_country
ORDER BY job_postings_fact.job_country ASC;
-- Top 10 highest paying Data Analyst jobs 
--ORDER BY avg_salary DESC
--LIMIT 10;
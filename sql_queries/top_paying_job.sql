-- Top 10 highest paying Data Analyst jobs in Singapore vs the word
SELECT
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    cd.name as company_name
FROM job_postings_fact
LEFT JOIN company_dim cd ON job_postings_fact.company_id = cd.company_id
WHERE 
    job_title LIKE '%Data Analyst%'
    AND salary_year_avg IS NOT NULL
	AND job_location = 'Singapore'
ORDER BY salary_year_avg DESC
LIMIT 10
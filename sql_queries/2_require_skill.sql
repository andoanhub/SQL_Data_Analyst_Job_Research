-- Gets the top 10 paying Data Analyst jobs 
WITH top_paying_job AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        job_country
    FROM job_postings_fact
    WHERE 
        job_title LIKE '%Data Analyst%'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC 
    LIMIT 10
)
)
-- Skills required for data analyst jobs
SELECT 
    top_paying_job.job_title,
    top_paying_job.salary_year_avg,
    skills_dim.skills,
    top_paying_job.job_country
FROM top_paying_job
JOIN
    skills_job_dim ON top_paying_job.job_id = skills_job_dim.job_id
JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY top_paying_job.salary_year_avg DESC


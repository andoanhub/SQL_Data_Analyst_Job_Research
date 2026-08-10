--Identify skills in high demand and associated with average salaries for Data Analyst roles that allow to WFH
SELECT 
        skills_dim.skills,
        COUNT(skills_job_dim.skill_id) AS demand_count,
        ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary   
FROM job_postings_fact
    JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.salary_year_avg IS NOT NULL
    AND job_postings_fact.job_work_from_home = True
GROUP BY skills_dim.skills
ORDER BY demand_count DESC
LIMIT 10;


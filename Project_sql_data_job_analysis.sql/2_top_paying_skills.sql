/*
Question: What akills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paring Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
  helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL 
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC;


/*
INSIGHTS:
Most In-Demand Skills
SQL — appeared 8 times
Python — 7 times
Tableau — 6 times
R — 4 times
Snowflake / Pandas / Excel — 3 times each
Highest Paying Skills (Average Salary)
PowerPoint — ~$255K
Jupyter — ~$255K
Azure — ~$222K
Power BI — ~$222K
AWS — ~$222K
Pandas / Excel — ~$215K
R — ~$215K
What This Actually Means
SQL + Python are the backbone skills. They dominate job postings.
Tableau and Power BI show companies still heavily value dashboarding and business storytelling.
Cloud skills (AWS, Azure, Snowflake) are pushing salaries upward.
Excel is still alive. The corporate dinosaur refuses extinction.
Pandas + Jupyter appearing in high-paying roles suggests analytical programming is becoming standard even for analysts.
Strong Pattern in Top Roles

The highest-paying analyst jobs were not “basic dashboard roles.”
They combined:

Analytics
Business strategy
Cloud/data infrastructure
Visualization
Programming
*/


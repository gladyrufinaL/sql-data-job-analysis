/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC 
LIMIT 25 


/*
1. Data Analysts Are Becoming “Data + Engineering” Hybrids

The highest-paying skills are not basic dashboard/reporting tools. They lean heavily toward data engineering and scalable systems:

Apache Spark / PySpark
Databricks
Apache Airflow
Kubernetes
Jenkins
Linux

Trend:
Companies are paying more for analysts who can handle pipelines, automation, cloud systems, and large-scale data — not just Excel dashboards.

Translation:
“SQL + dashboard” = entry-level analyst.
“SQL + Python + cloud + pipelines” = high-paying analyst.

That salary jump is massive.

2. Python Ecosystem Dominates High Salaries

Notice how many Python ecosystem tools appear:

Pandas
NumPy
Jupyter Notebook
Scikit-learn

This is one of the clearest signals in the market:
Python is no longer optional for higher-paying analyst roles.

Trend:
The market is moving from:

Traditional BI analyst
to
Analytics engineer / AI-enabled analyst / decision scientist.

If you know Python deeply, you unlock:

automation
machine learning
predictive analytics
AI workflows
large dataset processing

This is why Python-based analysts earn more.

3. Cloud Skills = Salary Multiplier

Cloud-related tools are everywhere:

Google Cloud (GCP)
Databricks
Kubernetes

Trend:
Data is moving fully to cloud ecosystems.

Companies want analysts who can:

query cloud warehouses
automate pipelines
work with distributed systems
collaborate with engineering teams

A data analyst who understands cloud infrastructure becomes much more valuable.

4. AI/ML Adjacency Is Increasing Salaries

You also have:

DataRobot
IBM Watson
Scikit-learn

Trend:
Companies increasingly want analysts who can move beyond descriptive analytics into:

forecasting
prediction
AI-assisted insights
anomaly detection
recommendation systems

You don’t necessarily need to become a hardcore ML engineer.
But analysts with ML literacy earn more because they bridge business + AI.

5. DevOps & Collaboration Skills Are Quietly Valuable

Interesting entries:

GitLab
Atlassian
Bitbucket

This tells you something important:
High-paying analysts are working closer to engineering/product teams.

They use:

Git
version control
collaboration workflows
deployment pipelines

Trend:
The isolated “business analyst making reports” role is shrinking.
Cross-functional technical analysts are rising.

6. Big Data Skills Pay Exceptionally High

PySpark at ~$208k is a huge signal.

Apache Spark skills are valuable because:

companies collect enormous data volumes
real-time analytics is growing
AI pipelines require scalable processing

This suggests:
The closer your skills are to “handling scale,” the higher the pay ceiling.

7. The Highest-Paying Skills Are NOT Beginner Skills

You’ll notice missing tools:

Excel
Power BI
Tableau

Why?

Because those skills are now baseline expectations.

High salaries come from skills that are:

harder to learn
more technical
automation-heavy
cloud-oriented
AI-adjacent
*/

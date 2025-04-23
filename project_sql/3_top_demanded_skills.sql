/*
Question: What are the most in-demand skills for data analysts?

Objective:
- Join job postings to the skills tables (just like Query 2).
- Identify the top 5 most frequently requested skills overall.
- Focus on all job postings, not just the top-paying ones.

Purpose:
- Retrieves the top 5 skills with the highest demand in the job market,
  providing insights into the most valuable and versatile skills for job seekers.
*/
 
 SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

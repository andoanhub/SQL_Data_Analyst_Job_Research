# SQL Data Analyst Job Research

## 📖 Introduction
This project focuses on analyzing the **Data Analyst** job market using **PostgreSQL**. By leveraging relational database design and advanced SQL queries, this project explores top-paying positions in Singapore, required skills, geographical salary differences, and work-from-home (WFH) trends.

---

## 🛠 Database Schema & Setup (`sql_load`)
The database schema consists of 4 tables designed to handle job postings, companies, and related technical skills:

* **`company_dim`**: Stores company profiles (`company_id`, `name`, `link`, `thumbnail`).
* **`skills_dim`**: Stores technical skills and categories (`skill_id`, `skills`, `type`).
* **`job_postings_fact`**: Contains core job listing details such as titles, locations, schedules, work-from-home status, and salaries (`job_id`, `company_id`, `job_title_short`, `salary_year_avg`, etc.).
* **`skills_job_dim`**: A junction table linking jobs to their corresponding skills via a composite primary key (`job_id`, `skill_id`).

---

## 📂 Project Directory Structure
```text
SQL_Data_Analyst_Job_Research/
│
├── sql_load/          # Database creation, table schemas, indexes, and CSV data import scripts
└── sql_queries/       # Analytical SQL queries answering key job market questions

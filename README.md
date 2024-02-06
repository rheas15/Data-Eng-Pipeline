# Data Engineering Pipeline: Python-AWS-SQL-Tableau

## Overview:

This project develops a data pipeline that involves querying data from the Census API, uploading it to the AWS Cloud using Python-SQL integration for efficient storage and collaboration, migrating it to MySQL Workbench to split data into relational tables and optimize data retrieval, and visualizing insights using Tableau.
The data contains characteristics of 143 employer firms in the United States which I use to understand the impact of demographic factors like race and sex on business outcomes.

## Pipeline:

- **API Data Retrieval ("API_AWS.ipynb"):**
  - Utilizes the Census API to fetch employer firm data for the years 2014-2016.
  - Data includes characteristics such as firm size, minority representation, and business ownership.

- **Cloud Integration ("API_AWS.ipynb"):**
  - Uploaded the retrieved data to the AWS Cloud using PyMySQL for secure storage and easy access to the dataset.

- **Database Management ("Relational_Tables.sql", "Relational_Data_Schema.pdf"):**
  - Migrated the data from AWS Cloud to MySQL Workbench for optimized data storage and simplified retrieval.
  - Implemented relational database design by splitting the dataset into three separate tables for efficient data management.

- **Data Visualization ("Tableau_Dashboard.pdf"):**
  - Visualized insights and trends from the processed data based on demographic factors using Tableau.
  - Identified significant findings, such as better outcomes for male-owned businesses compared to their counterpart.

## Potential Applications:

- **Policy Development:** Inform policy decisions aimed at promoting diversity and equity in entrepreneurship and business ownership.
- **Business Strategy:** Provide insights for businesses to develop targeted strategies for improving performance and addressing disparities.
- **Research Initiatives:** Serve as a foundation for further research on the intersection of demographic factors and business outcomes.



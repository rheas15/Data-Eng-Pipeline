-- Data Analysis Pipeline --
-- Efforts By: Rhea Sethi --

# STEP 1: Uploading Database

USE finalprojectdatabase;

SELECT * FROM finalprojectdatabase.Business_Characteristics;


# STEP 2: Cleaning Data

# STEP 2.1: From a close visual inspection of our data, we conclude that there are no columns that seem to be repeating. 
#Thus, we did not have a compelling reason to use the following code to check for duplicacy:

#SELECT COUNT(*) 
#FROM Business_Characteristics
#WHERE col1 <> col2; 


# STEP 3: Creating Relational Tables

# Identifier Table

SET @row_number := 0;
DROP TABLE IF EXISTS identif_table;
CREATE TABLE IF NOT EXISTS identif_table AS 
SELECT (@row_number := @row_number + 1) AS identif_id, t1.*
FROM
(SELECT DISTINCT name, year
FROM Business_Characteristics) AS t1;

SELECT * FROM identif_table;

# Employer's Characteristics Table: Minority 
# Creating temporary bridge table
SET @row_number := 0;
DROP TABLE IF EXISTS emp_minority_table_temp;
CREATE TABLE IF NOT EXISTS emp_minority_table_temp AS 
SELECT (@row_number := @row_number + 1) AS emp_minority_id, t2.*
FROM
(SELECT DISTINCT ASECB, ASECB_LABEL
FROM Business_Characteristics) AS t2;

# Final Minority table with joins
DROP TABLE IF EXISTS emp_minority_table;
CREATE TABLE IF NOT EXISTS emp_minority_table AS
SELECT emp_minority_table_temp.emp_minority_id, ASECB, ASECB_LABEL, employee_id
FROM emp_minority_table_temp
LEFT JOIN data_table
ON emp_minority_table_temp.emp_minority_id = data_table.emp_minority_id;

SELECT * FROM emp_minority_table;

DROP TABLE employee_minority_table_temp;

# Employer's Characteristics Table: Business Ownership
# Creating temporary bridge table
DROP TABLE IF EXISTS emp_owners_table_temp;
CREATE TABLE IF NOT EXISTS emp_owners_table_temp AS 
(SELECT DISTINCT spouses AS emp_owner_ID, spouses_label
FROM Business_Characteristics);

SELECT * FROM emp_owners_table_temp;

# Final Business Ownership table with joins
DROP TABLE IF EXISTS emp_owners_table;
CREATE TABLE IF NOT EXISTS emp_owners_table AS
SELECT emp_owners_table_temp.emp_owner_id, spouses_label, employee_id
FROM emp_owners_table_temp
LEFT JOIN data_table
ON emp_owners_table_temp.emp_owner_id = data_table.emp_owner_id;

SELECT * FROM emp_owners_table;

DROP TABLE emp_owners_table_temp;

# Final Table 
SET @row_number := 0;
DROP TABLE IF EXISTS data_table;
CREATE TABLE IF NOT EXISTS data_table AS
SELECT (@row_number := @row_number + 1) AS employee_id, t5.*
FROM
(SELECT firmpdemp, firmpdemp_pct, rcppdemp, rcppdemp_pct, emp, emp_pct, payann, 
payann_pct, firmpdemp_s, firmpdemp_pct_s, rcppdemp_s, rcppdemp_pct_s, emp_s, emp_pct_s, payann_s, 
payann_pct_s, identif_id, emp_minority_id, emp_owner_id
FROM Business_Characteristics
LEFT JOIN identif_table
ON Business_Characteristics.year = identif_table.year
LEFT JOIN emp_minority_table
ON Business_Characteristics.ASECB = emp_minority_table.ASECB
LEFT JOIN emp_owners_table
ON Business_Characteristics.spouses_label = emp_owners_table.spouses_label) AS t5;

SELECT * FROM data_table;


#We use the Schema Editor to add primary and foreign keys in our tables, and to change the data type for some columns as appropriate


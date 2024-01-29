# IBM_Employee_Attrition

****<ins>Introduction</ins>****

SQL is used in managing and querying a database. understanding employee attrition is a critical aspect in the workforce. I embarked on an analysis of employee attrition dataset which contains a variety of factors that may contribute to employee attrition.

***I used MYSQL in this project to query and extract results from the dataset provided. I Used the ***<ins>train</ins>*** dataset provided of the two given in the Ibm Empployee Attrition.***

****<ins>Data Exploration</ins>****

The data was clean and the needed transformation was changing the Dataset name using excel (I was using this data for learning purposes).
I uploaded the dataset as a csv file in MYSQl using the data import wizard. 

****<ins>An Overview of the data used</ins>****

**Defining the structure of the table**

----
DESCRIBE ibm_employee_attrition;

The code above gives the table schema including the column names, and the datatypes in each column.  ![image](https://github.com/zilphar/IBM_Employee_Attrition/assets/116642579/a3570855-b249-42a7-9055-50bdbdf53203)

----

SELECT COUNT(EmployeeNumber) AS total_no_of_employees

FROM ibm_employee_attrition; 

The above query returns the number of rows or the number of employees in the dataset. ![image](https://github.com/zilphar/IBM_Employee_Attrition/assets/116642579/ad29e141-30aa-4e42-b616-37aa821e46cc)

----

SELECT COUNT(*) no_of_columns

FROM information_schema.columns

WHERE Table_name = "ibm_employee_attrition";

The above query returns the number of columns in the table. ![image](https://github.com/zilphar/IBM_Employee_Attrition/assets/116642579/e6df9f27-1637-4a12-8f0b-3f59943354d1)

----

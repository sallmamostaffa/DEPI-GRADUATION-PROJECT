# eduX E-learning Platform  
**Revolutionizing Learning with Data-Driven Insights**  

E-learning platforms aim to transform the way people learn by providing a personalized, interactive, and scalable solution for skill development. This project integrates powerful data management tools, data science techniques, and modern cloud technologies to ensure a seamless and enriching educational experience.

---

## Mission  
Our mission is to enhance the e-learning experience through data-driven insights. By managing and analyzing user data effectively, we:  
- Track user behavior, preferences, and engagement to deliver personalized content.  
- Empower platform administrators with detailed insights into user activities and trends.  
- Drive data-driven decisions to improve user experience and business performance.  

---

## Project Phases  

### Phase 1: Data Management and Database Setup  
- **Database Design**  
  - We designed a relational database using SQL Server that ensures reliable storage and retrieval of customer data, course content, and interaction history.
    ![Alt Text](image-url)

---

### Phase 2: Data Warehousing  
- **Data Warehouse Implementation**
  - Bus matrix To identify business processes and turn them into Data Marts.
  - Business Schema: Our data warehouse follows a dimensional model with fact tables (such as FactUserProgress) that record customer actions and dimension tables (e.g., DimUsers,   
    DimCourse, DimLesson) that provide detailed descriptions of each customer, course, or interaction so that we can apply CHURN analysis on it.

### Phase 2: population 
- **ETL Process with SSIS**  
  We designed and implemented an ETL (Extract, Transform, Load) process using SQL Server Integration Services (SSIS). This allowed us to extract data from the operational database and transform it into meaningful structures for analysis in the data warehouse.


---

### Phase 3: Python Programming  
- **Data Loading**  
  - Utilized SQLAlchemy for seamless data integration.  

- **Data Cleaning**  
  - Checked for null values in fact tables:  
    - Replaced 48 null values in `ProgressStatus` with "Not Started."  

- **Exploratory Data Analysis (EDA)**  
  - Extracted SQL queries to prepare for machine learning:  
    - User progress summaries  
    - Quiz performance analysis  
    - Assignment completion and due date tracking  
    - Certificate issuance rates  
    - Evaluation score distribution  
    - User engagement insights  

---

### Phase 4: Data Science  
- **Data Analysis**  
  - Conducted churn analysis to understand user retention patterns.  

- **Machine Learning Models**  
  - **Features**: Derived meaningful features for churn prediction.  
  - **Applied Models**:  
    - Logistic Regression Classifier  
    - Random Forest Classifier  
    - XGBoost  

---

### Phase 5: Deployment  
- **Data Insertion**  
  - Manual data insertion.
 
    ![image](https://github.com/user-attachments/assets/66bff9ec-71e6-402f-aa6b-ced18f321a14)

  - Bulk data insertion for efficient handling.
   ![image](https://github.com/user-attachments/assets/c2c9f209-fd75-4060-833e-87151c4edcac)


---

## Future Work  
- Implement the entire project on a cloud environment to ensure higher performance and scalability.  

---

## Our Team  
- [Salma Mostafa](https://www.linkedin.com/in/sallmamostaffa/)  
- [Maya Assem](https://www.linkedin.com/in/maya-assem-611b4723b/)  
- [Fairouz Maher](https://www.linkedin.com/in/fairouz-ghazaly-76103227b/)  
- [Amany Ahmed](https://www.linkedin.com/in/amany-ahmed-4ba22632b/)  
- [Mawada Abdelsalam](https://www.linkedin.com/in/mawada-a-salam-20a3b7274/)  


## Contact Us  
For inquiries or collaboration, reach out to us via our LinkedIn profiles.

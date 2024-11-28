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
  - Designed a relational database using SQL Server to store:  
    - Customer data  
    - Course content  
    - Interaction history  

---

### Phase 2: Data Warehousing  
- **Data Warehouse Implementation**  
  - Created a bus matrix to identify business processes and derive Data Marts.  
  - Developed a dimensional model with:  
    - **Fact Tables**: (e.g., `FactUserProgress`) to record customer actions.  
    - **Dimension Tables**: (e.g., `DimUsers`, `DimCourse`, `DimLesson`) for detailed descriptions.  

- **ETL Process with SSIS**  
  - Extracted data from the operational database.  
  - Transformed data into meaningful structures.  
  - Loaded data into the data warehouse.  

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
  - Bulk data insertion for efficient handling.  

---

## Future Work  
- Implement the entire project on a cloud environment to ensure higher performance and scalability.  

---

## Our Team  
- [Maya Assem](https://linkedin.com)  
- [Fairouz Maher](https://linkedin.com)  
- [Amany Ahmed](https://linkedin.com)  
- [Salma Mostafa](https://linkedin.com)  
- [Mawada Abdelsalam](https://linkedin.com)  

---

## Contact Us  
For inquiries or collaboration, reach out to us via our LinkedIn profiles.

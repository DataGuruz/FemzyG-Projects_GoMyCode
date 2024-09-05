#!/usr/bin/env python
# coding: utf-8

# In[ ]:


pip install ydata_profiling


# In[9]:


import seaborn as sns
from ydata_profiling import ProfileReport


# Use pandas to read the file into a DataFrame:

# In[10]:


import pandas as pd


# In[11]:


education_df = pd.read_csv('EDUCATION_ATTAINMENT.csv')  


# In[12]:


# Display general information  
#Run descriptive analysis on the dataset using the 'describe' function:
print(education_df.info()) 


# In[13]:


# Get descriptive statistics  
descriptive_stats = education_df.describe()  
print(descriptive_stats)


# 
# Step 2: Data Exploration with ydata-profiling
# Use ydata-profiling to generate a report:
# 

# In[ ]:


# Generate and save the report  
profile=ProfileReport(education_df, title = 'Education Profile Report', explorative = True)


# In[9]:


profile.to_file('Education_report')


# In[10]:


profile.to_notebook_iframe()


# ### Summary

# Step 3: Summary
# Summary of Findings (Example Template)
# 
# Based on the analysis conducted using ydata-profiling, several noteworthy insights emerge from the "Education Attainment and Enrolment Around The World" dataset:
# 
# Data Quality: The dataset contains missing values in certain columns, particularly among specific grades or demographic groups. This could indicate gaps in data collection or reporting.
# 
# Descriptive Statistics: The descriptive analysis highlights the average completion percentages for each grade among different demographic groups. For instance, the average percentage of the overall population completing grade X may differ significantly across countries.
# 
# Correlations: The correlation analysis reveals relationships between educational attainment and potentially related variables, such as economic indicators or gender-related disparities in education.
# 
# Interesting Patterns: The report may indicate gender disparities in educational attainment, with differences observed between male and female completion rates across grades. Furthermore, trends over time (if available) can showcase improvements or declines in educational attainment in specific regions.
# 
# Geographic Trends: If geographical data is included, patterns may emerge that show how educational attainment varies by country or region, reflecting socio-economic factors.

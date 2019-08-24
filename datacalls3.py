# -*- coding: utf-8 -*-
"""
Created on Tue Aug  6 16:33:18 2019

@author: Vignesh
"""

import os
import pandas as pd
import numpy as np
from datetime import datetime[]
import matplotlib.pyplot as plt
import seaborn as sns
#import data
data_calls = pd.read_excel(r'C:\Users\Vignesh\Desktop\Data\calls data.xlsx')
data_calls.columns
data_calls.info()
data_calls.isnull().sum()
data_calls.index
data_calls.head()
data_calls.dtypes
data_calls.iat[5,1]
data = pd.DataFrame(data_calls)
data
data.dtypes
#-------------------------------------------------------------------------------
#del sunday and sat
#-------------------------------------------------------------------------------
data_calls.info
df = data_calls.iloc[:,0:2]
df = df.rename(columns = {'':'DATE'})
df.columns=['DATE','CALLS']
df.shape
df1 = data_calls.iloc[:,2:4]
df1.columns = ['DATE','CALLS']
df1
df1.columns
df2 = data_calls.iloc[:,4:6]
df2.columns = ['DATE','CALLS']
df3 = data_calls.iloc[:,6:8]
df3.columns = ['DATE','CALLS']
df4 = data_calls.iloc[:,8:10]
df4.columns = ['DATE','CALLS']
df_all = pd.concat([df,df1,df2,df3,df4])
df_all
df_all.shape
df_filter = df_all[(df_all.CALLS != 'Saturday') & (df_all.CALLS != 'Sunday')]
df_filter.shape
df_filter
#imputing days and months
df_filter['DAYS'] = df_filter['DATE'].apply(lambda x: x.day_name())
df_filter['MONTH'] = df_filter['DATE'].apply(lambda x: x.month_name())
df_filter
df_filter.loc[:,'CALLS'].mean()
CALLS = {'holiday':0}
#df_filter.CALLS = [CALLS[item] for item in df_filter.CALLS]
#print(data_filter)
#df_filter.CALLS[df_filter.CALLS =='holiday'] =0
#print(df_filter)
#df_filter.dtypes
#df['A'].apply(lambda x: x.strftime('%d%m%Y'))
#df_filter['DATE'].apply(lambda x: x.strftime('%Y%m%d'))
#df_filter['DATE'] = df['DATE'].strftime('%Y%m%d')
#----------------------------------
#for CALLS in df_filter:
 #   df_filter[CALLS]= df_filter[CALLS].astype(dtype=np.float64)
# -------------------
#for CALLS in df_filter:
#    if df_filter.CALLS == 'holiday':
#        df.filter.CALLS.append(0)
   # niputing average into holiday  
#print(df_filter)   
#df_filter.iloc[:14:,1:2]
#for col in df: df[col].str.contains('^') – EdChum Oct 29 '14 at 20:48
   
#------------------------------------------------------------------------------
# now the holiday  converted to zero 
#------------------------------------------------------------------------------
df_filter.CALLS
for CALLS in df_filter: 
    df_filter.CALLS = df_filter.CALLS.astype(str).str.replace("Holiday"," ")
---------------------------------------------------------
# Changing the string in the column to numeric 
    -------------------------------------------------
df_filter.CALLS = pd.to_numeric(df_filter.CALLS, errors = 'coerce')
df_filter   
----------------------------------------------------------------

#df_filter.loc[:,'CALLS'].mean()
#df_filter.CALLS = df_filter.CALLS.astype(int)
#for CALLS in df_filter:
#df_filter.CALLS.dtypes
#df_filter.DAYS.dtypes    
#if df_filter.CALLS == '0':
#    df_filter[['CALLS']] = df_filter[['CALLS']].apply(pd.to_numeric((CALLS,downcast='integer'))
#df_filter.dtypes
#df_filter.isnull().sum()
#df_filter.shape
#df_filter.CALLS.sum()
#df_filter = df_filter.astype({'CALLS': int})
    --------------------------------------------------------------------------------
    #convertted string column to numeric
#df.ID = pd.to_numeric(df.ID, errors='coerce')
#df_filter.CALLS = pd.to_numeric(df_filter.CALLS, errors = 'coerce')
-------------------------------------------------------------------------------------
# CHECKING NULL VALUES 
-------------------------------------------------------------------------------------
df_filter.CALLS.dtypes
df.filter
df_filter.CALLS.isnull().sum()
df_filter.CALLS.mean()
--------------------------------------------------
# SORTING BY DATE 
-----------------------------------------
df_filter = df_filter.sort_values(by =['DATE'])
-------------------------------------
# GROUPING BY EACH DAYS 
--------------------------------------------------------------------

df_filter1 = df_filter[df_filter['DAYS'].str.contains('Monday')]
print(df_filter1)

df_filter1.CALLS.mean()
df_filter1.CALLS.sum()
df_filter1.CALLS.count()
print(4705.0/21)
df_filter1['CALLS'] = df_filter1['CALLS'].fillna(np.mean(df_filter1['CALLS']))
df_filter1


df_filter2 = df_filter[df_filter['DAYS'].str.contains('Tuesday')]
df_filter2
df_filter2.CALLS.mean()
df_filter2['CALLS'] = df_filter2['CALLS'].fillna(np.mean(df_filter2['CALLS']))
df_filter2

df_filter3 = df_filter[df_filter['DAYS'].str.contains('Wednesday')]
df_filter3

df_filter4 = df_filter[df_filter['DAYS'].str.contains('Thursday')]
df_filter4.CALLS.mean()
df_filter4['CALLS'] = df_filter4['CALLS'].fillna(np.mean(df_filter4['CALLS']))
df_filter4

df_filter5 = df_filter[df_filter['DAYS'].str.contains('Friday')]
df_filter5
---------------------------------------------------------------------
#make a sub plot
----------------------------------------------------------------
# CONCATENATING ALL THE SEPARATED DF
---------------------------------------------------------------
df_filter_all = pd.concat([df_filter1,df_filter2,df_filter3,df_filter4,df_filter5])

df_filter_all
df_filter_all = df_filter_all.sort_values(by =['DATE'])
df_filter_all.round({'CALLS':0})
df_filter_all.CALLS.sum()

-----------------------
#HISTOGRAM plot
df_filter_all.groupby('MONTH').plot(x ='DATE',y = 'CALLS')
fig,ax = plt.subplots()
df_filter_all.groupby('MONTH').plot(x='DATE', y='CALLS', ax=ax, legend=False)
----------------------------------------------------------------------
#TREND FOR EACH MONTH BAR PLOT  
------------------------------------------------------------------------
#plt.bar(x=df_filter_all['DATE'].dt.month, height = df_filter_all['CALLS'])

for month in df_filter_all['MONTH'].unique():
    df_month = df_filter_all[df_filter_all['MONTH']==month]
    plt.bar(df_month['DATE'],df_month['CALLS'])
plt.xlabel('DATE')
plt.ylabel('CALLS')
plt.title('MONTH V/S CALLS')
plt.xticks(y_pos, bars)
plt.show()
--------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
# TREND FOR ALL BAR PLOT 
---------------------------------------------------------------------------
month_calls_sum = []
for month in df_filter_all['MONTH'].unique():
    month_calls_sum.append(df_filter_all[df_filter_all['MONTH'] == month]['CALLS'].sum())

plt.bar(df_filter_all['MONTH'].unique(), month_calls_sum)

--------------------------------------------------------------------------
#Droping the month and dates column 
-------------------------------------------------
df_drop = df_filter_all.drop(columns = ['MONTH','DAYS'])
df_drop
--------------------------------------------------------------------------------------
#CREATING ANOTHER DATASET 
--------------------------------------------------------------------------------------   
df_filter_all
for DAYS in df_filter_all: 
    df_filter_all.DAYS = df_filter_all.DAYS.astype(str).str.replace("Monday","1")
    df_filter_all.DAYS = df_filter_all.DAYS.astype(str).str.replace("Tuesday","2")
    df_filter_all.DAYS = df_filter_all.DAYS.astype(str).str.replace("Wednesday","3")
    df_filter_all.DAYS = df_filter_all.DAYS.astype(str).str.replace("Thursday","4")
    df_filter_all.DAYS = df_filter_all.DAYS.astype(str).str.replace("Friday","5")
df_dataset = df_filter_all
df_dataset    
df_dataset1 = df_dataset.drop(columns =['MONTH'])
df_dataset1.round({'CALLS':0})
df_dataset1


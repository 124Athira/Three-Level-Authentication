
# coding: utf-8

# In[16]:


import pandas as pd
import joblib
import numpy as np
import warnings
warnings.filterwarnings("ignore", category=FutureWarning)


# In[12]:


df = pd.read_csv('test1.csv')
"""df.drop("Unnamed: 0",axis=1,inplace=True)
df"""


# In[ ]:


clf=joblib.load('model.pkl')


# In[7]:


#test=df.iloc[0:1,:]
#test.to_csv("test.csv")


# In[13]:


y_pred = clf.predict(df)

y_pred=np.max(y_pred)

if y_pred==0:
	out="Fraud Transaction"
else:
	out="Valid Transaction"
	
print(out)


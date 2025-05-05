import pandas as pd
import joblib
import numpy as np
import warnings
warnings.filterwarnings("ignore", category=FutureWarning)


def predict():
        df=pd.read_csv('media/input/test/test.csv')

        clf=joblib.load('ML/model.pkl')

        y_pred = clf.predict(df)

        y_pred=np.max(y_pred)

        if y_pred==0:
            out="Fraud Transaction"
        else:
            out="Valid Transaction"
	
        
        return out

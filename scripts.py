import pandas as pd 
import matplotlib.pyplot as plt 
from pylab import* 
import seaborn as sns


def md_patten(data):
    """
    Display missing-data patterns. and highlight the missing values
    """
    df = data.isnull().replace({True:-1,False:0})
    df['.Row_Nums'] = 1

    df1 = df.groupby(by=list(data.columns)).agg(sum).sort_values('.Row_Nums',ascending =False).reset_index()
    df2 = data.isnull().sum().to_frame().T.rename(index = {0:' '})
    tem = pd.concat([df1,df2]).fillna('Missing_Nums')
    return tem

def showHight(col):
    """
    Highlight certain values.
    """
    c = col ==-1
    #c = col ==col.max()
    return ['background-color:red' if v else ' ' for v in c]


def aggr(data,plot =True,figsize = (9,8)):
    """
    1. Display missing-data patterns. and highlight the missing values.
    2. Plot the missing values in each variable using bar plot.
    3. Plot the missing values in certain combinations of variables using aggregation plot(heatmap vi Seaborn).
    """
    df = data.isnull().replace({True:-1,False:0})
    df['.Row_Nums'] = 1

    df1 = df.groupby(by=list(data.columns)).agg(sum).sort_values('.Row_Nums',ascending =False).reset_index()
    df2 = data.isnull().sum().to_frame().T.rename(index = {0:' '})
    tem = pd.concat([df1,df2])
    if plot:
        # bar plot
        data.isnull().sum().to_frame().plot(kind ='bar',figsize = (10,9),legend = False)
        
        # aggregation plot
        plt.figure(figsize=(10,9))
        sns.heatmap(tem,vmax =0.0,cmap = 'OrRd_r',linecolor='white',linewidths=0.1, annot=True,cbar =False) 
        
    return tem.fillna('Missing_Nums').style.apply(showHight)



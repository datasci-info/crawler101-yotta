#%%
from demo.tw711 import ls_city_id, ls_town_df, getStoreData
import pandas as pd

dfs = []
for cdata in ls_city_id()[:2]:
    for t in ls_town_df(cdata["id"])["TownName"]:
        print(t)
        dfs.append(getStoreData(cdata["city"],t))

total_df = pd.concat(dfs)
total_df.to_csv("total_df.csv", index=False, encoding="utf8")
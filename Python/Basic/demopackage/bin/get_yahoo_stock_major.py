#%%
import os
STOCK_ID = os.environ.get("STOCK_ID", 2330)
OUTPUT_CSV = os.environ.get("OUTPUT_CSV", "./{stock_id}.csv".format(stock_id=STOCK_ID))

if __name__ == "__main__":
    from demo.yahoo_kimo_stock import stock_major_data
    df = stock_major_data(STOCK_ID)
    df.to_csv(OUTPUT_CSV, index=False, encoding="utf8")
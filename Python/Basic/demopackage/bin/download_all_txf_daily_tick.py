import os
DOWNLOAD_PATH = os.environ.get("DOWNLOAD_PATH", ".")
ZIP_PATH = os.environ.get("ZIP_PATH", "zip")
TOTAL_PATH = os.path.join(DOWNLOAD_PATH,ZIP_PATH)

if ZIP_PATH not in os.listdir(DOWNLOAD_PATH):
    os.mkdir(TOTAL_PATH)

def download_all_txf_tick(path):
    from demo.taifex import download_file, ls_future_daily_tick_urls
    urls = ls_future_daily_tick_urls()
    for url in urls:
        download_file(url, path)

if __name__ == "__main__":
    download_all_txf_tick(TOTAL_PATH)


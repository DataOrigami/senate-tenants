import requests
from pandas.io.html import read_html
import re
from datetime import datetime

URL = 'http://www.parl.gc.ca/Parlinfo/lists/senators.aspx'

def run():
  html = requests.get(URL)
  df = to_dataframe(html)
  df = clean_data(df)
  return df

def to_dataframe(r):
  return read_html(r.text, infer_types=False, header=0)[0]

def clean_data(df):
  temp_data = df['Term (yyyy.mm.dd)'].apply(extract_dates_leaving)
  df['start_date'] = temp_data.apply(lambda x:x[0])
  df['end_date'] = temp_data.apply(lambda x:x[1])
  df['reason'] = temp_data.apply(lambda x:x[2])
  return df

def extract_dates_leaving(x):
  regex = '(\d{4}\.\d{2}\.\d{2}) - (\d{4}\.\d{2}\.\d{2})  [(](.*)[)]'
  if re.match(regex, x):
     started_at,ended_at, reason = re.match(regex, x).groups()
     return (datetime.strptime(started_at,'%Y.%m.%d'), datetime.strptime(ended_at,'%Y.%m.%d'), reason)
  elif re.match('(\d{4}\.\d{2}\.\d{2})', x):
    started_at = re.match('(\d{4}\.\d{2}\.\d{2})', x).groups()[0]
    return (datetime.strptime(started_at,'%Y.%m.%d'), None, None)
  else:
    print x
    return


if __name__=="__main__":
  df = run()
  df.to_csv('../data/parl_data.csv', encoding='utf-8')
  print "Done, exported to %s"%'../data/parl_data.csv'
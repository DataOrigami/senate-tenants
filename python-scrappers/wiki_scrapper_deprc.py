from requests import get
from bs4 import BeautifulSoup
from pandas.io.html import read_html
import re
import pdb

URL = 'http://en.wikipedia.org/'
regex = re.compile('(\D*)\d{0,1}')

def get_url(url):
  return BeautifulSoup(get(url).text)


def parse_senator_page(bs, **kwargs):
  tables = bs.find_all('table')[:-2] #unwanted tables at the bottom of the page
  df = table_to_dataframe(tables[0],**kwargs)
  for table in tables[1:]:
    df = df.append(table_to_dataframe(table,**kwargs), ignore_index=True)
  return df

def table_to_dataframe(bs_table, **kwargs):
    df = read_html(str(bs_table), header=0, infer_types=True)[0]
    df.columns = map( lambda x: regex.findall(x)[0], df.columns) #strips annoying <sup> numbers
    #data cleaning
    df[df.columns[-1]] = df[df.columns[-1]].apply( lambda x:x[1:11])
    df[df.columns[-3]] = df[df.columns[-3]].apply( lambda x:x[1:11])
    for key,item in kwargs.iteritems():
        df[key] = item
    try:
      df['End of Term'] = df['Mandatory retirement']
      del df['Mandatory retirement']
    except Exception as e:
      pass
    try:
      df['End of Term'] = df['Retired']
      del df['Retired']
    except:
      pass
    try:
      del df['']
    except:
      pass
    return df


def run():
  file = open('wiki_links.txt',"r")
  for line in file:
      prov, url = line.strip().split(",")
      print "Getting %s"%prov
      bs = get_url(url)
      df = parse_senator_page(bs, Region=prov)
      df.to_csv('../data/%s-senators.csv'%prov, index=False, encoding='utf-8')
      print "Done. Saved to '/data/%s-senators.csv'"%prov
      print 
  return


if __name__=="__main__":
    run()

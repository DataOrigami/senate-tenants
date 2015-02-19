import pandas as pd
from lifelines.utils import datetimes_to_durations
from lifelines import KaplanMeierFitter


df = pd.read_csv('data/parl_data.csv')
df['start_date'] = pd.to_datetime(df['start_date'])
df['end_date'] = pd.to_datetime(df['end_date'])
df['decade'] = df['start_date'].map( lambda d: str(d.year)[:3])
T, C = datetimes_to_durations(df['start_date'], df['end_date'])
df['T'] = T
df['C'] = C

kmf = KaplanMeierFitter()

ax = subplot(111)
for decade in df['decade'].unique():
    ix = df['decade'] == decade
    kmf.fit(df.ix[ix]['T'], df.ix[ix]['C'], label=decade)
    if decade not in ('200', '199'):
        kmf.plot(ax=ax, c='#777777', ci_show=False, alpha = 0.5)
    else:
        kmf.plot(ax=ax, lw=4)

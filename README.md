senate-tenants
==============

Senators of Canada enjoy a tenure-like position: guaranteed job security, high income and authority over legislation. Here we investigate the lifetimes of Senators seats, and see if we can piece together any details. 

### Data

We have data from all 705 Senators, including the date their were appointed on, whom appointed them, 
there final date in office (if observed) and some other variables. All data has been scrapped without consent from [Wikipedia](http://en.wikipedia.org/wiki/Lists_of_Canadian_senators) and [parliments data source](http://www.parl.gc.ca/Parlinfo/lists/senators.aspx).


### Some important facts:

- Senators originally held their seats for life; however, under the British North America Act, 1965 (now known as the Constitution Act, 1965), members, save for those appointed prior to the change, may not sit in the Senate after reaching the age of 75.
- A senator's seat automatically becomes vacant if he or she fails to attend the Senate for two consecutive parliamentary sessions. Furthermore, senators lose their seats if they are found guilty of treason, an indictable offence, or any "infamous crime"; are declared bankrupt or insolvent; or cease to be qualified.
- The base annual salary of each senator, as of 2010, is $132,300 CAD; members may receive additional salaries in right of other offices they hold.
-  Individuals must be both citizens of Canada and at least thirty years of age to be eligible for appointment to the Senate. Senators must also maintain residency in the provinces or territories for which they are appointed.


### What you need to do

Here's some things you can do:

- Explore the senator dataset using survival analysis. Try partitioning on different Prime Ministers, politically parties. Any conclusions?
- There is a great dataset, `dd.csv`, that contains the all political regimes from the past 60 years. This is a really cool dataset that survival analysis can be applied to.
- Help other setup R or Python, or help with understanding anaylsis. 
- The senator data is missing important columns like `age they were assigned`, or `gender`, or `financial income`. Can we scrape these?


### Tools 

 - **R:** (survival)[http://cran.r-project.org/web/packages/survival/index.html] is a great and well-maintained survival package in R. See the R-script in the repo for an example. 
 - **Python:** (lifelines)[https://github.com/CamDavidsonPilon/lifelines] is a Python survival analysis library under current development. It's reliable in some areas but buggy in others. There is a tutorial and intro to Survival Analysis included with it.
 - **Matlab:** (this code looks pretty good)[http://www.mathworks.com/matlabcentral/fileexchange/41325-kaplan-meier-for-right-andor-left-andor-interval-censored-data/content/KM/KM.m] totally untested though.

### [Slides From October 2013 Meetup](https://docs.google.com/presentation/d/14LYZU9Z3SXJrx5Yz9smvMsee5I_Is5o1vb_-OpmQhMs/edit?usp=sharing)

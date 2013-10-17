# load the standard survival analysis library
library(survival)

# load the raw senator data file
data<-data.frame(read.csv("../data/parl_data.csv", sep=',', header=T, stringsAsFactors = FALSE))

# create exit flags
data$exit     <- ifelse(data$reason != '',1,0)
data$died     <- ifelse(data$reason == 'Death',1,0)
data$retired  <- ifelse(data$reason == 'Retirement',1,0)
data$resigned <- ifelse(data$reason == 'Resignation',1,0)
data$declined <- ifelse(data$reason == 'Appointment declined',1,0)

# add censor times (choose largest date we are aware of)
data$end_date <- ifelse(data$end_date == '', '2013-03-25 00:00:00', as.character(data$end_date))

# create a time variable to use
data$years <- as.numeric(difftime(strptime(data$end_date, format = "%Y-%m-%d 00:00:00"), strptime(data$start_date, format = "%Y-%m-%d 00:00:00"),units="days") / 365.0)

# crude grouping of senators by political leaning
wing <- rep('other', length(data$Political.Affiliation.at.Appointment))
wing[grep('Conservative', data$Political.Affiliation.at.Appointment)] <- 'right'
wing[grep('Liberal', data$Political.Affiliation.at.Appointment)] <- 'left'
data$wing <- wing

# create a survival fit using a survival object formula
# we will look at the survival time to any exit
# use died, retired, resigned, declined to treat other events as censorship
fit <- survfit(Surv(years, exit) ~ wing, data=data)

# summary of results
summary(fit)

# plot the results
plot(fit)

# grab the non liberal, non-conservative senators
others <- data[data$wing == 'other',]

# plot survival curve for other senators
plot(survfit(Surv(years, exit) ~ wing, data=others))
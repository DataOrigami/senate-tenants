# Purpose
#   Add on to Ben Doyle's Senate Tenants code. Split the senator dataset by each PM and then
#   recombine it going backwards in the past. Create KM Curves from the new datasets.
#   Final result is a series of KM Curves colour-coded by party (blue for Conservative, 
#   red for Liberal). The curves measure survival against resignation. Senators may resign
#   for various reasons - health, running for Parliament, scandal, etc.

#   One piece of the code (commented out by default) simulates Brazeau, Wallin, and Duffy
#   being forced to resign from the senate.

# Remove non Liberal/Conservative parties
data <- subset(data,wing != 'other')
data$wing <- factor(data$wing)

# Crudely subset data by Prime Ministers. Sorry Kim Campbell :-(
data.harper <- subset(data,substr(Appointed.on.the.advice.of,1,6)=='Harper')
data.martin <- subset(data,substr(Appointed.on.the.advice.of,1,6)=='Martin')
data.chretien <- subset(data,substr(Appointed.on.the.advice.of,1,3)=='Chr')
data.campbell <- subset(data,substr(Appointed.on.the.advice.of,1,8)=='Campbell')
data.mulroney <- subset(data,substr(Appointed.on.the.advice.of,1,8)=='Mulroney')
data.turner <- subset(data,substr(Appointed.on.the.advice.of,1,6)=='Turner')
data.clark <- subset(data,substr(Appointed.on.the.advice.of,1,5)=='Clark')
data.trudeau <- subset(data,substr(Appointed.on.the.advice.of,1,7)=='Trudeau')
data.diefenbaker <- subset(data,substr(Appointed.on.the.advice.of,1,11)=='Diefenbaker')
data.pearson <- subset(data,substr(Appointed.on.the.advice.of,1,7)=='Pearson')
data.laurent <- subset(data,substr(Appointed.on.the.advice.of,1,10)=='St-Laurent')
data.king <- subset(data,substr(Appointed.on.the.advice.of,1,4)=='King')
data.bennet <- subset(data,substr(Appointed.on.the.advice.of,1,7)=='Bennett')
data.meighen <- subset(data,substr(Appointed.on.the.advice.of,1,7)=='Meighen')
data.borden <- subset(data,substr(Appointed.on.the.advice.of,1,6)=='Borden')
data.laurier <- subset(data,substr(Appointed.on.the.advice.of,1,7)=='Laurier')
data.tupper <- subset(data,substr(Appointed.on.the.advice.of,1,6)=='Tupper')
data.bowell <- subset(data,substr(Appointed.on.the.advice.of,1,6)=='Bowell')
data.thompson <- subset(data,substr(Appointed.on.the.advice.of,1,8)=='Thompson')
data.abbott <- subset(data,substr(Appointed.on.the.advice.of,1,6)=='Abbott')
data.mackenzie <- subset(data,substr(Appointed.on.the.advice.of,1,9)=='Mackenzie')
data.macdonald <- subset(data,substr(Appointed.on.the.advice.of,1,9)=='Macdonald')
data.royal <- subset(data,substr(Appointed.on.the.advice.of,1,5)=='Royal')

# Assume Duffy, Wallin, Brazeau each get booted and see what happens to our KM curves

#data.harper$resigned[data.harper$Name == 'Brazeau, Patrick'] <- 1
#data.harper$resigned[data.harper$Name == 'Wallin, Pamela'] <- 1
#data.harper$resigned[data.harper$Name == 'Duffy, Michael'] <- 1


# Gradually add senators by PM, going back in time
data.1 <- data.harper
data.2 <- rbind(data.martin,data.1)
data.3 <- rbind(data.chretien,data.2)
data.4 <- rbind(data.mulroney,data.3)
data.5 <- rbind(data.turner,data.4)
data.6 <- rbind(data.trudeau,data.5)
data.7 <- rbind(data.clark,data.6)
data.8 <- rbind(data.diefenbaker,data.7)
data.9 <- rbind(data.pearson,data.8)
data.10 <- rbind(data.laurent,data.9)
data.11 <- rbind(data.king,data.10)

# Begin plotting KM Curves, gradually going back in time.

plot(survfit(Surv(years, resigned) ~ wing, data=data.1), conf.int=FALSE,
     col=c('blue'),xlab='Years', ylab='Percentage of survivors')
title(main='Kaplan-Meier Curves for senator resignations since Harper')

plot(survfit(Surv(years, resigned) ~ wing, data=data.2), conf.int=FALSE,
     col=c('blue','red'),xlab='Years', ylab='Percentage of survivors')
title(main='Kaplan-Meier Curves for senator resignations since Martin')

plot(survfit(Surv(years, resigned) ~ wing, data=data.3), conf.int=FALSE,
     col=c('blue','red'),xlab='Years', ylab='Percentage of survivors')
title(main='Kaplan-Meier Curves for senator resignations since Chretien')

plot(survfit(Surv(years, resigned) ~ wing, data=data.4), conf.int=FALSE,
     col=c('blue','red'),xlab='Years', ylab='Percentage of survivors')
title(main='Kaplan-Meier Curves for senator resignations since Mulroney')

plot(survfit(Surv(years, resigned) ~ wing, data=data.5), conf.int=FALSE,
     col=c('blue','red'),xlab='Years', ylab='Percentage of survivors')
title(main='Kaplan-Meier Curves for senator resignations since Turner')

plot(survfit(Surv(years, resigned) ~ wing, data=data.6), conf.int=FALSE,
     col=c('blue','red'),xlab='Years', ylab='Percentage of survivors')
title(main='Kaplan-Meier Curves for senator resignations since Trudeau')

plot(survfit(Surv(years, resigned) ~ wing, data=data.7), conf.int=FALSE,
     col=c('blue','red'),xlab='Years', ylab='Percentage of survivors')
title(main='Kaplan-Meier Curves for senator resignations since Clark')

plot(survfit(Surv(years, resigned) ~ wing, data=data.8), conf.int=FALSE,
     col=c('blue','red'),xlab='Years', ylab='Percentage of survivors')
title(main='Kaplan-Meier Curves for senator resignations since Diefenbaker')

plot(survfit(Surv(years, resigned) ~ wing, data=data.9), conf.int=FALSE,
     col=c('blue','red'),xlab='Years', ylab='Percentage of survivors')
title(main='Kaplan-Meier Curves for senator resignations since Pearson')

plot(survfit(Surv(years, resigned) ~ wing, data=data.10), conf.int=FALSE,
     col=c('blue','red'),xlab='Years', ylab='Percentage of survivors')
title(main='Kaplan-Meier Curves for senator resignations since St-Laurent')

plot(survfit(Surv(years, resigned) ~ wing, data=data.11), conf.int=FALSE,
     col=c('blue','red'),xlab='Years', ylab='Percentage of survivors')
title(main='Kaplan-Meier Curves for senator resignations since King')

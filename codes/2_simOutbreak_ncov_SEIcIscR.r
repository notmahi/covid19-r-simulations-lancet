## To simulate n_simSEIcIscR outbreaks

nsim = 200

set.seed(123)
r0postCrI = r0posterior
# hist(r0postCrI)
# summary(r0postCrI)
R0est = sample(x = r0postCrI,size = nsim)
# print(R0est)

## To simulate n_sim SEIcIscR outbreaks: duration of infection = 3 days, initial infected  n=~200 infected
epi_doNothingDurInf3 = vector('list',nsim)
epi_baseDurInf3 = vector('list',nsim)
epi_aprilDurInf3 = vector('list',nsim)
epi_mayDurInf3 = vector('list',nsim)
start = Sys.time()
durInfSim = 3
initialI = 0.0001
for(sim in 1:nsim)
{
  epi_doNothingDurInf3[[sim]] = simulateOutbreakSEIcIscR(R0t =R0est[sim] ,
                                                        dateStartSchoolClosure = as.Date('2020-02-01'),
                                                        dateStartIntenseIntervention = as.Date('2020-02-01'), 
                                                        dateEndIntenseIntervention = as.Date('2020-02-01'),
                                                        pWorkOpen = c(1,1,1,1),
                                                        numWeekStagger = c(0,0,0),
                                                        pInfected=initialI,
                                                        durInf = durInfSim)
  epi_baseDurInf3[[sim]] = simulateOutbreakSEIcIscR(R0t =R0est[sim] ,
                                                    dateEndIntenseIntervention = as.Date('2020-04-04'),
                                                    pWorkOpen = c(0.1,0.75,1,1),
                                                    numWeekStagger = c(10/7,10/7,10/7),
                                                    pInfected=initialI,
                                                    durInf = durInfSim)
  epi_aprilDurInf3[[sim]] = simulateOutbreakSEIcIscR(R0t =R0est[sim] ,
                                                    dateEndIntenseIntervention = as.Date('2020-03-26'),
                                                    pInfected=initialI,
                                                    durInf = durInfSim)
  epi_mayDurInf3[[sim]] = simulateOutbreakSEIcIscR(R0t =R0est[sim] ,
                                                    dateEndIntenseIntervention = as.Date('2020-05-26'),
                                                    pInfected=initialI,
                                                    durInf = durInfSim)
  if(sim%%10==0) print(paste0('Done with simulation ',sim))
}
end = Sys.time()
print(end-start)

covid_SDurInf3sc = list() 
covid_SDurInf3sc[[1]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_doNothingDurInf3)
covid_SDurInf3sc[[2]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_baseDurInf3)
covid_SDurInf3sc[[3]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_aprilDurInf3)
covid_SDurInf3sc[[4]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_mayDurInf3)

covid_IDurInf3sc = list() 
covid_IDurInf3sc[[1]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_doNothingDurInf3)
covid_IDurInf3sc[[2]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_baseDurInf3)
covid_IDurInf3sc[[3]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_aprilDurInf3)
covid_IDurInf3sc[[4]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_mayDurInf3)

peaktime_DurInf3sc = list()
peaktime_DurInf3sc[[1]] = summarisePeakTimePeakSize(SIMS = epi_doNothingDurInf3)
peaktime_DurInf3sc[[2]] = summarisePeakTimePeakSize(SIMS = epi_baseDurInf3)
peaktime_DurInf3sc[[3]] = summarisePeakTimePeakSize(SIMS = epi_aprilDurInf3)
peaktime_DurInf3sc[[4]] = summarisePeakTimePeakSize(SIMS = epi_mayDurInf3)

covid_DurInf3sc = list() 
covid_DurInf3sc[[1]] = summariseSimulations_mid(CI = 50,SIMS = epi_doNothingDurInf3)
covid_DurInf3sc[[2]] = summariseSimulations_mid(CI = 50,SIMS = epi_baseDurInf3)
covid_DurInf3sc[[3]] = summariseSimulations_mid(CI = 50,SIMS = epi_aprilDurInf3)
covid_DurInf3sc[[4]] = summariseSimulations_mid(CI = 50,SIMS = epi_mayDurInf3)

AGEcovid_IDurInf3sc = list()
AGEcovid_IDurInf3sc[[1]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_doNothingDurInf3)
AGEcovid_IDurInf3sc[[2]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_baseDurInf3)
AGEcovid_IDurInf3sc[[3]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_aprilDurInf3)
AGEcovid_IDurInf3sc[[4]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_mayDurInf3)

epiFirstSimDurInf3sc = list(epi_doNothingDurInf3 = epi_doNothingDurInf3[[1]],
                          epi_baseDurInf3= epi_baseDurInf3[[1]],
                          epi_aprilDurInf3 = epi_aprilDurInf3[[1]],
                          epi_mayDurInf3 = epi_mayDurInf3[[1]])



## To simulate n_simSEIcIscR outbreaks: duration of infection = 7 days, initial infected  n=~200 infected

epi_doNothingDurInf7 = vector('list',nsim)
epi_baseDurInf7 = vector('list',nsim)
epi_aprilDurInf7 = vector('list',nsim)
epi_mayDurInf7 = vector('list',nsim)
start = Sys.time()
durInfSim = 7
initialI = 0.0001
for(sim in 1:nsim)
{
  epi_doNothingDurInf7[[sim]] = simulateOutbreakSEIcIscR(R0t =R0est[sim],
                                                         dateStartSchoolClosure = as.Date('2020-02-01'),
                                                         dateStartIntenseIntervention = as.Date('2020-02-01'), 
                                                         dateEndIntenseIntervention = as.Date('2020-02-01'),
                                                         pWorkOpen = c(1,1,1,1),
                                                         numWeekStagger = c(0,0,0,0),
                                                         pInfected=initialI,
                                                         durInf = durInfSim)
  epi_baseDurInf7[[sim]] =      simulateOutbreakSEIcIscR(R0t =R0est[sim],
                                                         dateEndIntenseIntervention = as.Date('2020-04-04'),
                                                         pWorkOpen = c(0.1,0.75,1,1),
                                                         numWeekStagger = c(10/7,10/7,10/7),
                                                         pInfected=initialI,
                                                         durInf = durInfSim)
  epi_aprilDurInf7[[sim]] =     simulateOutbreakSEIcIscR(R0t =R0est[sim] ,
                                                         dateEndIntenseIntervention = as.Date('2020-03-26'),
                                                         pInfected=initialI,
                                                         durInf = durInfSim)
  epi_mayDurInf7[[sim]] =     simulateOutbreakSEIcIscR(R0t =R0est[sim] ,
                                                         dateEndIntenseIntervention = as.Date('2020-05-26'),
                                                         pInfected=initialI,
                                                         durInf = durInfSim)
  if(sim%%10==0) print(paste0('Done with simulation ',sim))
}
end = Sys.time()
print(end-start)

covid_SDurInf7sc = list() 
covid_SDurInf7sc[[1]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_doNothingDurInf7)
covid_SDurInf7sc[[2]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_baseDurInf7)
covid_SDurInf7sc[[3]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_aprilDurInf7)
covid_SDurInf7sc[[4]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_mayDurInf7)

covid_IDurInf7sc = list() 
covid_IDurInf7sc[[1]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_doNothingDurInf7)
covid_IDurInf7sc[[2]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_baseDurInf7)
covid_IDurInf7sc[[3]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_aprilDurInf7)
covid_IDurInf7sc[[4]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_mayDurInf7)

peaktime_DurInf7sc = list()
peaktime_DurInf7sc[[1]] = summarisePeakTimePeakSize(SIMS = epi_doNothingDurInf7)
peaktime_DurInf7sc[[2]] = summarisePeakTimePeakSize(SIMS = epi_baseDurInf7)
peaktime_DurInf7sc[[3]] = summarisePeakTimePeakSize(SIMS = epi_aprilDurInf7)
peaktime_DurInf7sc[[4]] = summarisePeakTimePeakSize(SIMS = epi_mayDurInf7)

covid_DurInf7sc = list() 
covid_DurInf7sc[[1]] = summariseSimulations_mid(CI = 50,SIMS = epi_doNothingDurInf7)
covid_DurInf7sc[[2]] = summariseSimulations_mid(CI = 50,SIMS = epi_baseDurInf7)
covid_DurInf7sc[[3]] = summariseSimulations_mid(CI = 50,SIMS = epi_aprilDurInf7)
covid_DurInf7sc[[4]] = summariseSimulations_mid(CI = 50,SIMS = epi_mayDurInf7)

AGEcovid_IDurInf7sc = list()
AGEcovid_IDurInf7sc[[1]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_doNothingDurInf7)
AGEcovid_IDurInf7sc[[2]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_baseDurInf7)
AGEcovid_IDurInf7sc[[3]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_aprilDurInf7)
AGEcovid_IDurInf7sc[[4]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_mayDurInf7)

epiFirstSimDurInf7sc = list(epi_doNothingDurInf7 = epi_doNothingDurInf7[[1]],
                          epi_baseDurInf7= epi_baseDurInf7[[1]],
                          epi_aprilDurInf7 = epi_aprilDurInf7[[1]],
                          epi_mayDurInf7 = epi_mayDurInf7[[1]])

save(covid_IDurInf3sc,file = 'outputs/SEIcIscR/covid_IDurInf3.rdata')
save(covid_SDurInf3sc,file = 'outputs/SEIcIscR/covid_SDurInf3.rdata')
save(covid_IDurInf7sc,file = 'outputs/SEIcIscR/covid_IDurInf7.rdata')
save(covid_SDurInf7sc,file = 'outputs/SEIcIscR/covid_SDurInf7.rdata')

# Save as JSON
sink('outputs/SEIcIscR/covid_IDurInf3.json')
cat(toJSON(covid_IDurInf3sc))
sink('outputs/SEIcIscR/covid_SDurInf3.json')
cat(toJSON(covid_SDurInf3sc))
sink('outputs/SEIcIscR/covid_IDurInf7.json')
cat(toJSON(covid_IDurInf7sc))
sink('outputs/SEIcIscR/covid_SDurInf7.json')
cat(toJSON(covid_IDurInf7sc))

save(peaktime_DurInf3sc,file = 'outputs/SEIcIscR/peaktime_DurInf3.rdata')
save(peaktime_DurInf7sc,file = 'outputs/SEIcIscR/peaktime_DurInf7.rdata')
sink('outputs/SEIcIscR/peaktime_DurInf3.json')
cat(toJSON(peaktime_DurInf3sc))
sink('outputs/SEIcIscR/peaktime_DurInf7.json')
cat(toJSON(peaktime_DurInf7sc))

save(covid_DurInf3sc,file ='outputs/SEIcIscR/covid_DurInf3.rdata')
save(covid_DurInf7sc,file ='outputs/SEIcIscR/covid_DurInf7.rdata')
sink('outputs/SEIcIscR/covid_DurInf3.json')
cat(toJSON(covid_DurInf3sc))
sink('outputs/SEIcIscR/covid_DurInf7.json')
cat(toJSON(covid_DurInf7sc))

save(AGEcovid_IDurInf3sc,file ='outputs/SEIcIscR/AGEcovid_IDurInf3.rdata')
save(AGEcovid_IDurInf7sc,file ='outputs/SEIcIscR/AGEcovid_IDurInf7.rdata')
sink('outputs/SEIcIscR/AGEcovid_IDurInf3.json')
cat(toJSON(AGEcovid_IDurInf3sc))
sink('outputs/SEIcIscR/AGEcovid_IDurInf7.json')
cat(toJSON(AGEcovid_IDurInf7sc))
sink()

save(epiFirstSimDurInf3sc,file ='outputs/SEIcIscR/epiFirstSimDurInf3.rdata')
save(epiFirstSimDurInf7sc,file ='outputs/SEIcIscR/epiFirstSimDurInf7.rdata')

rm(epi_doNothingDurInf3,epi_baseDurInf3,epi_aprilDurInf3,epi_mayDurInf3)
rm(epi_doNothingDurInf7,epi_baseDurInf7,epi_aprilDurInf7,epi_mayDurInf7)


## To simulate n_simSEIcIscR outbreaks: duration of infection = 3 days, initial infected  n=~2000 infected
# epi_doNothingDurInf3I2000 = vector('list',nsim)
# epi_baseDurInf3I2000 = vector('list',nsim)
# epi_aprilDurInf3I2000 = vector('list',nsim)
# epi_mayDurInf3I2000 = vector('list',nsim)
# start = Sys.time()
# durInfSim = 3
# initialI = 0.002
# for(sim in 1:nsim)
# {
#   epi_doNothingDurInf3I2000[[sim]] =  simulateOutbreakSEIcIscR(R0t =R0est[sim] ,
#                                                               dateStartSchoolClosure = as.Date('2020-02-01'),
#                                                               dateStartIntenseIntervention = as.Date('2020-02-01'), 
#                                                               dateEndIntenseIntervention = as.Date('2020-02-01'),
#                                                               pWorkOpen = c(1,1,1,1),
#                                                               numWeekStagger = c(0,0,0),
#                                                               pInfected=initialI,
#                                                               durInf = durInfSim)
#   epi_baseDurInf3I2000[[sim]] =       simulateOutbreakSEIcIscR(R0t =R0est[sim] ,
#                                                               dateEndIntenseIntervention = as.Date('2020-04-04'),
#                                                               pWorkOpen = c(0.1,0.75,1,1),
#                                                               numWeekStagger = c(10/7,10/7,10/7),
#                                                               pInfected=initialI,
#                                                               durInf = durInfSim)
#   epi_aprilDurInf3I2000[[sim]] =      simulateOutbreakSEIcIscR(R0t =R0est[sim] ,
#                                                               dateEndIntenseIntervention = as.Date('2020-03-26'),
#                                                               pInfected=initialI,
#                                                               durInf = durInfSim)
#   epi_mayDurInf3I2000[[sim]] =      simulateOutbreakSEIcIscR(R0t =R0est[sim] ,
#                                                               dateEndIntenseIntervention = as.Date('2020-05-26'),
#                                                               pInfected=initialI,
#                                                               durInf = durInfSim)
#   if(sim%%10==0) print(paste0('Done with simulation ',sim))
# }
# end = Sys.time()
# print(end-start)

# covid_SDurInf3I2000sc = list() 
# covid_SDurInf3I2000sc[[1]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_doNothingDurInf3I2000)
# covid_SDurInf3I2000sc[[2]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_baseDurInf3I2000)
# covid_SDurInf3I2000sc[[3]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_aprilDurInf3I2000)
# covid_SDurInf3I2000sc[[4]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_mayDurInf3I2000)

# covid_IDurInf3I2000sc = list() 
# covid_IDurInf3I2000sc[[1]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_doNothingDurInf3I2000)
# covid_IDurInf3I2000sc[[2]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_baseDurInf3I2000)
# covid_IDurInf3I2000sc[[3]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_aprilDurInf3I2000)
# covid_IDurInf3I2000sc[[4]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_mayDurInf3I2000)

# peaktime_DurInf3I2000sc = list()
# peaktime_DurInf3I2000sc[[1]] = summarisePeakTimePeakSize(SIMS = epi_doNothingDurInf3I2000)
# peaktime_DurInf3I2000sc[[2]] = summarisePeakTimePeakSize(SIMS = epi_baseDurInf3I2000)
# peaktime_DurInf3I2000sc[[3]] = summarisePeakTimePeakSize(SIMS = epi_aprilDurInf3I2000)
# peaktime_DurInf3I2000sc[[4]] = summarisePeakTimePeakSize(SIMS = epi_mayDurInf3I2000)

# covid_DurInf3I2000sc = list() 
# covid_DurInf3I2000sc[[1]] = summariseSimulations_mid(CI = 50,SIMS = epi_doNothingDurInf3I2000)
# covid_DurInf3I2000sc[[2]] = summariseSimulations_mid(CI = 50,SIMS = epi_baseDurInf3I2000)
# covid_DurInf3I2000sc[[3]] = summariseSimulations_mid(CI = 50,SIMS = epi_aprilDurInf3I2000)
# covid_DurInf3I2000sc[[4]] = summariseSimulations_mid(CI = 50,SIMS = epi_mayDurInf3I2000)

# AGEcovid_IDurInf3I2000sc  = list()
# AGEcovid_IDurInf3I2000sc[[1]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_doNothingDurInf3I2000)
# AGEcovid_IDurInf3I2000sc[[2]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_baseDurInf3I2000)
# AGEcovid_IDurInf3I2000sc[[3]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_aprilDurInf3I2000)
# AGEcovid_IDurInf3I2000sc[[4]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_mayDurInf3I2000)

# epiFirstSimDurInf3I2000sc  = list(epi_doNothingDurInf3I2000 = epi_doNothingDurInf3I2000[[1]],
#                           epi_baseDurInf3I2000= epi_baseDurInf3I2000[[1]],
#                           epi_aprilDurInf3I2000 = epi_aprilDurInf3I2000[[1]],
#                           epi_mayDurInf3I2000 = epi_mayDurInf3I2000[[1]])



# ## To simulate n_simSEIcIscR outbreaks: duration of infection = 7 days, initial infected  n=~2000 infected

# epi_doNothingDurInf7I2000 = vector('list',nsim)
# epi_baseDurInf7I2000 = vector('list',nsim)
# epi_aprilDurInf7I2000 = vector('list',nsim)
# epi_mayDurInf7I2000 = vector('list',nsim)
# start = Sys.time()
# durInfSim = 7
# initialI = 0.002
# for(sim in 1:nsim)
# {
#   epi_doNothingDurInf7I2000[[sim]] = simulateOutbreakSEIcIscR(R0t =R0est[sim] ,
#                                                               dateStartSchoolClosure = as.Date('2020-02-01'),
#                                                               dateStartIntenseIntervention = as.Date('2020-02-01'), 
#                                                               dateEndIntenseIntervention = as.Date('2020-02-01'),
#                                                               pWorkOpen = c(1,1,1,1),
#                                                               numWeekStagger = c(0,0,0),
#                                                               pInfected=initialI,
#                                                               durInf = durInfSim)
#   epi_baseDurInf7I2000[[sim]] =      simulateOutbreakSEIcIscR(R0t =R0est[sim] ,
#                                                               dateEndIntenseIntervention = as.Date('2020-04-04'),
#                                                               pWorkOpen = c(0.1,0.75,1,1),
#                                                               numWeekStagger = c(10/7,10/7,10/7),
#                                                               pInfected=initialI,
#                                                               durInf = durInfSim)
#   epi_aprilDurInf7I2000[[sim]] =     simulateOutbreakSEIcIscR(R0t =R0est[sim] ,
#                                                               dateEndIntenseIntervention = as.Date('2020-03-26'),
#                                                               pInfected=initialI,
#                                                               durInf = durInfSim)
#   epi_mayDurInf7I2000[[sim]] =     simulateOutbreakSEIcIscR(R0t =R0est[sim] ,
#                                                               dateEndIntenseIntervention = as.Date('2020-05-26'),
#                                                               pInfected=initialI,
#                                                               durInf = durInfSim)
#   if(sim%%10==0) print(paste0('Done with simulation ',sim))
# }
# end = Sys.time()
# print(end-start)

# covid_SDurInf7I2000sc = list() 
# covid_SDurInf7I2000sc[[1]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_doNothingDurInf7I2000)
# covid_SDurInf7I2000sc[[2]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_baseDurInf7I2000)
# covid_SDurInf7I2000sc[[3]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_aprilDurInf7I2000)
# covid_SDurInf7I2000sc[[4]] = summariseSimulations(VAR = 'S',CI = 50,SIMS = epi_mayDurInf7I2000)

# covid_IDurInf7I2000sc = list() 
# covid_IDurInf7I2000sc[[1]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_doNothingDurInf7I2000)
# covid_IDurInf7I2000sc[[2]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_baseDurInf7I2000)
# covid_IDurInf7I2000sc[[3]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_aprilDurInf7I2000)
# covid_IDurInf7I2000sc[[4]] = summariseSimulations(VAR = 'incidence',CI = 50,SIMS = epi_mayDurInf7I2000)

# peaktime_DurInf7I2000sc = list()
# peaktime_DurInf7I2000sc[[1]] = summarisePeakTimePeakSize(SIMS = epi_doNothingDurInf7I2000)
# peaktime_DurInf7I2000sc[[2]] = summarisePeakTimePeakSize(SIMS = epi_baseDurInf7I2000)
# peaktime_DurInf7I2000sc[[3]] = summarisePeakTimePeakSize(SIMS = epi_aprilDurInf7I2000)
# peaktime_DurInf7I2000sc[[4]] = summarisePeakTimePeakSize(SIMS = epi_mayDurInf7I2000)

# covid_DurInf7I2000sc = list() 
# covid_DurInf7I2000sc[[1]] = summariseSimulations_mid(CI = 50,SIMS = epi_doNothingDurInf7I2000)
# covid_DurInf7I2000sc[[2]] = summariseSimulations_mid(CI = 50,SIMS = epi_baseDurInf7I2000)
# covid_DurInf7I2000sc[[3]] = summariseSimulations_mid(CI = 50,SIMS = epi_aprilDurInf7I2000)
# covid_DurInf7I2000sc[[4]] = summariseSimulations_mid(CI = 50,SIMS = epi_mayDurInf7I2000)

# AGEcovid_IDurInf7I2000sc  = list()
# AGEcovid_IDurInf7I2000sc[[1]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_doNothingDurInf7I2000)
# AGEcovid_IDurInf7I2000sc[[2]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_baseDurInf7I2000)
# AGEcovid_IDurInf7I2000sc[[3]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_aprilDurInf7I2000)
# AGEcovid_IDurInf7I2000sc[[4]] = summariseSimulationsAGE(VAR = 'incidence',CI = 50,SIMS = epi_mayDurInf7I2000)

# epiFirstSimDurInf7I2000sc  = list(epi_doNothingDurInf7I2000 = epi_doNothingDurInf7I2000[[1]],
#                                 epi_baseDurInf7I2000= epi_baseDurInf7I2000[[1]],
#                                 epi_aprilDurInf7I2000 = epi_aprilDurInf7I2000[[1]],
#                                 epi_mayDurInf7I2000 = epi_mayDurInf7I2000[[1]])

# save(covid_IDurInf3I2000sc,file = 'outputs/SEIcIscR/covid_IDurInf3I2000.rdata')
# save(covid_SDurInf3I2000sc,file = 'outputs/SEIcIscR/covid_SDurInf3I2000.rdata')
# save(covid_IDurInf7I2000sc,file = 'outputs/SEIcIscR/covid_IDurInf7I2000.rdata')
# save(covid_SDurInf7I2000sc,file = 'outputs/SEIcIscR/covid_SDurInf7I2000.rdata')

# save(peaktime_DurInf3I2000sc,file = 'outputs/SEIcIscR/peaktime_DurInf3I2000.rdata')
# save(peaktime_DurInf7I2000sc,file = 'outputs/SEIcIscR/peaktime_DurInf7I2000.rdata')

# save(covid_DurInf3I2000sc,file ='outputs/SEIcIscR/covid_DurInf3I2000.rdata')
# save(covid_DurInf7I2000sc,file ='outputs/SEIcIscR/covid_DurInf7I2000.rdata')

# save(AGEcovid_IDurInf3I2000sc,file ='outputs/SEIcIscR/AGEcovid_IDurInf3I2000.rdata')
# save(AGEcovid_IDurInf7I2000sc,file ='outputs/SEIcIscR/AGEcovid_IDurInf7I2000.rdata')

# save(epiFirstSimDurInf3I2000sc,file ='outputs/SEIcIscR/epiFirstSimDurInf3I2000.rdata')
# save(epiFirstSimDurInf7I2000sc,file ='outputs/SEIcIscR/epiFirstSimDurInf7I2000.rdata')

# rm(epi_doNothingDurInf3I2000,epi_baseDurInf3I2000,epi_aprilDurInf3I2000,epi_mayDurInf3I2000)
# rm(epi_doNothingDurInf7I2000,epi_baseDurInf7I2000,epi_aprilDurInf7I2000,epi_mayDurInf7I2000)







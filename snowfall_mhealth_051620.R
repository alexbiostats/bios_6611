nsim=NA

simdate <- '051620'
pp_thresh <- c(0.8,0.95,0.975,0.99)
Ntot <- c(30,90,180)

#Initialize document to write simulation results to
pp_scen2 <- paste0( rep( paste0( 'ppos_',c('eq','pr','un','bb') ), length(pp_thresh) ), '_post', rep(pp_thresh*100, each=4) ) 
pp_scen <- paste0( rep(pp_scen2, length(Ntot)), '_day', rep(Ntot,each=length(pp_scen2)) )

res_col <- c('seed','day','erate','pe','pn','event_trigger_per','noevent_trigger_per','rd','rr','or','fish_p','rd_postprob',pp_scen)

write.table(file = paste0('mhealth_daily_',simdate,'.txt'), matrix(res_col, nrow=1), col.names=FALSE, row.names=FALSE, append=T)

library(snowfall)
sfInit(cpus = 10, type = 'SOCK', parallel = T)

sfExportAll()

sfLibrary(foreach)
sfLibrary(doParallel)

#sfClusterSetupRNGstream(400)
sfSource("/home/kaizera/mHealth/Rosenberg_App_Simulation_Code_Functions.R")

sfSapply(1:1000, function(x) snow_mhealth_sim(erate=0.5, pn=0.2, pe=0.25, duration=180, seed=x, day_vec=14:180, a_prior=1, b_prior=1, test_direction_gt=T, delta=0, pp_thresh=pp_thresh, Ntot=Ntot, simdate=simdate ) )
sfSapply(1:1000, function(x) snow_mhealth_sim(erate=0.5, pn=0.4, pe=0.6, duration=180, seed=x, day_vec=14:180, a_prior=1, b_prior=1, test_direction_gt=T, delta=0, pp_thresh=pp_thresh, Ntot=Ntot, simdate=simdate ) )
sfSapply(1:1000, function(x) snow_mhealth_sim(erate=0.5, pn=0.8, pe=0.8, duration=180, seed=x, day_vec=14:180, a_prior=1, b_prior=1, test_direction_gt=T, delta=0, pp_thresh=pp_thresh, Ntot=Ntot, simdate=simdate ) )
sfSapply(1:1000, function(x) snow_mhealth_sim(erate=0.5, pn=0.5, pe=0.5, duration=180, seed=x, day_vec=14:180, a_prior=1, b_prior=1, test_direction_gt=T, delta=0, pp_thresh=pp_thresh, Ntot=Ntot, simdate=simdate ) )

sfSapply(1:1000, function(x) snow_mhealth_sim(erate=0.05, pn=0.2, pe=0.25, duration=180, seed=x, day_vec=14:180, a_prior=1, b_prior=1, test_direction_gt=T, delta=0, pp_thresh=pp_thresh, Ntot=Ntot, simdate=simdate ) )
sfSapply(1:1000, function(x) snow_mhealth_sim(erate=0.05, pn=0.4, pe=0.6, duration=180, seed=x, day_vec=14:180, a_prior=1, b_prior=1, test_direction_gt=T, delta=0, pp_thresh=pp_thresh, Ntot=Ntot, simdate=simdate ) )
sfSapply(1:1000, function(x) snow_mhealth_sim(erate=0.05, pn=0.8, pe=0.8, duration=180, seed=x, day_vec=14:180, a_prior=1, b_prior=1, test_direction_gt=T, delta=0, pp_thresh=pp_thresh, Ntot=Ntot, simdate=simdate ) )
sfSapply(1:1000, function(x) snow_mhealth_sim(erate=0.05, pn=0.5, pe=0.5, duration=180, seed=x, day_vec=14:180, a_prior=1, b_prior=1, test_direction_gt=T, delta=0, pp_thresh=pp_thresh, Ntot=Ntot, simdate=simdate ) )

sfSapply(1:1000, function(x) snow_mhealth_sim(erate=0.8, pn=0.2, pe=0.25, duration=180, seed=x, day_vec=14:180, a_prior=1, b_prior=1, test_direction_gt=T, delta=0, pp_thresh=pp_thresh, Ntot=Ntot, simdate=simdate ) )
sfSapply(1:1000, function(x) snow_mhealth_sim(erate=0.8, pn=0.4, pe=0.6, duration=180, seed=x, day_vec=14:180, a_prior=1, b_prior=1, test_direction_gt=T, delta=0, pp_thresh=pp_thresh, Ntot=Ntot, simdate=simdate ) )
sfSapply(1:1000, function(x) snow_mhealth_sim(erate=0.8, pn=0.8, pe=0.8, duration=180, seed=x, day_vec=14:180, a_prior=1, b_prior=1, test_direction_gt=T, delta=0, pp_thresh=pp_thresh, Ntot=Ntot, simdate=simdate ) )
sfSapply(1:1000, function(x) snow_mhealth_sim(erate=0.8, pn=0.5, pe=0.5, duration=180, seed=x, day_vec=14:180, a_prior=1, b_prior=1, test_direction_gt=T, delta=0, pp_thresh=pp_thresh, Ntot=Ntot, simdate=simdate ) )

sfStop()
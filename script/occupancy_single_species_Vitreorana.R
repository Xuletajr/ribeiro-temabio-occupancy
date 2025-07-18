## ----------------------------------------------------------------------------
## ############# Single-species occupancy model ###################                     
##
## Purpose of script: this script fits a single-species occupancy model 
##                             using data of Vitreorana uranoscopa 
##                             from Ribeiro Jr. et al. (2018) with 
##                             the spOccupancy R package. 
##
## Author: Jose W. Ribeiro Jr. 'Xuleta' 
##
## Created: July, 2025
##
## Data source citation:   
##   Ribeiro Jr, J. W., Siqueira, T., Brejão, G. L., & Zipkin, E. F. (2018). 
##   Effects of agriculture and topography on tropical amphibian species 
##   and communities. Ecological Applications, 28(6), 1554-1564.
##
##
## ----------------------------------------------------------------------------


# Seting directory to source (script)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Clean workspace
rm(list=ls())
gc()

# Read packages
library(tidyverse)
library(spOccupancy)
library(MCMCvis)


# 1. Read the prepared data ----------------------------------------------------
# TI in the data source (reads in an object called data.list)
load("../data/Vitreorana_Ribeiro2018EcoApps.rda")
str(data.list)


# 2. Model fitting --------------------------------------------------------
# Fit a non-spatial, single-species occupancy model. 
out <- PGOcc(occ.formula = ~ scale(forest) + scale(agriculture) + 
	                           scale(catchment) + scale(density) + 
	                           scale(slope), 
             det.formula = ~ scale(date) + I(scale(date)^2) + scale(rain), 
	           data = data.list, 
	           n.samples = 25000, 
	           n.thin = 10, 
	           n.burn = 15000, 
	           n.chains = 3,
	           n.report = 500)

summary(out)

# Traceplots
plot(out$beta.samples)
plot(out$alpha.samples)


# Fit a spatial, single-species occupancy model.
out.sp <- spPGOcc(occ.formula = ~ scale(forest) + scale(agriculture) + 
	                                scale(catchment) + scale(density) + 
	                                scale(slope), 
                  det.formula = ~ scale(date) + I(scale(date)^2) + scale(rain), 	          
	                data = data.list, 
		              n.batch = 1000, 
		              batch.length = 25,
	                n.thin = 10, 
	                n.burn = 15000, 
	                n.chains = 3,
	                n.report = 100)

summary(out.sp)

# 3. Model validation -----------------------------------------------------
# Perform a posterior predictive check to assess model fit. 
ppc.out <- ppcOcc(out, fit.stat = 'freeman-tukey', group = 1)
ppc.out.sp <- ppcOcc(out.sp, fit.stat = 'freeman-tukey', group = 1)

# Calculate a Bayesian p-value as a simple measure of Goodness of Fit.
# Bayesian p-values between 0.1 and 0.9 indicate adequate model fit. 
summary(ppc.out)
summary(ppc.out.sp)

# 4. Model comparison -----------------------------------------------------
# Compute Widely Applicable Information Criterion (WAIC)
# Lower values indicate better model fit. 
waicOcc(out)
waicOcc(out.sp)

# 5. Posterior summaries --------------------------------------------------
# Concise summary of main parameter estimates
summary(out)

# Take a look at objects in resulting object
names(out)
str(out$beta.samples)

# Probability the effect of stream density on occupancy is positive
mean(out$beta.samples[, 5] > 0)

# Create simple plot summaries using MCMCvis package.
# Occupancy covariate effects ---------
MCMCplot(out$beta.samples, ref_ovl = TRUE, ci = c(50, 95))

# Detection covariate effects --------- 
MCMCplot(out$alpha.samples, ref_ovl = TRUE, ci = c(50, 95))

# 6. Prediction -----------------------------------------------------------
# Predict occupancy along a gradient of forest cover.  
# Create a set of values across the range of observed forest values
catchment.pred.vals <- seq(min(data.list$occ.covs$catchment), 
			                  max(data.list$occ.covs$catchment), 
			                  length.out = 100)

# Scale predicted values by mean and standard deviation used to fit the model
catchment.pred.vals.scale <- (catchment.pred.vals - mean(data.list$occ.covs$catchment)) / 
	                         sd(data.list$occ.covs$catchment)

# Predict occupancy across forest values at mean values of all other variables
pred.df <- as.matrix(data.frame(intercept = 1, forest = 0, 
		                 agriculture = 0, catchment = catchment.pred.vals.scale, density = 0, 
		                 slope = 0))

out.pred <- predict(out, pred.df)

str(out.pred)

psi.0.quants <- apply(out.pred$psi.0.samples, 2, quantile, 
		                  prob = c(0.025, 0.5, 0.975))

psi.plot.dat <- data.frame(psi.med = psi.0.quants[2, ], 
			                     psi.low = psi.0.quants[1, ], 
			                     psi.high = psi.0.quants[3, ], 
                           catchment = catchment.pred.vals)


ggplot(psi.plot.dat, 
       aes(x = catchment, y = psi.med)) + 
  geom_ribbon(aes(ymin = psi.low, ymax = psi.high), fill = 'grey70') +
  geom_line() + 
  theme_bw() + 
  scale_y_continuous(limits = c(0, 1)) + 
  labs(x = 'Catchment Area (ha)', y = 'Occupancy Probability') 

# "catchment_area" - is the complete surface area (ha) that contributes to the stream 
# channel in the downstream point from each sampling site

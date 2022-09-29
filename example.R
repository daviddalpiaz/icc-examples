# silly helper function
do_sim = function(x) {
  y = rexp(n = 1000, rate = 0.5)
  return(mean(y > 10))
}

# run simulations
results = simplify2array(parallel::mclapply(1:100000, do_sim))

# write results to disk
saveRDS(results, file = "results.rds")

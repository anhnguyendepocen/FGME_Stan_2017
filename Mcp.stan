data {
  int<lower=1> N;
  vector[N] RT;
  vector<lower=-1,upper=1>[N] x;
}
parameters {
  real<lower=0> sigma;
  real alpha;
  real beta;
}
transformed parameters {
  vector[N] mu;
  mu = alpha + x * beta;
}
model {
  alpha ~ normal(0,10);
  beta  ~ normal(0,1);
  sigma ~ normal(0,1);
  RT ~ lognormal(mu, sigma); 
}
generated quantities {
  real overall_difference;
  overall_difference = exp(alpha + beta) - exp(alpha - beta);
}

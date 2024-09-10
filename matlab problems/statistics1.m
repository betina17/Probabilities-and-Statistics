clear all;
clc;
%problem from lab 5 Confidence intervals
%a)
sample = [7,7,4,5,9,9,4,12,8,1,8,7,3,13,2,1,17,7,12,5,6,2,1,13,14,10,2,4,9,11,3,5,12,6,10,7];
confidence_level = input("confidence level(0,1)>");
alpha = 1-confidence_level ;
xb = mean(sample);
sigma = 5;
sample_size=36;
%we use the first forumula from the conf intervals paper because we know
%sigma, we input the confidence level, and we know the n
theta_lower = xb-sigma/sqrt(sample_size)*norminv(1-alpha/2);
theta_upper = xb-sigma/sqrt(sample_size)*norminv(alpha/2);

fprintf("a) the %2.0f%% confidence interval for the mean is (%5.3f, %5.3f)\n",confidence_level*100, theta_lower, theta_upper)

%b)we don't know sigma, so we use the second formula, with standard
%deviation, std. tinv-student model. sigma e variatie pe toate
%calcultoarele, std e pe sample

theta_lower1 = xb- std(sample)/sqrt(sample_size)*tinv(1-alpha/2, sample_size-1);
theta_upper1 = xb- std(sample)/sqrt(sample_size)*tinv(alpha/2, sample_size-1);
%trebe sa pui si sample_size-1 in tinv(alpha/2, sample_size-1), ca sa stie
%care e nr de trial-uri
fprintf("a) the %2.0f%% confidence interval for the mean is (%5.3f, %5.3f)\n",confidence_level*100, theta_lower1, theta_upper1)

%c)find conf interval for the variance and for standard deviation. so we
%use the formula for the variance

s2=var(sample);
theta_lower2 = (sample_size-1)*s2/chi2inv(1-alpha/2, sample_size-1);
theta_upper2 = (sample_size-1)*s2/chi2inv(alpha/2, sample_size-1);
fprintf("a) the %2.0f%% confidence interval for the variance is (%5.3f, %5.3f)\n",confidence_level*100, theta_lower2, theta_upper2)



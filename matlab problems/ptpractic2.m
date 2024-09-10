clear all
clc

%test for 2 populations
%alpha = input('significance level (0,1) = ');
alpha = 0.05;

%h0: sigma1  = sigma2
%h1: sigma1 =! sigma2 - two-tailed test

X1 = [46 37 39 48 47 44 35 31 44 37];
X2 = [35 33 31 35 34 30 27 32 31 31];
%tail values: -1 for left tailed
%           : 0 for both, default
%           : 1 for rigth tailed
tail = 0;
[h, p, ci, stats] = vartest2(X1,X2,alpha,tail);
%p-P value; ci = confidence level

if h == 0
    fprintf('H0 is not rejected, i.e, sigmas are equal\n');
else 
    fprintf('H0 is rejected, population variances differ \n');
end

q1 = finv(alpha/2, stats.df1, stats.df2);
q2 = finv(1-alpha/2, stats.df2, stats.df1);
fprintf('Observed value is %1.4f\n', stats.fstat);
fprintf('P-value is %1.4f\n', p);
fprintf('Rejection region R is (-inf, %3.4f) U (%3.4f, inf)\n', q1, q2);

% b. assuming sigma_1 != sigma_2, find a 100*(1 - alpha)% confidence
% interval for the difference of the true means

% data samples
X1 = [46 37 39 48 47 44 35 31 44 37];
X2 = [35 33 31 35 34 30 27 32 31 31];
  
% compute the size of the samples and their means
n1 = length(X1);
xbar1 = mean(X1);

n2 = length(X2);
xbar2 = mean(X2);

% find alpha by entering a value of the confidence level
% alpha = 1 - confidence level
%alpha = 1 - input("Input the confidence level: ");
%95% confidence interval => alpha = 0.05  because 95%=100(1-alpha)%
alpha = 0.05;

% ---- CASE 3.3 ----
% for the difference of two population means, miu1-miu2, for large samples
% (n1+n2 > 40) or normal underlying populations, independent samples
% sigma1, sigma2 unknown (the standard deviations) and NOT equal

% FORMULA: 
% miu1-miu2 in (xbar1 - xbar2 - t_{1-alpha/2}*sqrt(s_1^2/n1 + s_1^2/n2),
% xbar1 - xbar2 + t_{1-alpha/2}*sqrt(s_1^2/n1 + s_1^2/n2) )
% where the quantiles refer to the T(n) distribution
% 1/n = c^2/(n1-1) + (1-c)^2/(n_2-1)
% c = (s_1^2/n1)/(s_1^2/n1 + s_2^2/n2);
% s_1^2, s_2^2 are the variances of the sample


% compute the sample variances
var1 = var(X1);
var2 = var(X2);

% compute c and n
c = (var1/n1)/(var1/n1+var2/n2);
n = 1/((c^2/(n1-1) + (1-c)^2/(n2-1)));

% and now the quantiles referring to the T(n) distribution
t1 = tinv(1-alpha/2, n);

% compute the limits of the confidence interval
limit1 = xbar1 - xbar2 - t1*sqrt((var1/n1)+(var2/n2));
limit2 = xbar1 - xbar2 + t1*sqrt((var1/n1)+(var2/n2));

fprintf('The confidence interval for the difference of true means is: (%6.3f,%6.3f)\n',limit1, limit2);
clear all
clc


alpha = 0.01; % 1% significance level

%null hypothesis h0: sigma1  = sigma2 
%alternative hypothesis h1: sigma1 =! sigma2 
% so we will perform a two-tailed test
%tail values: -1 for left tailed
%           : 0 for both, default
%           : 1 for rigth tailed
tail = 0;

X1 = [4.6 0.7 4.2 1.9 4.8 6.1 4.7 5.5 5.4]; %sample test 1

X2 = [2.5 1.3 2.0 1.8 2.7 3.2 3.0 3.5 3.4]; %sample test 2

%the stat test we use is vartest because we need to see if the population
%variances differ
[h, p, ci, stats] = vartest2(X1,X2,alpha,tail);

if h == 0
    fprintf('H0 is not rejected, so the population variances are equal\n');
else 
    fprintf('H0 is rejected, so the population variances differ \n');
end

q1 = finv(alpha/2, stats.df1, stats.df2);
q2 = finv(1-alpha/2, stats.df2, stats.df1);

fprintf('P-value is %1.4f\n', p);
fprintf('Rejection region R is (-inf, %3.4f) U (%3.4f, inf)\n', q1, q2);
fprintf('Observed value for the stat test is %1.4f\n', stats.fstat);

fprintf('\n\npoint b !\n');

% b. assuming sigma_1 != sigma_2, find a 100*(1 - alpha)% confidence
% interval for the difference of the true means


  
% compute the size of the samples and their means
n1 = length(X1);
xbar1 = mean(X1);

n2 = length(X2);
xbar2 = mean(X2);

% find alpha by entering a value of the confidence level
% alpha = 1 - confidence level
%99% confidence interval => alpha = 0.01  because 99%=100(1-alpha)
alpha = 0.01;

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



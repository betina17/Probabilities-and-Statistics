clear all
clc

% confidence interval for the average number of files stored


% data sample
X = [3.26, 1.89, 2.42, 2.03, 3.07, 2.95, 1.39, 3.06, 2.46, 3.35, 1.56, 1.79, 1.76, 3.82, 2.42, 2.96];

% xbar is the mean, n is the size of the sample
n = length(X);
xbar = mean(X);

% 1 - alpha is called confidence level/confidence coefficient
% alpha     is the significance level
% 1 - alpha = confidence level => alpha = 1 - confidence level
%alpha = 1 - input("Input the confidence level: ");
%95% => alpha = 0.05
alpha = 0.05;

% sigma is unknown -> second case
% sigma is the standard deviation
% In this case, sigma is the standard deviation of the sample (lecture 9 pag 4)
sigma = std(X);

% FORMULA FOR CASE 1.2
% miu in (xbar - sigma/sqrt(n)*t_{1-alpha/2}, xbar - sigma/sqrt(n)*t_{alpha/2}
% where
% t_{1-alpha/2}, t_{alpha/2} are quantiles referring to the T(n-1) distribution

% and now compute the quantiles referring to the T(n-1) distribution
t1 = tinv(1-alpha/2,n-1);
t2 = tinv(alpha/2,n-1);

% now compute the confidence limits
limit1 = xbar - sigma/sqrt(n)*t1;
limit2 = xbar - sigma/sqrt(n)*t2;

fprintf('The confidence interval for the average number of stored files is: (%6.3f,%6.3f)\n',limit1,limit2);


% H0 - the null hypothesis
% H0: the number of particles stored exceeds 3
% H0: miu = 3
% H1 - the research hypothesis
% H1: miu <3  (the number of particles stored does not exceed 3
% => we perform a left-tailed test 
fprintf("We are doing a left-tailed test for the mean with sigma unkown\n");

% alpha is the significance level -> 5%
alpha = 0.05

% data set
x = [3.26, 1.89, 2.42, 2.03, 3.07, 2.95, 1.39, 3.06, 2.46, 3.35, 1.56, 1.79, 1.76, 3.82, 2.42, 2.96];
n = length(x);
   
% we want to perform a test for the population mean, the second case, 
% with a large sample but sigma unknown => ttest as TT in T(n-1)

% we know miu (the avg particles)
miu = 3

% ttest -> test for the mean of a population(theta=miu), the case where sigma is unknown
% INPUT : x = the data sample 
%         miu = the population mean
%         alpha = the significance level
%         tail = right 
% OUTPUT: H = indicator which tells us if we reject or do not reject H_0
%         P = critical value of the test (p-value)
%         CI = confidence interval
%         statistics = TS_0 TS when theta = theta0. If TS_0 is in RR => reject H0.
[H,P,CI,statistics] = ttest(x, miu, 'alpha', alpha, 'tail', 'left');

% result of the test, h = 0, if H0 is NOT rejected,
% h = 1, if H0 IS rejected
fprintf('\n H is %d', H)
if H == 1
  fprintf('\n So the null hypothesis is rejected, \n')
  fprintf('i.e the data suggests that the number of particles does not exceed 3')
else
  fprintf('\nSo the null hypothesis is not rejected,\n')
    fprintf('i.e. the data suggests that the number of particles stored  exceeds 3.\n')
end  

% building the rejection region
% RR = (-inf, ttalpha) since it's a left-tailed test
% tt_alpha is the quantile for the T(n-1) distribution
tt_alpha = tinv(alpha, n-1)
RR = [-inf, tt_alpha] % vector with 2 positions

fprintf('\nThe rejection region is (%4.4f, %4.4f)\n', RR);
fprintf('The value of the test statistic z is %4.4f\n', statistics.tstat);
fprintf('The P-value of the test is %4.4f\n\n', P);
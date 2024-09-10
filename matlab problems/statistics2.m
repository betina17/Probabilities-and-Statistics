clear all;
clc;
%first problem from lab6
%a)
sample = [7,7,4,5,9,9,4,12,8,1,8,7,3,13,2,1,17,7,12,5,6,2,1,13,14,10,2,4,9,11,3,5,12,6,10,7];
%sigma = input("Input the significance level>"); %at most 0.1
%theta=the mean, because the key is "on average"
%H0(null hyphotesis)=theta is 8.5 million
%H1(bad case)= theta < 8.5 million (so we will do a left-tailed
%test)
%here we interpret the story from the problem, that's what we do at start
%we work on case one(36 entries in the vector), adn we know sigma is 5, so
%we work with the normal distribution model N(0,1)
%we want to compute the rejection region RR
%left-tailed test results that RR is (-inf, norminv(alpha, 0, 1))
%tt from the file means quantile of order alpha, quantile se calculeaza cu inv,
% iar normal model e norm(0,1), so tt is is  (-inf, norminv(alpha, 0, 1))
%RR = [-inf, norminv(sigma, 0,1)];
%[h,p,ci,zval] = ztest(x,mean,sigma, alpha, tail);
%[h, p, ci, zval] = ztest(x, 8.5, sigma, alpha, -1);
%m=8.5
%left-tailed=> tail=-1, right-tailed=>tail=1, two-tailed=>tail=0
%h={1, we reject H0 -responds to the question: is the standard met? answer:
%no
%{0, we don't reject H0, so the standard is met
%p-p value
%ci-confidence interval
%left-tailed: the confidence interval will be given between -inf to a bound
%right-tailed: will be between from bound to inf
%bilateral: from bound to bound
%this happens because ci are not uique. to compute them, we better use the
%formula from the statistics1, not this one
%zval=we get the observed value TS0. we did a z test and we obtain a zvalue
%(zval)

%b)
%theta = mean
%H0: theta =5.5
%H1: theta > 5.5 (exceeds = strictly higher) (right-tailed test)
%case one, subcase 2(don't know sigma)-we work with the T model
%RR=(tinv(1-alpha, n-1), inf)
%[H,P,Ci,STATS] = test(X, M, ALPHA, TAIL)
%x is the sample
%stats = structure variable, it has 4 param: tstat=TS0(the observed value),
%df=n-1(degree of freedom), sd=an approximation of sigma
%m=5.5
%tail=1
alpha = 0.01
n=36
rr = (tinv(1-alpha, n-1), inf)
[h,p,ci, stats] = ttest(x,5.5, alpha, 1)






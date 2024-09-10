%prob 2
%a)sigma1 squared is equal to sigma2 squared, or are they different?
%the variance=sigma squared
%so we use the fourth case
%theta=ratio between variance1 and variance2
%H0: theta =1 (if the ratio is 1, then the variances are equal
%H1: theta!=1(they are different)
%bilateral test
%fisher model
%[h,p,ci,stats]=vartest2(x,y,alpha, tail)
%called vartest because we test the variances of two populations
%x,y=the two sets, tail=0
%stats: fst=TS0, df1=n1-1, df2=n2-1
%b)mean1>mean2
%we use the 3rd case
%the question is: is mean1>mean2?
%theta=mean1-mean2
%H0: theta=0 (the difference is 0)
%H1: theta>0(right-tailed test)
%if the variances are equal, the standard deviations are equal. if they are
%eqaul(which we found at a), we use subcase 2, if not, subcase 3, or
%something like that
%%[h,p,ci,stats]=ttest2(x,y,alpha, tail, vartype)
%in vartype we put "equal" or "unequal" depending on what we obtained at a)
%in part b we will have an if else and inside another if else
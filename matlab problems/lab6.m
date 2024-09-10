clear all
clc
userInput =  input("Select model: norm, t, chi2, f>", 's')
switch userInput
    case "norm"
        fprintf("you have selected the norm model\n")
        fprintf("now input the niu and the sigma parameter\n")
        niu = input("niu>")
        sigma=input("sigma>")
        a1=normcdf(0, niu, sigma)
        a2=1-a1
    case "t"
        fprintf("you have selected the t model\n")
        fprintf("now input the n parameter\n")
        n=input("n>")
        a1=tcdf(0, n)
        a2=1-a1
    case "chi2"
        fprintf("you have selected the chi2 model\n")
        frpintf("now input the n parameter")
        n=input("n>")
        a1=chi2cdf(0, n)
        a2=1-a1
    case "f"
        fprintf("you have selected the f model\n")
        fprintf("now input the m and n parameters")
        m=input("m>")
        n=input("n>")
        a1=fcdf(0, m, n)
        a2=1-a1
    otherwise 
        frpintf("invalid option")
end
fprintf("p(x<=0)=%9.5f", a1)
fprintf("p(x>=0)=%9.5", a2)

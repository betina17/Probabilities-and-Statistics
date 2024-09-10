clear all
clc
clf
p= input("Introduce the probability of success for each simulation>")
n=input("Introduce the number of trials for each simulation>")
s = input("Introduce the number of simulations you want to be performed>")
U = rand(n,s)
M = U<p
x = sum(M) %matrix of sum of elements on column 
unique_elem_of_x = unique(x); %va da 0,1,2 sau 3
nr_occ_of_these_elems = hist(x, length(unique_elem_of_x));
%[unique_elem_of_x; nr_occ_of_these_elems]
freq = nr_occ_of_these_elems / s; %1/5 sau 2/5 sau 3/5
%[unique_elem_of_x; freq]
%subplot(2, 1,1)
%title("Binomial simulator")
plot(unique_elem_of_x, freq)
hold on 
%subplot(2,1,2)
plot(0:n, binopdf(0:n, n, p))
%legend("x", "My try", "o", "Computer try")
hold off


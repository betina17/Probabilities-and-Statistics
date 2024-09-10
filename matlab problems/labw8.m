clear all 
clc
p=-1
while p<=0 || p>=1
    p= input("Introduce the probability of success, between 0 and 1>")
end
s = input("Introduce the number of simulations you want to be performed>")
U = rand(1,s) %matlab(matrix lab) lucreaza cu matrici, punem toate nr random generate intr-o matrice 
                %de s elem. here we have 1 trial
x = U<p
% if p=0.7, we should get 7 1s and 3 0s
unique_elem_of_x = unique(x); %va da 0 si 1
nr_occ_of_these_elems = hist(x, length(unique_elem_of_x));
[unique_elem_of_x; nr_occ_of_these_elems]
freq = nr_occ_of_these_elems / s;
[unique_elem_of_x; freq]
clc
clear all
A=[1 2 3 4 5 6;2 3 4 5 6 1;3 4 5 6 1 2;4 5 6 1 2 3;5 6 1 2 3 4;6 1 2 3 4 5];
B=[1 2 3 4 5 6;2 3 4 5 6 1;3 4 5 6 1 2;4 5 6 1 2 3;5 6 1 2 3 4;6 1 2 3 4 5];
C=[1 2 3 4 5 6;2 3 4 5 6 1;3 4 5 6 1 2;4 5 6 1 2 3;5 6 1 2 3 4;6 1 2 3 4 5];
P=[];
F=[];
n_sa=6;
tol=[2 3 4];

for i=1:n_sa
    for j=1:n_sa
        for k=1:n_sa
            D=[A(i,:) B(j,:) C(k,:)];
            E=fitness(D,n_sa,tol);
            P=[P;D];
            F=[F;E];
        end
    end
end

[m,index]=max(F);
permbest=P(index,:)
fitbest=-(log(m))./0.05
Z=fitness(permbest,n_sa,tol)